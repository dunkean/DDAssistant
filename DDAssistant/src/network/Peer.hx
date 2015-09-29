package network;

/**
 * Network peer for the D&D Combat Assistant
 * @author dunkean
 * @version 0.1
 */
 
import DDAssistant;
import sys.net.Host;
import sys.net.Socket;
import cpp.vm.Thread;
import utils.UUID;


class Peer
{
	private static inline var PORT: Int = 31337;
	
	private var socket: Socket;
	private var peers:Array<PeerInfo>;
	//private var peersListener:Map<String, PeerListener>;
	
	public function new() {
		try {
			trace('Launching P2P service');
			socket = new Socket();
			socket.bind(new Host('0.0.0.0'), PORT);
			socket.listen(10);
		} catch (z:Dynamic) {
			trace('Could not bind to port.\n');
			trace('Ensure that no server is running on port ' + PORT + '.\n');
			return;
		}
		peers = [];
		
		trace('P2P service up.\n');
		Thread.create(listenConnections);
		exploreLan();
	}
	
	private function exploreLan() {
		trace('Exploring network.\n');
		for (i in 0...255) {
			Thread.create(connect("192.168.0." + i));
			Thread.create(connect("192.168.1." + i));
		}
	}
	
	private function connect(ip) {
		return function() {
			try {
				var sk = new Socket();
				sk.connect(new Host(ip), PORT);
				var peer = new PeerInfo(sk);
				trace('Client > Connected to server ' + peer.toString());
				Thread.create(listenMessages(peer));
				peer.send('uuid', DDAssistant.uuid);
				peer.send('name', DDAssistant.name);
			}catch (e:Dynamic) {
			}
		}
	}
	
	/** Accepts new sockets and spawns new threads for them */
	function listenConnections() {
		while (true) {
			var sk = socket.accept();
			if (sk != null) {
				var peer = new PeerInfo(sk);
				trace('Server > Connected to client ' + peer.toString());
				Thread.create(listenMessages(peer));
				peer.send('uuid', DDAssistant.uuid);
				peer.send('name', DDAssistant.name);
			}
		}
	}

	/** Creates a new thread function to handle given Peer */
	function listenMessages(cl:PeerInfo) {
		return function() {
			peers.push(cl);
			while (cl.active) {
				try {
					var header = cl.socket.input.readLine();
					var content = cl.socket.input.readLine();
					if (cl.active)
						trace('socket message: $header > $content');
					//var content = cl.socket.input.readAll().toString();
					//if (cl.active)
						//trace('socket message: $content');
				} catch (z:Dynamic) {
					trace("unable to read socker $cl");
					break;
				}
			}
			//broadcast(cl.name + ' disconnected.\n');
			peers.remove(cl);
			try {
				cl.socket.shutdown(true, true);
				cl.socket.close();
			} catch (e:Dynamic) {
				
			}
		}
	}
	
}
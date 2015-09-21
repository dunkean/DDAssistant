package ddassistant.network;

/**
 * Network management of the DDAssistant
 * @author dunkean
 */
 
import sys.net.Host;
import sys.net.Socket;
import cpp.vm.Thread;
import ddassistant.utils.UUID;

class Peer
{
	private static inline var PORT: Int = 31337;
	
	public var uuid:String;
	public var name:String;
	
	private var socket: Socket;
	private var peers:Array<PeerInfo>;
	private var peersListener:Map<String, PeerListener>;
	
	public function new(?id: String, ?nam: String) {
		if (nam == null) name = ''; else name = nam;
		if (id == null) uuid = UUID.uuid(16,16);  else uuid = id;
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
				trace('Connected to client ' + ip);
				//var peerId = sk.input.readLine();
				//var peerName = sk.input.readLine();
				//var peer = new PeerInfo(sk, peerId, peerName);
				var peer = new PeerInfo(sk);
				trace('Connected to client ' + peer.toString());
				Thread.create(listenMessages(peer));
				peer.send('ID', uuid);
				peer.send('Name', name);
			}catch (e:Dynamic) {
				//connection failed
				//trace("failed ", ip);
			}
		}
	}
	
	/** Accepts new sockets and spawns new threads for them */
	function listenConnections() {
		while (true) {
			var sk = socket.accept();
			if (sk != null) {
				//sk.output.writeString(uuid);
				//sk.output.writeString(name);
				//var peerId = sk.input.readLine();
				//var peerName = sk.input.readLine();
				var peer = new PeerInfo(sk);
				trace('Connected to client ' + peer.toString());
				Thread.create(listenMessages(peer));
			}
		}
	}

	/** Creates a new thread function to handle given Peer */
	function listenMessages(cl:PeerInfo) {
		return function() {
			peers.push(cl);
			while (cl.active) {
				try {
					var text = cl.socket.input.readLine();
					if (cl.active)
						trace(text);
				} catch (z:Dynamic) {
					
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
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
	
	private static var socket: Socket = new Socket();
	private static var peers:Array<PeerInfo> = [];
	private static var myIp: String;
	
	public static function start() {
		createServerSocket();
		DDAssistant.console(DDAssistant.uuid + ' Exploring network...');
		for (i in 0...255) {
			Thread.create(Peer.connect("192.168.0." + i));
			Thread.create(Peer.connect("192.168.1." + i));
		}
	}
	
	//Server
	/** Create server socket and thread connections listening */
	public static function createServerSocket() {
		try {
			socket.bind(new Host('0.0.0.0'), PORT);
			socket.listen(10);
		} catch (z:Dynamic) {
			DDAssistant.console(DDAssistant.uuid + ' Could not bind to port.\n');
			DDAssistant.console(DDAssistant.uuid + ' Ensure that no server is running on port ' + PORT + '.\n');
			return;
		}
		DDAssistant.console('Server socket up.');
		Thread.create(Peer.listenClientsConnections);
	}
	
	/** Accepts new sockets and spawns new threads for them */
	private static function listenClientsConnections() {
		while (true) {
			var sk = socket.accept();
			if (sk != null) {
				var doNotConnect = false;
				if (sk.host().host.ip == sk.peer().host.ip)
					doNotConnect = true;
				for (peer in peers) {
					if (peer.socket.peer().host.ip == sk.peer().host.ip) {
						doNotConnect = true;
					}
				}
				
				if (doNotConnect) {
					try {
						sk.shutdown(true, true);
						sk.close();
					} catch (e:Dynamic) {
					}
					return;	
				}
				
				var peer = new PeerInfo(sk);
				peers.push(peer);
				DDAssistant.console(DDAssistant.uuid + " connect client " + peer.toString());
				Thread.create(Peer.listenMessages(peer));
				peer.send(SyncMessage.newHandshakeMessage());
				SyncManager.sendAllMySyncables(peer);
			}
		}
	}
	
	//CLIENT SIDE
	/** Socket connection request */
	private static function connect(ip: String) {
		return function() {
			try {
				var sk = new Socket();
				sk.connect(new Host(ip), PORT);
				var peer = new PeerInfo(sk);
				if (sk.host().host.ip == sk.peer().host.ip) {
					try {
						sk.shutdown(true, true);
						sk.close();
					} catch (e:Dynamic) {
							
					}
					return;	
				}
				DDAssistant.console(DDAssistant.uuid + " Connecting server " + peer.toString());
				peers.push(peer);
				Thread.create(Peer.listenMessages(peer));
				peer.send(SyncMessage.newHandshakeMessage());
				SyncManager.sendAllMySyncables(peer);
			}catch (e:Dynamic) {
			}
		}
	}
	
	//P2P 
	/** Creates a new thread function to handle given Peer */
	private static function listenMessages(cl:PeerInfo) {
		return function() {
			while (cl.active) {
				try {
					var content = cl.socket.input.readLine();
					DDAssistant.console(DDAssistant.uuid + " New Message >\n" + content);
					var message = SyncMessage.parseMessage(content);
					processMessage(message, cl);
				} catch (z:Dynamic) {
					cl.active = false;
					DDAssistant.console(DDAssistant.uuid + " Unable to read socket " + cl.toString());
					break;
				}
			}
			//broadcast(cl.name + " disconnected.\n");
			peers.remove(cl);
			try {
				cl.socket.shutdown(true, true);
				cl.socket.close();
			} catch (e:Dynamic) {
				
			}
		}
	}
	
	//@TODO manage peer deactivation
	/** Broadcast method */
	public static function broadcast(msg: String) {
		for (peer in peers) {
			DDAssistant.console("Sending to " + peer.toString() + ' > ' + msg);
			peer.send(msg);
		}
	}
	
	private static function processMessage(syncMessage: SyncMessage, peer: PeerInfo) {
		if (syncMessage.senderId == DDAssistant.uuid) { //It's me !!
			DDAssistant.console(DDAssistant.uuid + " it's me");
			peers.remove(peer);
			try {
				peer.socket.shutdown(true, true);
				peer.socket.close();
			} catch (e:Dynamic) {
				
			}
			return;
		}
		switch(syncMessage.type) {
			case "assistant":
				peer.name = syncMessage.senderName;
				peer.uuid = syncMessage.senderId;
			default:
				SyncManager.remoteMessage(syncMessage, peer);
		}
	}
	
}
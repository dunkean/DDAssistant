package network;

/**
 * Simple class for peers info
 * @author dunkean
 * @version 0.1
 */

import utils.UUID;
import sys.net.Socket;

class PeerInfo
{
	public var uuid:String;
	public var name:String;
	public var socket:Socket;	
	public var active:Bool;
	
	public function new(skt:Socket) {
		socket = skt;
		active = true;
	}
	
	public function toString():String {
		var peer = socket.peer();
		var pstr = Std.string(peer.host) + ':' + peer.port;
		var name = ((name == null) ? 'noname' : name);
		var uuid = ((uuid == null) ? 'nouuid' : uuid);
		return name + "-" + uuid + ": " + pstr;
	}
	
	//@TODO manage peer deactivation and reconnection
	public function send(msg: String) {
		try {
			socket.output.writeString(msg + "\n");
		} catch (z:Dynamic) {
			active = false; 
		}
	}
	
}
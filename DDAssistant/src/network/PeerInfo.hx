package network;

/**
 * Simple class for peers info
 * @author dunkean
 * @version 0.1
 */

import sys.net.Socket;
import utils.UUID;

class PeerInfo
{
	public var uuid:String = "";
	public var name:String = "";
	public var socket:Socket;	
	public var active:Bool;
	
	public function new(skt:Socket) {
		socket = skt;
		active = true;
	}
	
	public function toString():String {
		var peer = socket.peer();
		var pstr = Std.string(peer.host) + ':' + peer.port;
		return "";
		//return ((name == null) ? 'noname' : name)
				//+ '-' + ((uuid == null) ? 'nouuid' : uuid)
				//+ '-' + pstr;
	}
	
	//@TODO manage peer deactivation
	public function send(msg: String) {
		try {
			trace("Sending > " + msg);
			socket.output.writeString(msg + "\n");
		} catch (z:Dynamic) {
			active = false; 
		}
	}
	
}
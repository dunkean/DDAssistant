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
	public var uuid:String;
	public var name:String;
	public var socket:Socket;	
	
	public var active:Bool;
	
	public function new(skt:Socket, ?id: String, ?nam: String) {
		socket = skt;
		if (nam == null) name = ''; else name = nam;
		if (id == null) uuid = ''; else uuid = id;
		active = true;
	}
	
	
	public function toString():String {
		var peer = socket.peer();
		var pstr = Std.string(peer.host) + ':' + peer.port;
		return name + '-' + uuid + '-' + pstr;
	}
	
	
	public function send(header:String, content:String) {
		try {
			socket.output.writeString(header + "\n");
			socket.output.writeString(content + "\n");
		} catch (z:Dynamic) {
			active = false; //TODO manage deactivation ?
		}
	}
	
}
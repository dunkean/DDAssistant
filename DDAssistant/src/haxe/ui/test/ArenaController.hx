package haxe.ui.test;


import ddassistant.network.Peer;
import ddassistant.utils.UUID;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;
import haxe.xml.Check.Attrib;
import sys.net.Host;
import sys.net.Socket;
import cpp.vm.Thread;


@:build(haxe.ui.toolkit.core.Macros.buildController ("ui/Arena.xml"))
class ArenaController extends XMLController {
	//public static var serverSocket: Socket;
	//public static var clientSocket: Socket;
	//public static var comSocket: Socket;
	//
	////public static var server: hxnet.tcp.Server;
	////public static var client: hxnet.tcp.Client;
	////public static var clientProtocol: ArenaClient;
	//
	//
	//function getThreadListen() {
		//while (true) {
			////trace('reading');
			//try {
				//var text = comSocket.input.readLine();
				//if (text.length == 0) trace ('NOTHING')
				//else trace(text);
			//} catch (z:Dynamic) {
				//trace("DISCO");
				//try {
					//comSocket.shutdown(true, true);
					//comSocket.close();
					//serverSocket.shutdown(true, true);
					//serverSocket.close();
					//
				//} catch (e:Dynamic) {
					//
				//}
			//}
		//}
	//}
	//
	//var iteration: Int = 0;
	//function threadAccept() {
		//while (iteration < 1000) {
			//iteration++;
			//trace('listening >' + iteration);
			//comSocket = serverSocket.accept();
			//if (comSocket != null) {
				//trace('Connecting client');
				//Thread.create(getThreadListen);
			//}
		//}
	//}
	//var server : ServerExample;
	public var x(get, set):Int;
	
	// required by field x
	function get_x() return 1;

	// required by field x
	function set_x(x) { 
		trace(x);
		return x;
	}
  
	public function new() {
		//trace(x);
		//Reflect.setField(this, "x", 7);
		//trace(x);
		//x = 8;
		//trace(x);
		//
		//myButton.addEventListener (UIEvent.CLICK, myButtonClicked);
		//new Peer();
		
		
		//new ServerExample();
		//server = new ServerExample();
		//Thread.create(launchServer);
		////Client
		//try{
		//trace("opening connection");
		//var sock = new Socket();
		//sock.connect(new Host("192.168.0.15"), 1234);
		//
		//trace("sending messages");
		//sock.write("this is a test.");            Sys.sleep(.1);
		//sock.write("this is another test.");      Sys.sleep(.1);
		//sock.write("this is a third test.");      Sys.sleep(.1);
		//sock.write("this is the last test.");
//
		//sock.close();
		//trace("client done");
		//}catch (e: Dynamic) {
			//trace(e);
		//}
		//
		
		//trace(UUID.uuid(12,16));
	}
	
	public function launchServer() {
		//server.run("0.0.0.0", 1234);
	}
	
	//private function threadPing(ip) {
		//return function() {
			//try {
				//var socket = new Socket();
				//trace("trying " + ip);
				//socket.connect(new Host(ip), 2223);
				//trace("connected to " + ip);
				//clientSocket = socket;
			//}catch (e:Dynamic) {
				//trace("Unable to connect to " + ip);
			//}
		//}
	//}
	//
	//private function connectServer(e:UIEvent):Void {
		//var ipSuffix:Int = 255;
		//while (ipSuffix >= 0) {
			//Thread.create(threadPing("192.168.0." + ipSuffix));
			//ipSuffix--;
			//trace(ipSuffix);
		//}
		//
	//}
	//
//
	//private function startServer (e:UIEvent):Void {
		//var test = "";
		//for (i in 0 ... 100)
			//test += "jfkelzjfkelzjfkezlfjezklfjezkflejzkflezjfkezljfkezlfjezklfjezkflejzkflezjfkezljfklezf*-*";
		//clientSocket.write("STARTING CHUNK - ");            Sys.sleep(.1);
		//clientSocket.output.writeString(test);      Sys.sleep(.1);
		//clientSocket.output.writeString("- ENDING CHUNK\n");      Sys.sleep(.1);
        //
    //}
	
}

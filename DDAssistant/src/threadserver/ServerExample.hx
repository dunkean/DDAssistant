package threadserver;

import sys.net.Socket;
import cpp.net.ThreadServer;
import haxe.io.Bytes;

typedef Client = {
  var id : Int;
}

typedef Message = {
  var str : String;
}

class ServerExample extends ThreadServer<Client, Message>
{
  // create a Client
  override function clientConnected( s : Socket ) : Client
  {
    var num = Std.random(100);
    trace("client " + num + " is " + s.peer());
    return { id: num };
  }

  override function clientDisconnected( c : Client )
  {
    trace("client " + Std.string(c.id) + " disconnected");
  }

  override function readClientMessage(c:Client, buf:Bytes, pos:Int, len:Int)
  {
    // find out if there's a full message, and if so, how long it is.
    var complete = false;
    var cpos = pos;
    while (cpos < (pos+len) && !complete)
    {
     //check for a period/full stop (i.e.:  "." ) to signify a complete message 
      complete = (buf.get(cpos) == 46);
      cpos++;
    }

    // no full message
    if( !complete ) return null;

    // got a full message, return it
    var msg:String = buf.getString(pos, cpos-pos);
    return {msg: {str: msg}, bytes: cpos-pos};
  }

  override function clientMessage( c : Client, msg : Message )
  {
    trace(c.id + " sent: " + msg.str);
  }

  public static function main()
  {
      var server = new ServerExample();
      server.run("localhost", 1234);
  }
}
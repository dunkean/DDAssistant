package threadserver;

import neko.Lib;
import neko.Sys;
import sys.net.Host;
import sys.net.Socket;

class ClientExample
{
  public static function main()
  {
      trace("opening connection");
      var sock = new Socket();
      sock.connect(new Host("localhost"), 1234);

      trace("sending messages");
      sock.write("this is a test.");            Sys.sleep(.1);
      sock.write("this is another test.");      Sys.sleep(.1);
      sock.write("this is a third test.");      Sys.sleep(.1);
      sock.write("this is the last test.");

      sock.close();
      trace("client done");
  }
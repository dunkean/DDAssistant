package;
import haxe.Json;
import haxe.Serializer;
import haxe.Unserializer;

/**
 * ...
 * @author dunkean
 */
	class DDResource {
		public function new() { trace("NEW"); };
		@:optional public var int(default, set): Int;
		public function set_int(newInt) { trace("set int catched");  return int = newInt; }
		@:optional public var string: String;
		@:optional public var obj: DDResource;

		@:optional public var stringArray: Array<String>;
		@:optional public var intArray: Array<Int>;
		@:optional public var objArray: Array<DDResource>;
		
		@:optional public var mapStringString:Map<String, String>;
		@:optional public var mapIntString:Map<Int, String>;
		@:optional public var mapStringInt:Map<String, Int>;
		@:optional public var mapStringObj:Map<String, DDResource>;
	}
		
class Test
{
		
	public function new() 
	{
		trace("*************");
		trace("Testing $srcJson2");
		try {
			var map1:Map<String, String> = ["1" => "one", "2" => "two"];
			var obj = new DDResource();
			obj.mapStringString = map1;
			trace("Setting obj.int to -1");
			obj.int = -1;
			var serObj = Serializer.run(obj);
			trace(serObj);
			var unserObj = Unserializer.run(serObj);
			trace("Setting unserObj.int to -1");
			unserObj.int = -1;
			var unserObj: DDResource = Unserializer.run(serObj);
			trace("Setting typed unserObj.int to -1");
			unserObj.int = -1;
			trace("*************");
		}catch (e: Dynamic) {
			trace(e);
		}
		
	}
	
}


//trace("Start Test");
		//var srcJson1 = '{"int":1, "string":"testString"}';
		//var srcJson2 = '{"obj":{"int":22}';
		////var srcJson1 = '{"int":3, "string":testString}';
		//var map1:Map<String, String> = ["1" => "one", "2" => "two"];
		//var map2 = ["one" => 1, "two" => 2, "three" => 3];
		//var map3:Map<Int, String> = [1 => "one", 2 => "two"];
		//var map4 = ["1"=>map1, "2"=>map1, "3"=>map1];
		//try {
			//trace(map1);
			//var map1Json = Json.stringify(map1);
			//trace(map1Json);
			//var map1Revert = Json.parse(map1Json);
			//trace(map1Revert);
			//trace(Json.stringify(map1Revert));
			//trace("**************");
			//trace(map2);
			//map1Json = Json.stringify(map2);
			//trace(map1Json);
			//var map1Revert = Json.parse(map1Json);
			//trace(map1Revert);
			//trace(Json.stringify(map1Revert));
			//trace("**************");
			//trace(map3);
			//map1Json = Json.stringify(map3);
			//trace(map1Json);
			//var map1Revert = Json.parse(map1Json);
			//trace(map1Revert);
			//trace(Json.stringify(map1Revert));
			//trace("**************");
			//trace(map4);
			//map1Json = Json.stringify(map4);
			//trace(map1Json);
			//var map1Revert = Json.parse(map1Json);
			//trace(map1Revert);
			//trace(Json.stringify(map1Revert));
		//}catch (e: Dynamic) {
			//trace("CATCH");
			//trace(e);
		//}
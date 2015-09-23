package haxe.ui.test;

import ddassistant.models.Arena;
import haxe.crypto.Md5;
import haxe.io.Bytes;
import haxe.ui.toolkit.containers.Stack;
import haxe.ui.toolkit.controls.TabBar;
import haxe.ui.toolkit.core.Macros;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.resources.ResourceManager;
import haxe.ui.toolkit.themes.GradientTheme;

class Main {
	
	
  
	public static function main() {
		var arena = new Arena();
		arena.round = 2;
		trace(arena);
		var serObj = Serializer.run(arena);
		trace(serObj);
		var unserObj: Arena = Unserializer.run(serObj);
		trace(unserObj);
		trace(unserObj.round);
		
		
		
		//var str = '{"test":{"toto":{"mama":["berer","flmekfl"],"bobo":12},"active":true}}';
		//trace(Md5.encode(str));
		//x = 8;
		//return;
		//var test = {
			//toto: {
				//mama: ["berer", "flmekfl"],
				//bobo: 12
			//},
			//active: true
		//};
		//trace(Json.stringify(test));
		//var test = haxe.Json.parse(str);
		//trace(test);
		//trace(Json.stringify(test));
		//trace(Reflect.field(Reflect.field(test, "toto"),"bobo"));
		//trace(test.toto.bobo);
		
		//Context.parse('{ test.toto.bobo = 14; }', Context.currentPos());
		//trace(Json.stringify(test));
		//
		//var data:String='{"data":{"0":0,"1":1},"method":{"test": 15}}';
		//var res = haxe.Json.parse(data);
		//trace(Reflect.field(Reflect.field(res, "method"),"test"));
		////for (n in Reflect.fields(res))
			////trace(n);
		//return;
		
		
		
		Toolkit.theme = new GradientTheme();
		Toolkit.setTransitionForClass(Stack, "none");
		Toolkit.init();
		Toolkit.openFullscreen(function(root:Root) {
			var controller = new ArenaController();
			root.addChild(controller.view);
			//try{
				//trace(Json.stringify(controller));
			//}catch (e: Dynamic) {
				//trace(e);
			//}
		});
	}
}

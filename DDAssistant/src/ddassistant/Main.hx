package ddassistant;

/**
 * Main class of DDAssistant
 * @author dunkean
 */

import ddassistant.sync.UserModel;
import ddassistant.sync.UserView;
import haxe.ui.toolkit.containers.Stack;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.themes.GradientTheme;

class Main {
    static function main() {
        var user = new UserModel("deep", 100);
        var view = new UserView();
        view.user = user; 
        //> TextField::text changed to: Hello deep. You have 100 coins
        //> user health changed from null to 1
        
        user.coins = 200; //> TextField::text changed to: Hello deep. You have 200 coins
        
        //user.health = 0.5; //> user health changed from 1 to 0.5
        
        view.user = null;
        
        user.name = "profelis";
        
        view.user = user;
        //> TextField::text changed to: Hello profelis. You have 200 coins
        //> user health changed from null to 1
        
        view.user.coins = 300; //> TextField::text changed to: Hello profelis. You have 300 coins
        
        user.health = 0.75; //> user health changed from 1 to 0.75
		
		Toolkit.theme = new GradientTheme();
		Toolkit.setTransitionForClass(Stack, "none");
		Toolkit.init();
		Toolkit.openFullscreen(function(root:Root) {
			var controller = new DDAssistant();
			root.addChild(controller.view);
		});
	}
}

//

//var arena = new Arena();
		//arena.round = 2;
		//trace(arena);
		//var serObj = Serializer.run(arena);
		//trace(serObj);
		//var unserObj: Arena = Unserializer.run(serObj);
		//trace(unserObj);
		//trace(unserObj.round);
		
		
		
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
package;

import haxe.Json;
import haxe.Serializer;
import haxe.Unserializer;
import models.TestClass;
import models.TestClass2;
import models.Player;
import haxe.ui.toolkit.containers.Stack;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.themes.GradientTheme;
import network.Syncable;
import network.SyncSerializer;
/**
 * Main class for the DDCombatAssistant
 * @author dunkean
 * @version 0.1
 */
class Main
{

	public function new() 
	{
		//super();
		Toolkit.theme = new GradientTheme();
		Toolkit.setTransitionForClass(Stack, "none");
		Toolkit.init();
		Toolkit.openFullscreen(function(root:Root) {
			var controller = new DDAssistant();
			root.addChild(controller.view);
		});
	}
}




////var testClass = new models.TestClass();
		////testClass.test1 = "TEST1";
		////testClass.test2 = "TEST2";
		////testClass.serialize();
		////testClass = new models.TestClass("OWNID");
		////testClass.test1 = "TEST1";
		////testClass.test2 = "TEST2";
		////testClass.serialize();
		////
		////var testClass2 = new models.TestClass2();
		////testClass2.test1 = "TEST1-2";
		////testClass2.test2 = "TEST2-2";
		////testClass2.serialize();
		////testClass2 = new models.TestClass2("OWNID-2");
		////testClass2.test1 = "TEST1-2";
		////testClass2.test2 = "TEST2-2";
		////testClass2.serialize();
		////
		//var player = new Player();
		//player.Charisma = "13";
		////player.Strength = "10";
		////player.Intelligence = "18";
		////Reflect.setField(player, "Wisdom", "14");
		////player.uuid = "TESTEST";
		//var stringified = SyncSerializer.encode(player);
		//DDAssistant.console(stringified);
		//var player2:Player = SyncSerializer.decode(stringified, "models.Player");
		//var test:Dynamic = player2;
		//////var player2: Player = EXTJsonSerialization.decode<Player>(stringified, Type.getClass(player));
		//test.Strength = "1515";
		//DDAssistant.console(SyncSerializer.encode(test));
		////DDAssistant.console(Type.getClassName(Type.getClass(player2)));
		////var test: TestClass = Type.createInstance(Type.resolveClass("models.TestClass"), []);
		////var test2 = Type.createInstance(Type.resolveClass("models.TestClass"), []);
		////DDAssistant.console(Type.getClassName(Type.getClass(test)));
		////DDAssistant.console(Type.getClassName(Type.getClass(test2)));
		////test.test1 = "12";
		////test2.test1 = "12";
		////Reflect.setProperty(test2, "test1", "18");
		////test2.Strength = "19";
		//
		////for (field in Reflect.fields(test))
			////DDAssistant.console(field);
			//
		////for (field in Reflect.fields(test2))
			////DDAssistant.console(field);
		//
		////player.Strength = "12";
		////test.Charisma = "13";
		////DDAssistant.console(Json.stringify(test));
		//
		//
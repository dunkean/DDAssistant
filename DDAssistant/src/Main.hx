package;


import haxe.Json;
import models.TestClass;
import models.TestClass2;
import models.Player;
import haxe.ui.toolkit.containers.Stack;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.themes.GradientTheme;
/**
 * Main class for the DDCombatAssistant
 * @author dunkean
 * @version 0.1
 */
class Main
{

	public function new() 
	{
		//var testClass = new models.TestClass();
		//testClass.test1 = "TEST1";
		//testClass.test2 = "TEST2";
		//testClass.serialize();
		//testClass = new models.TestClass("OWNID");
		//testClass.test1 = "TEST1";
		//testClass.test2 = "TEST2";
		//testClass.serialize();
		//
		//var testClass2 = new models.TestClass2();
		//testClass2.test1 = "TEST1-2";
		//testClass2.test2 = "TEST2-2";
		//testClass2.serialize();
		//testClass2 = new models.TestClass2("OWNID-2");
		//testClass2.test1 = "TEST1-2";
		//testClass2.test2 = "TEST2-2";
		//testClass2.serialize();
		//
		var player = new Player();
		player.Charisma = "13";
		player.Strength = "10";
		player.Intelligence = "18";
		Reflect.setField(player, "Wisdom", "14");
		trace(Json.stringify(player));
		
		Toolkit.theme = new GradientTheme();
		Toolkit.setTransitionForClass(Stack, "none");
		Toolkit.init();
		Toolkit.openFullscreen(function(root:Root) {
			var controller = new DDAssistant();
			root.addChild(controller.view);
		});
	}

}

package;

import haxe.Json;
import haxe.Serializer;
import haxe.Unserializer;
import models.BaseElement;
import models.DiceType;
import models.Dice;
import models.Damage;
import models.magic.Spell;
//import models.SpellDB;
import models.TestClass;
import models.TestClass2;
import models.Player;
import haxe.ui.toolkit.containers.Stack;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.themes.GradientTheme;
import network.Syncable;
import network.SyncSerializer;
import flash.Lib;
import models.magic.SorcererSpellBook;

import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;

/**
 * Main class for the DDCombatAssistant
 * @author dunkean
 * @version 0.1
 */
class Main extends ru.stablex.ui.widgets.Widget
{

	public static function main():Void
	{
		
		
		//Toolkit.theme = new GradientTheme();
		//Toolkit.setTransitionForClass(Stack, "none");
		//Toolkit.init();
		//Toolkit.openFullscreen(function(root:Root) {
			//var controller = new DDAssistant();
			//root.addChild(controller.view);
	////		var spellDB = new SpellDB();
		//});
	//	flash.Lib.current.addChild( UIBuilder.buildFn('sample.xml')() );
	
		//var s1:Spell = new Spell();
		//s1.damage = new Damage( BaseElement.Acid, new Dice(2, DiceType.D6) );
		//s1.damage.addDamage( BaseElement.Cold , "2d20");
		//s1.damage.addDamage( BaseElement.Cold , "2.5d20");
		//DDAssistant.console('S1: ' + s1.damage.roll() );
		
	}
}
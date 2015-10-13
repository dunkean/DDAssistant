package views;
import haxe.ui.toolkit.core.DisplayObject;
import models.Player;
import models.SpellBook;
import models.SorcererSpellBook;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.controls.Text;
/**
 * First test view (abilities)
 * @author dunkean
 * @version 0.0
 */

 
@:build(haxe.ui.toolkit.core.Macros.buildController("ui/spellbook.xml"))
class SpellBookView extends XMLController
{
	public function new(player:Player) 
	{
		DDAssistant.console("creating spell book view and player spell book");
//		new hxcpp.DebugStdio(true);
		var spellBook:SpellBook= new SorcererSpellBook(14, 4);
		for ( i in 0...spellBook.knownSpellsNumber.length ) {
			var summary:XMLController = new XMLController("ui/spellLevelSummary.xml" );// ("ui/spellLevelList.xml" );
			//summary.root.text = "Lvl " + i + ": x" + spellBook.spellsNumberPerDay[i];
			summary.getComponent("LVLVal").text= ""+i;
			//summary.getComponent("NBVal").text= ""+spellBook.knownSpellsNumber[i];
			summary.getComponent("PERDAYVal").text= ""+spellBook.spellsNumberPerDay[i];
			getComponent("list").addChild( summary.view );
		}
	}
	
	public function changed(field:String, from: Dynamic, to:Dynamic) {
		DDAssistant.console(field + " " + from + " " + to);
	}	
}

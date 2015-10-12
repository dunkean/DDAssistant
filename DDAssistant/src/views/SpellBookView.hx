package views;
import haxe.ui.toolkit.core.DisplayObject;
import models.Player;
import models.SpellBook;
import models.SorcererSpellBook;
import haxe.ui.toolkit.core.XMLController;

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
		var spellBook:SpellBook= new SorcererSpellBook(14, 4);
		for ( i in 0...spellBook.knownSpellsNumber.length ) {
	//		DDAssistant.console("creating summary");
			var summary:XMLController = new XMLController("ui.spellLevelSummary.xml" );
	//		DDAssistant.console("creating summary2");
			summary._view.findChild("LVLValue").setText(i);
	//		DDAssistant.console("creating summary3");
			summary._view.findChild("NBValue").setText(spellBook.knownSpellsNumber[i]);
	//		DDAssistant.console("creating summary4");
			summary._view.findChild("PERDAYValue").setText(spellBook.spellsNumberPerDay[i]);
	//		DDAssistant.console("creating summary5");
			_view.findChild("list").addChild( summary );

	//		DDAssistant.console("known spells per level "+i+': ' + spellBook.knownSpellsNumber[i] +"("+spellBook.spellsNumberPerDay[i]+" per day)");
		}
	}
	
	public function changed(field:String, from: Dynamic, to:Dynamic) {
		DDAssistant.console(field + " " + from + " " + to);
	}	
}

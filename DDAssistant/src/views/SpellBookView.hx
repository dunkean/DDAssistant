package views;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.core.DisplayObject;
import models.Player;
import models.SpellDB;
import models.SpellBook;
import models.SorcererSpellBook;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.PopupManager;
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
		Toolkit.init();
		
		DDAssistant.console("creating spell book view and player spell book");
//		new hxcpp.DebugStdio(true);
		var spellBook:SpellBook= new SorcererSpellBook(14, 4);
		for ( i in 0...spellBook.knownSpellsNumber.length ) {
	//		var summary:XMLController = new XMLController("ui/spellLevelSummary.xml" );
			var summary:XMLController = new XMLController("ui/spellLevelList.xml" );
			summary.getComponent("list").text = "Lvl " + i + ": x" + spellBook.spellsNumberPerDay[i];
			//summary.getComponent("LVLVal").text= ""+i;
			//summary.getComponent("NBVal").text= ""+spellBook.knownSpellsNumber[i];
			//summary.getComponent("PERDAYVal").text= ""+spellBook.spellsNumberPerDay[i];
			
			for ( j in 0...spellBook.knownSpellsNumber.length ) {
				var empty:Button = new Button();
				empty.text = "Add spell...";
				empty.userData = j;
				empty.addEventListener(UIEvent.CLICK, openDB);
				summary.view.addChild( empty );
			}
			getComponent("list").addChild( summary.view );
		}
	}
	private function openDB( e:UIEvent ) {
		DDAssistant.console("show level " + e.component.userData + " spells");
		Toolkit.openFullscreen(function(root:Root) {
			PopupManager.instance.showCustom(SpellDB.getInstance().view, "Custom popup", { buttons: [PopupButton.OK, PopupButton.CANCEL] });
		});
	}
	public function changed(field:String, from: Dynamic, to:Dynamic) {
		DDAssistant.console(field + " " + from + " " + to);
	}	
}

package views;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.core.DisplayObject;
import models.Player;
import models.magic.SpellDB;
import models.magic.SpellBook;
import models.magic.SorcererSpellBook;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.RootManager;
import haxe.ui.toolkit.core.PopupManager;
import models.magic.SpellSelectionListener;
/**
 * First test view (abilities)
 * @author dunkean
 * @version 0.0
 */

 
@:build(haxe.ui.toolkit.core.Macros.buildController("ui/magic/spellbook.xml"))
class SpellBookView extends XMLController implements SpellSelectionListener
{
	private var _player:Player;
	public function new(player:Player) 
	{
		//Toolkit.init();
		_player = player;
		if ( _player == null ) {
			_player = new Player();
		}
		DDAssistant.console("creating spell book view and player spell book");
//		new hxcpp.DebugStdio(true);
		_player.spellBook= new SorcererSpellBook(14, 4);
		for ( i in 0..._player.spellBook.knownSpellsNumber.length ) {
	//		var summary:XMLController = new XMLController("ui/magic/spellLevelSummary.xml" );
			var summary:XMLController = new XMLController("ui/magic/spellLevelList.xml" );
			summary.getComponent("list").text = "Lvl " + i + ": x" + _player.spellBook.spellsNumberPerDay[i];
			summary.view.id = "summary_" + i;
			//summary.getComponent("LVLVal").text= ""+i;
			//summary.getComponent("NBVal").text= ""+spellBook.knownSpellsNumber[i];
			//summary.getComponent("PERDAYVal").text= ""+spellBook.spellsNumberPerDay[i];
			
			for ( j in 0..._player.spellBook.knownSpellsNumber[i] ) {
				var empty:Button = new Button();
				empty.text = "Add spell...";
				empty.userData = i;
				empty.addEventListener(UIEvent.CLICK, openDB);
				summary.view.addChild( empty );
			}
			getComponent("list").addChild( summary.view );
		}
	}
	private function openDB( e:UIEvent ) {
		DDAssistant.console("show level " + e.component.userData + " spells");
		//RootManager.instance.currentRoot.showModalOverlay();
			
		Toolkit.openPopup({percentWidth: 90, percentHeight: 90}, function(root:Root) {
            root.showModalOverlay();
			root.addChild(SpellDB.getInstance().view);
			SpellDB.getInstance().getComponent("close").onClick = function (e:UIEvent) {
				//RootManager.instance.destroyRoot(root);
				root.visible = false;
				RootManager.instance.currentRoot.hideModalOverlay();
			}
			SpellDB.getInstance().setSelectionListener( this );
			SpellDB.getInstance().getList("Ens/Mag", e.component.userData );

			//SpellDB.getInstance().getList("Ens/mag", e.component.userData );
        });

		/*
		Toolkit.openFullscreen(function(root:Root) {
			PopupManager.instance.showCustom(SpellDB.getInstance().view, "Spells", { buttons: [PopupButton.CANCEL] });
		});*/
	}
	public function spellSelected(e:UIEvent ) {
		DDAssistant.console("spell selected :" + e.component.userData );
		_player.spellBook.addSpellForLevel(e.component.userData);
	}
	public function changed(field:String, from: Dynamic, to:Dynamic) {
		DDAssistant.console(field + " " + from + " " + to);
	}	
}

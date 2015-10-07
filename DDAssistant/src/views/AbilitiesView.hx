package views;
import models.Player;
import haxe.ui.toolkit.core.XMLController;

/**
 * First test view (abilities)
 * @author dunkean
 * @version 0.0
 */

 
@:build(haxe.ui.toolkit.core.Macros.buildController("ui/abilities.xml"))
class AbilitiesView extends XMLController
{

	public function new(player:Player) 
	{
		
		//BindExt.exprTo(player.Strength, FORVal.text);
		//BindExt.exprTo(player.Dexterity, DEXVal.text);
		//BindExt.exprTo(player.Constitution, CONVal.text);
		//BindExt.exprTo(player.Intelligence, INTVal.text);
		//BindExt.exprTo(player.Wisdom, SAGVal.text);
		//BindExt.exprTo(player.Charisma, CHAVal.text);
		//Bind.bindAll(player, changed);
	}
	
	public function changed(field:String, from: Dynamic, to:Dynamic) {
		DDAssistant.console(field + " " + from + " " + to);
	}
	
}

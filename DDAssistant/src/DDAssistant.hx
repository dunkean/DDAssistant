package;
import haxe.Json;
import models.Player;
import network.Peer;
import sync.SyncManager;
import utils.UUID;
import views.AbilitiesView;
import haxe.ui.toolkit.containers.HBox;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.core.Macros;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.events.MenuEvent;

/**
 * DDAssistant main window
 * @author dunkean
 * @version 0.1
 */
@:build(haxe.ui.toolkit.core.Macros.buildController("ui/assistant.xml"))
class DDAssistant extends XMLController
{
	public static var uuid:String;
	public static var name:String;
	public static var peer:Peer;
	
	/**
	 * Instanciate peer, resourceManager. Load last settings. 
	 */
	public function new() 
	{
		Macros.addStyleSheet("ui/style.css");
		
		//if settings exit
			//load
		//else
		uuid = UUID.uuid(12, 16);
		name = 'Device';
		trace("DDAssistant Constructed");
		peer = new Peer();
		addListeners();
	}
	
	private function addListeners() {
		btn1.addEventListener(UIEvent.CLICK, btn1Clicked);
		btn2.addEventListener(UIEvent.CLICK, btn2Clicked);
		btn3.addEventListener(UIEvent.CLICK, btn3Clicked);
		
		attachEvent("newMenu", MenuEvent.SELECT, addModel);
		attachEvent("joinMenu", MenuEvent.SELECT, join);
		attachEvent("viewsMenu", MenuEvent.SELECT, addView);
	}
	
	private function btn1Clicked(e:UIEvent) : Void {
		player.Charisma = "45";
	}
	
	private function btn2Clicked(e:UIEvent) : Void {
		player.Charisma = "12";
		player.Strength = "15";
	}
	
	private function btn3Clicked(e:UIEvent) : Void {
		var panel = new HBox();
		var newText = new Text();
		newText.text = "Ceci est un nouveau text";
		panel.addChild(newText);
		mainLayout.addChild(panel);
	}
	
	var player: Player; //tmp test variable
	
	private function addView(e:MenuEvent) {
		switch(e.menuItem.id) {
			case "abilities":
				var viewController = new AbilitiesView(player);
				mainLayout.addChild(viewController.view);
				trace("added $e.menuItem.id");
			default:
		}
	}
	
	private function addModel(e:MenuEvent) {
		switch(e.menuItem.id) {
			case "newPlayer":
				player = new Player();
				trace(Json.stringify(player));
			default:
		}
	}
	
	private function join(e:MenuEvent) {
	}
}
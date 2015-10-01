package;
import haxe.Json;
import haxe.ui.toolkit.containers.HBox;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.core.Macros;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.MenuEvent;
import haxe.ui.toolkit.events.UIEvent;
import models.Player;
import network.Peer;
import utils.UUID;
import views.AbilitiesView;


typedef Settings = {
	var name: String;
	var uuid: String;
}

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
	public static var ddAssistant: DDAssistant; //Lazy singleton
	
	/**
	 * Instanciate peer, resourceManager. Load last settings. 
	 */
	public function new() 
	{
		if (ddAssistant == null)
			ddAssistant = this; //Lazy singleton instance
		
		uuid = UUID.uuid(12, 16);
		name = 'Device-' + UUID.uuid(2, 16);
		
		Macros.addStyleSheet("ui/style.css");
		loadSettings();
		addControlsListeners();
		Peer.start();
	}
	
	private function loadSettings() {
		//if (!FileSystem.exists(SystemPath.applicationStorageDirectory)) {
			//try{
				//FileSystem.createDirectory(SystemPath.applicationStorageDirectory);
			//}catch (e: Dynamic) {
				//DDAssistant.console("Cannot create data folder >\n" + e); 
			//}
		//}
		//
		//var settingsPath = SystemPath.applicationStorageDirectory + "/settingsPath.json";
		//
		//if (FileSystem.exists(settingsPath)) {
			//try{
				//var json = File.getContent(settingsPath);
				//var settings: Settings = Json.parse(json);
				//uuid = settings.uuid;
				//name = settings.name;
				//DDAssistant.console("DDAssistant Loaded");
			//}catch (e: Dynamic) {
				//DDAssistant.console("Cannot load settings. Creating new.");
				//return;
			//}
		//}else {
			//uuid = UUID.uuid(12, 16);
			//name = 'Device-' + UUID.uuid(2, 16);
			//var settings: Settings = {
				//name: DDAssistant.name,
				//uuid: DDAssistant.uuid
			//}
			//DDAssistant.console("DDAssistant Constructed");
			//var json = Json.stringify(settings);
			//try {
				//var f = File.append(settingsPath);
				//f.writeString(json);
				//f.close();
			//}catch (e: Dynamic) {
				//DDAssistant.console(e);
			//}
		//}
	}
	
	
	public static function console(text: String) {
		ddAssistant.consoleOutput.text += "\n" + text;
		trace(text);
	}
	
	private function addControlsListeners() {
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
	
	public static function addCompoTest(str:String) {
		var panel = new HBox();
		var newText = new Text();
		newText.text = str;
		panel.addChild(newText);
		ddAssistant.mainLayout.addChild(panel);
	}
	
	var player: Player; //tmp test variable
	
	private function addView(e:MenuEvent) {
		switch(e.menuItem.id) {
			case "abilities":
				var viewController = new AbilitiesView(player);
				mainLayout.addChild(viewController.view);
			default:
		}
	}
	
	private function addModel(e:MenuEvent) {
		switch(e.menuItem.id) {
			case "newPlayer":
				player = new Player();
				DDAssistant.console(Json.stringify(player));
			default:
		}
	}
	
	private function join(e:MenuEvent) {
	}
}
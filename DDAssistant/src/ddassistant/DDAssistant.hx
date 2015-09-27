package ddassistant;
import ddassistant.models.Player;
import ddassistant.network.Peer;
import ddassistant.sync.ResourceManager;
import ddassistant.sync.SampleData;
import ddassistant.utils.UUID;
import ddassistant.views.AbilitiesView;
import haxe.ui.toolkit.containers.HBox;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.core.Macros;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.events.MenuEvent;
import bindx.BindExt;
import bindx.Bind;

/**
 * DDAssistant main window
 * @author dunkean
 * @version 0.1
 */
@:build(haxe.ui.toolkit.core.Macros.buildController ("assistant.xml"))
class DDAssistant extends XMLController
{
	public static var uuid:String;
	public static var name:String;
	public static var peer:Peer;
	public static var resourceManager:ResourceManager;
	
	
	var testObj: SampleData;
	
	/**
	 * Instanciate peer, resourceManager. Load last settings. 
	 */
	public function new() 
	{
		//if settings exit
			//load
		//else
		uuid = UUID.uuid(12, 16);
		name = 'Device';
		peer = new Peer();
		resourceManager = new ResourceManager();
		addListeners();
		
		testFunction();
		buildUI();
	}
	
	private function buildUI() {
		Macros.addStyleSheet("assets/style.css");
	}
	
	
	private function testFunction() {
		testObj = new SampleData();
		Bind.bindAll(testObj, onObjChanged);
		Bind.bind(testObj.sampleText, onSampleTextChanged);
	}
	
	function onObjChanged(field:String, from: Dynamic, to:Dynamic) {
		trace("ALL");
		trace(field);
		trace(from);
		trace(to);
	}
	
	function onSampleTextChanged(from:String, to:String) {
		trace("MONOBIND > from " + from + " to "  + to);
	}
	
	private function btn1Clicked(e:UIEvent) : Void {
		testObj.sampleText = "Bouton 1";
		Reflect.setField(testObj, "sampleText", "ReflectiveText");
		trace("final value " + testObj.sampleText);
		//player.Charisma = "45";
	}
	
	private function btn2Clicked(e:UIEvent) : Void {
		//testObj.sampleText = "Bouton 2";
		player.Charisma = "12";
		player.Strength = "15";
	}
	
	private function btn3Clicked(e:UIEvent) : Void {
		var panel = new HBox();
		var newText = new Text();
		newText.text = "Ceci est un nouveau text";
		panel.addChild(newText);
		mainLayout.addChild(panel);
		testObj.sampleText = "Bouton 2";
	}
	
	private function addListeners() {
		btn1.addEventListener(UIEvent.CLICK, btn1Clicked);
		btn2.addEventListener(UIEvent.CLICK, btn2Clicked);
		btn3.addEventListener(UIEvent.CLICK, btn3Clicked);
		
		attachEvent("newMenu", MenuEvent.SELECT, addModel);
		attachEvent("joinMenu", MenuEvent.SELECT, join);
		attachEvent("viewsMenu", MenuEvent.SELECT, addView);
	}

	
	//tmp test variable
	var player: Player;
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
				var id: String = resourceManager.registerLocalResource(player);
				trace(id);
			default:
		}
	}
	
	private function join(e:MenuEvent) {
	}
}
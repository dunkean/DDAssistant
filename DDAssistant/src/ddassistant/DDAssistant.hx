package ddassistant;
import ddassistant.network.Peer;
import ddassistant.sync.ResourceManager;
import ddassistant.sync.SampleData;
import ddassistant.utils.UUID;
import haxe.ui.toolkit.containers.HBox;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.core.Macros;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;
import bindx.BindExt;
import bindx.Bind;

/**
 * DDAssistant main window
 * @author dunkean
 * @version 0.1
 */
@:build(haxe.ui.toolkit.core.Macros.buildController ("Assistant.xml"))
class DDAssistant extends XMLController
{
	public static var uuid:String;
	public static var name:String;
	public static var peer:Peer;
	public static var resourceManager:ResourceManager;
	
	
	var testObj: SampleData;
	
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
		
		//var unbindOldUser = BindExt.exprTo('Text binded >' + testObj.sampleText, label.text);
		//Bind.bind(testObj.sampleText, onSampleTextChanged);
		Bind.bindAll(testObj, onObjChanged);
	}
	
	function onObjChanged(field:String, from: Dynamic, to:Dynamic) {
		trace("ALL");
		trace(field);
		trace(from);
		trace(to);
	}
	
	function onSampleTextChanged(from:String, to:String) {
		trace(from + " " + to);
		abilities.visible = !abilities.visible;
	}
	
	private function btn1Clicked(e:UIEvent) : Void {
		testObj.sampleText = "Bouton 1";
	}
	
	private function btn2Clicked(e:UIEvent) : Void {
		testObj.sampleText = "Bouton 2";
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
		
		//newAbilityPanel.addEventListener(UIEvent.CLICK, addAbilityPanel);
	}
	
	
	
	private function addAbilityPanel(e:UIEvent) {
		//mainLayout.addChild(new XMLController());	
	}
}
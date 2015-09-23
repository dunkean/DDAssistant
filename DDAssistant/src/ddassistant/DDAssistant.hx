package ddassistant;
import ddassistant.models.ResourceManager;
import ddassistant.network.Peer;
import ddassistant.utils.UUID;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;

/**
 * DDAssistant main window
 * @author dunkean
 * @version 0.1
 */
@:build(haxe.ui.toolkit.core.Macros.buildController ("ui/Assistant.xml"))
class DDAssistant extends XMLController
{
	public static var uuid:String;
	public static var name:String;
	public static var peer:Peer;
	public static var resourceManager:ResourceManager;
	
	public function new() 
	{
		//if settings exit
			//load
		//else
		uuid = UUID.uuid(12, 16);
		name = 'Device';
		peer = new Peer(uuid, name);
				
		addListeners();
	}
	
	private function btn1Clicked(e:UIEvent) : Void {
		txtArea.text = "Bouton 1";
		
	}
	
	private function btn2Clicked(e:UIEvent) : Void {
		txtArea.text = "Bouton 2";
	}
	private function addListeners() {
		btn1.addEventListener(UIEvent.CLICK, btn1Clicked);
		btn2.addEventListener(UIEvent.CLICK, btn2Clicked);
	}
}
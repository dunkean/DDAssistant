package ddassistant.sync;
//import bindx.IBindable;
import ddassistant.sync.Resource;

/**
 * Resource manager for data sync
 * @author dunkean
 * @version 0.1
 */
class ResourceManager //implements ResourceListener
{
	//public static var resources: Map<String,Resource>;
	
	public function new() {
		//resources = new  Map<String,Resource>();
	}
	
	
	
	public function resourceLocallyChanged(resourceId:String, field: String, from: Dynamic, to: Dynamic) {
		//create Msg
		//broadcast Msg
	}
	
	public function resourceRemotelyChanged(msg): Void {
		
	}

}
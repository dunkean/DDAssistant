package ddassistant.sync;
import bindx.IBindable;
import ddassistant.sync.Resource;

/**
 * Resource manager for data sync
 * @author dunkean
 * @version 0.1
 */
class ResourceManager //implements ResourceListener
{
	public static var resources: Map<String,Resource>;
	
	public function new() {
		resources = new  Map<String,Resource>();
	}
	
	//@:access(Resource.new)
	public function registerLocalResource(obj: IBindable, ?uuid: String) : String{
		var resource = new Resource(obj, uuid);
		resources.set(resource.uuid, resource);
		return resource.uuid;
	}
	
		
	public function registerRemoteResource(serialObj: String, ?uuid: String): Void {
		
	}
	
	
	public function resourceLocallyChanged(resource:Resource, field: String, from: Dynamic, to: Dynamic) {
		//create Msg
		//broadcast Msg
	}
	
	public function resourceRemotelyChanged(msg): Void {
		
	}

}
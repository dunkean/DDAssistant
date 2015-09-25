package ddassistant.sync;
import ddassistant.sync.Resource;

/**
 * Resource manager for data sync
 * @author dunkean
 * @version 0.1
 */
class ResourceManager implements ResourceListener
{
	public static var resources: Map<String,Resource>;
	
	public function new() {
		resources = new  Map<String,Resource>();
	}
	
	//@:access(Resource.new)
	public function shareObj(obj: Dynamic, ?uuid: String) {
		var resource = new Resource(obj, uuid);
		resources.set(resource.uuid, resource);
	}
	
	public function resourceChanged(attribute: String, serialChangeSet: String) {
		
	}
	
}
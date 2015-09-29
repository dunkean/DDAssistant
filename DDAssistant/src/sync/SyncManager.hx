package sync;

/**
 * Resource manager for data sync
 * @author dunkean
 * @version 0.1
 */
class SyncManager //implements ResourceListener
{
	public static var syncObjects: Map<String, Syncable>  = new Map<String, Syncable>();
	
	static public function localUpdate(resourceId:String, field: String, from: Dynamic, to: Dynamic): Void {
		trace("SYNC INFO > " + resourceId + "." + field + ": from " + from + " to " + to);
		//create Msg
		//broadcast Msg
		//notify views
	}
	
	static public function remoteUpdate(msg): Void {
		//unserialize msg
		//setField object
		//notify views
	}
}
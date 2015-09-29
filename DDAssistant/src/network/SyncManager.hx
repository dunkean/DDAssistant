package network;
import network.Syncable;

/**
 * Resource manager for data sync
 * @author dunkean
 * @version 0.1
 */
class SyncManager //implements ResourceListener
{
	public static var syncObjects: Map<String, Syncable>  = new Map<String, Syncable>();
	
	
	static public function sync(syncable: Syncable) {
		syncObjects.set(syncable.uuid, syncable);
		//Broadcast message new	
	}
	
	static public function localUpdate(resourceId:String, field: String, from: Dynamic, to: Dynamic): Void {
		trace("SYNC INFO > " + resourceId + "." + field + ": from " + from + " to " + to);
		//create Msg
		//broadcast Msg
		//notify views
	}
	
	static public function remoteUpdate(syncMessage: SyncMessage): Void {
		//read sync message type
		//switch CRUD > actions + notifications
	}
}
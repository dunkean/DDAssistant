package network;
import models.Player;
import network.Syncable;

/**
 * Resource manager for data sync
 * @author dunkean
 * @version 0.1
 */
class SyncManager
{
	public static var syncables: Map<String, Dynamic>  = new Map<String, Dynamic>();
	
	static public function newSyncable(syncable: Syncable) {
		syncables.set(syncable.uuid, syncable);
		broadcast(SyncMessage.newCreateMessage(syncable));
		//Notify UI Menus
	}
	
	static public function localUpdate(syncableId:String, field: String, from: Dynamic, to: Dynamic): Void {
		Main.log("SYNC INFO > " + syncableId + "." + field + ": from " + from + " to " + to);
		if(from != to){
			broadcast(SyncMessage.newUpdateMessage(syncables.get(syncableId), field, from, to));
			//Notify UI Views
		}
	}
	
	#if !html5
		static public function remoteMessage(syncMessage: SyncMessage, sender: PeerInfo): Void {
	#else
		static public function remoteMessage(syncMessage: SyncMessage, sender: Dynamic): Void {
	#end
		if (sender.uuid == Main.uuid)
			return;
		switch(syncMessage.type) {
			case "create": {
				switch(syncMessage.className) {
					case "models.Player":
						var syncable: Player = SyncSerializer.decode(syncMessage.content, syncMessage.className);
						syncables.set(syncable.uuid, syncable);
						Main.log(SyncSerializer.encode(syncable));
						//Notify views
				}
			}
			case "read": {
				if (syncables.get(syncMessage.uuid) == null) {
					broadcast(SyncMessage.newReadMessage(syncMessage.uuid));
					return;
				}
					
				if(syncables.get(syncMessage.uuid).ownerId == Main.uuid)
					broadcast(SyncMessage.newCreateMessage(syncables.get(syncMessage.uuid)));
			}
			case "update": {
				//Notify views
			}
			case "delete": {
				if (syncables.get(syncMessage.uuid) == null)
					return;
				if(syncables.get(syncMessage.uuid).ownerId == sender.uuid){
					syncables.remove(syncMessage.uuid);
					//Notify views
				}
			}
		}
	}
	
	#if !html5
		static public function sendAllMySyncables(peer: PeerInfo) {
	#else
		static public function sendAllMySyncables(peer: Dynamic) {
	#end
		for ( syncable in syncables ) {
			if (syncable.ownerId == Main.uuid) {
				#if !html5
					peer.send(SyncMessage.newCreateMessage(cast (syncable, Syncable)));
				#end
			}
		}
	}
	
	static public function broadcast(msg: String) {
		#if !html5
			Peer.broadcast(msg);
		#end
	}
}
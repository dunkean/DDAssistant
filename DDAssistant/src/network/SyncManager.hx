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
		Peer.broadcast(SyncMessage.newCreateMessage(syncable));
		//Notify UI Menus
	}
	
	static public function localUpdate(syncableId:String, field: String, from: Dynamic, to: Dynamic): Void {
		DDAssistant.console("SYNC INFO > " + syncableId + "." + field + ": from " + from + " to " + to);
		if(from != to){
			Peer.broadcast(SyncMessage.newUpdateMessage(syncables.get(syncableId), field, from, to));
			//Notify UI Views
		}
	}
	
	static public function remoteMessage(syncMessage: SyncMessage, sender: PeerInfo): Void {
		if (sender.uuid == DDAssistant.uuid)
			return;
		switch(syncMessage.type) {
			case "create": {
				switch(syncMessage.className) {
					case "models.Player":
						var syncable: Player = SyncSerializer.decode(syncMessage.content, syncMessage.className);
						syncables.set(syncable.uuid, syncable);
						DDAssistant.console(SyncSerializer.encode(syncable));
						DDAssistant.addCompoTest(SyncSerializer.encode(syncable));
						//Notify views
				}
			}
			case "read": {
				if (syncables.get(syncMessage.uuid) == null) {
					Peer.broadcast(SyncMessage.newReadMessage(syncMessage.uuid));
					return;
				}
					
				if(syncables.get(syncMessage.uuid).ownerId == DDAssistant.uuid)
					Peer.broadcast(SyncMessage.newCreateMessage(syncables.get(syncMessage.uuid)));
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
	
	static public function sendAllMySyncables(peer: PeerInfo) {
		for ( syncable in syncables ) {
			if (syncable.ownerId == DDAssistant.uuid)
				peer.send(SyncMessage.newCreateMessage(cast (syncable, Syncable)));
		}
	}
}
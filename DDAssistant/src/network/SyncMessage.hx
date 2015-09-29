package network;
import haxe.Json;
import network.Syncable;

/**
 * Messages for synchronizing data in combatAssistant
 * @author dunkean
 * @version 0.2
 */

typedef UpdateContent = {
	var uuid: String;
	var field: String;
	var from: String;
	var to: String;
}
class SyncMessage
{
	private static inline var SEPARATOR: String = "*-*_*-*";
	public var senderId: String;
	public var type: String;
	public var md5: String;
	public var content: String;
	public var uuid: String;
	public var updateContent: UpdateContent;
	
	public function new(){}
	
	public static function newCreateMessage(syncable: Syncable): String {
		return DDAssistant.uuid + SEPARATOR + "create" + SEPARATOR + syncable.serialize() + SEPARATOR + syncable.md5();
	}
	
	public static function newReadMessage(uuid: String): String {
		return DDAssistant.uuid + SEPARATOR + "read" + SEPARATOR + uuid;
	}
	
	public static function newUpdateMessage(syncable: Syncable, field: String, from: Dynamic, to: Dynamic): String {
		var updContent: UpdateContent = {
			uuid: syncable.uuid, field: field, from: from, to: to
		}
		return DDAssistant.uuid + SEPARATOR + "update" + SEPARATOR + Json.stringify(updContent) + SEPARATOR + syncable.md5();
	}
	
	public static function newDeleteMessage(syncable: Syncable): String {
		return DDAssistant.uuid + SEPARATOR + "delete" + SEPARATOR + syncable.uuid;
	}
	
	public static function parseMessage(rawMessage: String): SyncMessage {
		var msgSplit = rawMessage.split(SEPARATOR);
		var syncMessage = new SyncMessage();
		syncMessage.senderId = msgSplit[0];
		syncMessage.type = msgSplit[1];
		switch(syncMessage.type) {
			case "create":{
				syncMessage.content = msgSplit[2];
				syncMessage.md5 = msgSplit[3];
			}
			case "read":{
				syncMessage.uuid = msgSplit[2];
			}
			case "update":{
				syncMessage.content = msgSplit[2];
				syncMessage.md5 = msgSplit[3];
				syncMessage.updateContent = Json.parse(syncMessage.content);
			}
			case "delete":{
				syncMessage.uuid = msgSplit[2];
			}
		}
		
		return syncMessage;
	}
	
}
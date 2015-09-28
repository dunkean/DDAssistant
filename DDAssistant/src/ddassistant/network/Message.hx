package ddassistant.network;
import ddassistant.sync.Resource;

/**
 * Messages classes for combatAssistant
 * @author dunkean
 */

//*****SYNC******//
// senderId, resOwnerId should be equal except disconnection, updateRequire
// newResource: (senderId, resOwnerId, resId, resMd5, resource) 

// senderId, resOwnerId should be equal except disconnection, updateRequire
// resourceChanged: (senderId, resOwnerId, resId, resMd5, changedField, resource) 

// senderId, effectLauncherId should be equal. effectLauncherId, resOwnerID should be different, if equal launch resourcheChanged
// applyEffect: (senderId, effectLauncherId, resOwnerID, resId, resMd5, changedField, resource)

// newTextMessage: (fromId, toId, content)

class Message
{
	private static inline var SEPARATOR: String = "*-*_*-*";
	
	public var header: String;
	public var senderId: String;
	public var resourceId: String;
	public var resourceMd5: String;
	public var data: String;
	
	public function new(h:String, r:Resource, d:String ) 
	{
		header = h;
		senderId = DDAssistant.uuid;
		resourceId = r.uuid;
		resourceMd5 = r.md5;
	}
	
	public function toString() {
		return header + SEPARATOR + senderId + SEPARATOR + resourceId + SEPARATOR + data + "\n";
	}
	
}
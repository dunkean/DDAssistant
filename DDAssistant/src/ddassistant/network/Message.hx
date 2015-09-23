package ddassistant.network;
import ddassistant.models.Resource;

/**
 * ...
 * @author 
 */
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
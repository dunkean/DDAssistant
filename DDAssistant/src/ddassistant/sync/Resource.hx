package ddassistant.sync;

/**
 * Resource class for p2p sync
 * @author dunkean
 * @version 0.1
 */

import ddassistant.utils.UUID;
import haxe.crypto.Md5;
import haxe.Serializer;
 
class Resource
{
	public var ownerUuid: String;
	public var uuid: String;
	public var md5: String;
	public var obj: Dynamic;
	public var serialObj: String;
	
	//@:allow(ddassistant.ResourceManager)
	public function new(obj: Dynamic, ?uuid:String) 
	{
		this.ownerUuid = DDAssistant.uuid;
		this.obj = obj;
		this.serialObj = Serializer.run(obj);
		this.uuid = (uuid == null) ? UUID.uuid(12, 16) : uuid;
		this.md5 = Md5.encode(serialObj);
		
		//set binding to obj attributes here
		//using Reflect
	}
	
	function onAttributeChanged(attribute: String) {
		
	}
	
}
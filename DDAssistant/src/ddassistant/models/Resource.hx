package ddassistant.models;

/**
 * ...
 * @author 
 */
class Resource
{
	var ownerUuid: String;
	public var uuid: String;
	public var md5: String;
	
	public function new() 
	{
		ownerUuid = DDAssistant.uuid;
	}
	
}
package ddassistant.sync;

/**
 * ...
 * @author 
 */

import ddassistant.utils.UUID;
import haxe.crypto.Md5;
import haxe.Serializer;

class Synced
{

	var uuid: String;
	public function new(?uuid: String) {
		if (uuid == null)
			this.uuid = UUID.uuid(12, 16);
		else
			this.uuid = uuid;
	}
	
	public function serialize(): String {
		return Serializer.run(this);
	}
	
	public function md5(): String {
		return Md5.encode(serialize());
	}
}
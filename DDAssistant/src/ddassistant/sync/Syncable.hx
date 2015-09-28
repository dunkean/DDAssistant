package;
import haxe.crypto.Md5;
import haxe.Serializer;

/**
 * ...
 * @author dunkean
 */

@:autoBuild(SyncableMacro.buildSyncableMacro())
class Syncable
{
	var uuid: String;
	public function new(?uuid: String) {
		if (uuid == null)
			this.uuid = "newUUID";
		else
			this.uuid = uuid;
	}
	
	public function serialize(): String {
		return Serializer.run(this);
	}
	
	public function md5(): String {
		return Md5(serialize());
	}
}
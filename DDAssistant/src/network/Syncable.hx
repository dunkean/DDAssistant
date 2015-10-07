package network;
import network.macros.SyncMacro;
import network.SyncSerializer;
import utils.UUID;
import haxe.crypto.Md5;

/**
 * Macro mother class for data synchronisation
 * @author dunkean
 * @version 0.1
 */

@:autoBuild(network.macros.SyncMacro.buildSyncMacro())
class Syncable
{
	public var _explicitType: String;
	public var uuid: String;
	public var ownerId: String;
	
	public function new(?uuid: String) {
		this._explicitType = Type.getClassName(Type.getClass(this));
		this.ownerId = DDAssistant.uuid;
		if (uuid == null)
			this.uuid = UUID.uuid(12, 16);
		else
			this.uuid = uuid;
		SyncManager.newSyncable(this);
	}
	
	public function serialize(): String {
		return SyncSerializer.encode(this);
	}
	
	public function md5(): String {
		return Md5.encode(serialize());
	}
}
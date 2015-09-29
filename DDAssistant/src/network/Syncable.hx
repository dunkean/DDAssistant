package network;
import network.macros.SyncMacro;
import utils.UUID;
import haxe.crypto.Md5;
import haxe.Serializer;

/**
 * Macro mother class for data synchronisation
 * @author dunkean
 * @version 0.1
 */

@:autoBuild(network.macros.SyncMacro.buildSyncMacro())
class Syncable
{
	public var uuid: String;
	public var ownerId: String;
	
	public function new(?uuid: String) {
		this.ownerId = DDAssistant.uuid;
		if (uuid == null)
			this.uuid = UUID.uuid(12, 16);
		else
			this.uuid = uuid;
			
		SyncManager.sync(this);
	}
	
	public function serialize(): String {
		return Serializer.run(this);
	}
	
	public function md5(): String {
		return Md5.encode(serialize());
	}
}
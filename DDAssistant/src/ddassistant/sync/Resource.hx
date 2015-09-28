package ddassistant.sync;

/**
 * Resource class for p2p sync
 * @author dunkean
 * @version 0.1
 */

//import bindx.Bind;
//import bindx.IBindable;
import ddassistant.utils.UUID;
import haxe.crypto.Md5;
import haxe.macro.Expr;
import haxe.Serializer;
 
class Resource
{
	//public var ownerUuid: String;
	//public var uuid: String;
	//public var md5: String;
	//public var obj: Dynamic;
	//public var serialObj: String;
	//
	//var unbindAll: Void -> Void;
	//
	////@:allow(ddassistant.ResourceManager)
	//public function new(obj: IBindable, ?uuid:String) 
	//{
		//this.ownerUuid = DDAssistant.uuid;
		//this.obj = obj;
		//this.serialObj = Serializer.run(obj);
		//this.uuid = (uuid == null) ? UUID.uuid(12, 16) : uuid;
		//this.md5 = Md5.encode(serialObj);
		//unbindAll = Bind.bindAll(obj, objLocallyChanged);
		//
		//trace(md5);
		//trace(serialObj);
	//}
	//
	//public function objLocallyChanged(field: String, from: Dynamic, to: Dynamic) {
		//trace(field + " changed from " + from + " to " + to);
		//unbindAll();
		//this.serialObj = Serializer.run(obj);
		//this.md5 = Md5.encode(serialObj);
		//trace(md5);
		//trace(serialObj);
		//////unbindAll = Bind.bindAll(obj, objLocallyChanged);
		//DDAssistant.resourceManager.resourceLocallyChanged(this, field, from, to);
	//}
	//
	//public function objRemotelyChanged(field: String, from: Dynamic, to: Dynamic) {
		//unbindAll();
		//this.serialObj = Serializer.run(obj);
		//this.md5 = Md5.encode(serialObj);
		//Reflect.setField(obj, field, to);
	//}
	
}
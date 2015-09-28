package ddassistant.sync;

/**
 * ...
 * @author dunkean
 */
class TestClass //extends Synced implements Syncable
{
	public var test1: String = "BONJOUR";
	public var test2: String;

	static public function sync(uuid: String, field: String, from: Dynamic, to: Dynamic): Void {
		trace(uuid+ " " + field + " > " + from + " > " + to);
	}

}
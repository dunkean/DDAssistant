package;

/**
 * ...
 * @author dunkean
 */
class TestClass extends Syncable
{
	public var test1: String;
	public var test2: String;

	static public function sync(uuid: String, field: String, value: String): Void {
		trace(uuid+ " " + field + " > " + value);
	}

}
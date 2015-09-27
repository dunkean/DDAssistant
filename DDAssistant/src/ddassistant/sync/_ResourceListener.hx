package ddassistant.sync;

/**
 * @author 
 */
interface _ResourceListener 
{
	public function resourceChanged(attribute: String, serialChangeSet: String): Void;
}
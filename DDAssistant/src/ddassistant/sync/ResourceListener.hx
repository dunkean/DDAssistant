package ddassistant.sync;

/**
 * @author 
 */
interface ResourceListener 
{
	public function resourceChanged(attribute: String, serialChangeSet: String): Void;
}
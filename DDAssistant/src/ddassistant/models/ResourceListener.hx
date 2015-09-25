package ddassistant.models;

/**
 * @author 
 */
interface ResourceListener 
{
	public function resourceChanged(attribute: String, serialChangeSet: String): Void;
}
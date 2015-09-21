package ddassistant.network;

/**
 * @author 
 */
interface PeerListener 
{
	public function messageReceived(header: String, content: String): Void;
}
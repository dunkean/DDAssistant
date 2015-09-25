package ddassistant.sync;

/**
 * Sample Data class for p2p sync test
 * @author dunkean
 */

 import bindx.IBindable;

@:bindable
class SampleData implements IBindable
{
	public var sampleText: String;

	public function new() 
	{
		this.sampleText = "SampleText";
	}
	
}
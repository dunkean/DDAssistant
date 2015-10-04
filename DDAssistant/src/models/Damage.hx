package models;

import network.Syncable;
import haxe.ds.EnumValueMap;
/**
 * ...
 * @author cda
 */
class Damage extends Syncable
{
	
	public var details:EnumValueMap<BaseElement, Dynamic> = new EnumValueMap<BaseElement, Dynamic>();
	
	public function new(?type:BaseElement, ?value:Dynamic, ?uuid:String) 
	{
		super(uuid);
		if( value != null ) {
			addDamage(type, value);
		}
	}
	public function addDamage( ?type:BaseElement , value:Dynamic) {
		/* Should add the dices
		var val = details.get(type);
		if ( val != null ) {
			val = "0";
		}
		
		details.set(type, Std.string( Std.parseInt(value) + Std.parseInt(val) ) );
		*/
	}
	
	public function roll() {
		//var ret:Damage = new Damage();
		
	}
}
package models;

import network.Syncable;
/**
 * ...
 * @author cda
 */
class Damage extends Syncable
{
	
	public var details:Map<BaseElement, Array<Dice>> = new Map<BaseElement, Array<Dice>>();
	
	public function new(?type:BaseElement, ?value:Dynamic, ?uuid:String) 
	{
		super(uuid);
		if( value != null ) {
			addDamageDice(type, value);
		}
	}
	
	public function addDamageDice( ?type:BaseElement , value:Dice) {
		var val = details.get(type);
		if ( details[type] == null ) {
			details[type]= new Array<Dice>();
		}
		details[type].push(value);
	}
	public function addDamage(?type:BaseElement, value:String) {
		var val = details.get(type);
		if ( details[type] == null ) {
			details[type]= new Array<Dice>();
		}
		details[type].push( new Dice(value) );
		
	}
	
	public function roll():Map<BaseElement, Int> {
		var damageOutput:Map<BaseElement, Int> = new Map<BaseElement, Int> ();
		for ( type in details.keys() ) {
			var output:Int=  0;
			for ( detail in details[type] ) {
				output += detail.roll();
			}
			damageOutput.set(type, output);
		}
		return damageOutput;
	}
}
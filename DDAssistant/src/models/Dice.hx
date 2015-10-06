package models;

import network.Syncable;
/**
 * ...
 * @author cda
 */
class Dice extends Syncable
{
	public var diceType:DiceType = DiceType.D6;
	public var number:Float = 1;
	public function new(number:Dynamic, ?diceType:DiceType, ?uuid:String) 
	{
		super(uuid);
		if ( Std.is(number, String) ) {
			
			var r = ~/(\d+(.\d*|,\d*)*)\s*d(\d+)/i;
			r.match(number);
			this.number = Std.parseFloat(r.matched(1));		
			this.diceType = Std.parseInt(r.matched(3));	
//			DDAssistant.console(this.number + " " + this.diceType);
		}
		else {
			this.number = number;
			this.diceType = diceType;
		}
	}

	public function roll():Int {	
		var ret:Int = Math.round( (Std.random( diceType ) +1) * number);
	//	DDAssistant.console("roll " + this.number + "D" + this.diceType+": " + ret);
		return ret;
	}
}
package models;

import network.Syncable;

/**
 * ...
 * @author cda
 */
class Dice extends Syncable
{
	public var diceType:DiceType = DiceType.D6;
	public var number:Int = 1;
	public function new(number:Int, diceType:DiceType, ?uuid:String) 
	{
		super(?uuid);
		this.number = number;
		this.diceType = diceType;
	}
	
}
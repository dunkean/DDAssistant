package models;

import network.Syncable;

/**
 * ...
 * @author cda
 */
class Duration extends Syncable
{
	public var value:Dynamic = "1";
	public var unit:String = "round"; 
	public function new(value:Dynamic, unit:String, ?uuid:String) 
	{
		super(uuid);
		this.value = value;
		this.unit = unit;
	}
	
}
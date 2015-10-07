package models;

/**
 * @author cda
 */
@:enum
abstract DiceType(Int) from Int to Int
{
	var D4= 4;
	var D6= 6;
	var D8= 8;
	var D12= 12;
	var D20= 20;
	var D100 = 100;
	/*
	@:op(A + B)
	public function add( B:Int ):Int {
		return this + B;
	}
	*/
}
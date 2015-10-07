package models;

/**
 * @author cda
 */

@:enum
abstract BaseElement( String ) from String to String
{
	var Acid="Acid";
	var Bludgeoning= "Bludgeoning";
	var Cold= "Cold";
	var Divine= "Divine";
	var Electricity= "Electricity";
	var Falling= "Falling";
	var Fire= "Fire";
	var Force= "Force";
	var InfernalFire= "InfernalFire";
	var NegativeEnergy= "NegativeEnergy";
	var NonLethal= "NonLethal";
	var Piercing= "Piercing";
	var PositiveEnergy= "PositiveEnergy";
	var Slashing= "Slashing";
	var Sonic= "Sonic";
	var Typeless= "Typeless";
	var Untyped= "Untyped";
	var Vile= "Vile";
	
	var __TOTAL= "__TOTAL";
}
package models;

import models.SpellBook;

/**
 * ...
 * @author cda
 */
class SorcererSpellBook extends SpellBook
{
	public var currentSpellsPerDay:Array<Int>;
	public function new(?casterLevel:Int=0, ?casterMainBonus:Int= 0, ?uuid:String) 
	{
		super(casterLevel, casterMainBonus, uuid);
		
//		currentSpellsPerDay = spellsNumberPerDay.copy();// new Array<Int>();
//		currentSpellsPerDay.push( generalSpellsPerDay[casterLevel][i] + bonusSpellsPerDay[casterMainBonus][i] );	
	}
	override public function setKnownSpellsForLevel(level:Int, value:Int) {
		super.setKnownSpellsForLevel(level, value);
		while ( currentSpellsPerDay.length < level ) {
			currentSpellsPerDay.push(0);
		}
		currentSpellsPerDay[level] = value;
	}
	
	override public function addSpellForLevel(spell:Spell) {
		var level:Int = Std.parseInt( spell.level );
		while ( spellList.length < level ) {
			spellList.push(new Array<Spell>() );
		}
		spellList[level].push( spell );
	}
	override public function consumeSpell( spell:Spell ) {
		var level:Int = Std.parseInt( spell.level );
		if ( currentSpellsPerDay[level] > 0 ) {
			currentSpellsPerDay[level]--;
		}
	}
	override public function reset() {
		for ( i in 0...spellsNumberPerDay.length ) {
			currentSpellsPerDay[i] = spellsNumberPerDay[i];
		}
	}
}
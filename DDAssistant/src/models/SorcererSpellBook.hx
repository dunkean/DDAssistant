package src.models;

import models.SpellBook;

/**
 * ...
 * @author cda
 */
class SorcererSpellBook extends SpellBook
{
	var currentSpellsPerDay:Array<Int>;
	
	public function new(?uuid:String) 
	{
		super(?uuid);
		currentSpellsPerDay = new Array<Int>();
	}
	public function setKnownSpellsForLevel(level:Int, value:Int) {
		super.setKnownSpellsForLevel(level, value);
		while ( currentSpellsPerDay.length < level ) {
			currentSpellsPerDay.push(0);
		}
		currentSpellsPerDay[level] = value;
	}
	public function addSpellForLevel(level:Int, spell:Spell) {
		
		while ( knownSpells.length < level ) {
			knownSpells.push(new Array<Spell>() );
		}
		knownSpells[level].push( spell );
	}
	public function consumeSpell( level:Int ) {
		if ( currentSpellsPerDay[level] > 0 ) {
			currentSpellsPerDay[level]--;
		}
	}
	public function reset() {
		for ( var i = 0; i < spellsNumberPerDay.length; i++ ) {
			currentSpellsPerDay[i] = spellsNumberPerDay[i];
		}
	}
}
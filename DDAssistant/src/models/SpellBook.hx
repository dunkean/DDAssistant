package models;

import network.Syncable;

/**
 * ...
 * @author cda
 */
class SpellBook extends Syncable
{
	var knownSpellsNumber:Array<Int>;
	var spellsNumberPerDay:Array<Int>;
	var spellsPerLevel:Array<Array<Spell>>;
	public function new(?uuid:String) 
	{
		super(uuid);
		knownSpellsNumber = new Array<Int>();
		spellsNumberPerDay = new Array<Int>();
		spellsPerLevel = new Array<Array<Spell>>();
	}
	public function setKnownSpellsForLevel(level:Int, value:Int) {
		
		while ( knownSpellsNumber.length < level ) {
			knownSpellsNumber.push(0);
		}
		knownSpellsNumber[level] = value;
	}
	public function setSpellsPerDay(level:Int, value:Int) {
		
		while ( spellsNumberPerDay.length < level ) {
			spellsNumberPerDay.push(0);
		}
		spellsNumberPerDay[level] = value;
	}
	public function setCurrentSpellsPerDay(level:Int, value:Int) {
		
		while ( spellsNumberPerDay.length < level ) {
			spellsNumberPerDay.push(0);
		}
		spellsNumberPerDay[level] = value;
	}
	public function addSpellForLevel(level:Int, spell:Spell) {
		
		while ( knownSpellsNumber.length < level ) {
			spellsPerLevel.push(new Array<Spell>() );
		}
		spellsPerLevel[level].push( spell );
	}
	public function consumeSpell( level:Int, spell:Spell ) {
		if ( spellsNumberPerDay[level] > 0 ) {
			spellsNumberPerDay[level]--;
		}
	}
}
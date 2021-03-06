package models.magic;

import models.magic.Spell;
import models.magic.SpellDB.AnonSpell;
import network.Syncable;

/**
 * ...
 * @author cda
 */
class SpellBook extends Syncable
{
	private var generalKnownSpellsPerLevel:Array<Array<Int>> = [
		[],	
		[4, 2],
		[5, 2],
		[5, 3],
		[6, 3, 1],
		[6, 4, 2],
		[7, 4, 2, 1],
		[7, 5, 3, 2],
		[8, 5, 3, 2, 1],
		[8, 5, 4, 3, 2],
		[9, 5, 4, 3, 2, 1],
		[9, 5, 5, 4, 3, 2],
		[9, 5, 5, 4, 3, 2, 1],
		[9, 5, 5, 4, 4, 3, 2],
		[9, 5, 5, 4, 4, 3, 2, 1],
		[9, 5, 5, 4, 4, 4, 3, 2],
		[9, 5, 5, 4, 4, 4, 3, 2, 1],
		[9, 5, 5, 4, 4, 4, 3, 3, 2],
		[9, 5, 5, 4, 4, 4, 3, 3, 2, 1],
		[9, 5, 5, 4, 4, 4, 3, 3, 3, 2],
		[9, 5, 5, 4, 4, 4, 3, 3, 3, 3]
	];
	private var generalSpellsPerDay:Array<Array<Int>> = [
		[],
		[5, 3],
		[6, 4],
		[6, 5],
		[6, 6, 3],
		[6, 6, 4],
		[6, 6, 5, 3],
		[6, 6, 6, 4],
		[6, 6, 6, 5, 3],
		[6, 6, 6, 5, 4],
		[6, 6, 6, 6, 5, 3],
		[6, 6, 6, 6, 6, 4],
		[6, 6, 6, 6, 6, 5, 3],
		[6, 6, 6, 6, 6, 6, 4],
		[6, 6, 6, 6, 6, 6, 5, 3],
		[6, 6, 6, 6, 6, 6, 6, 4],
		[6, 6, 6, 6, 6, 6, 6, 5, 3],
		[6, 6, 6, 6, 6, 6, 6, 6, 4],
		[6, 6, 6, 6, 6, 6, 6, 6, 5, 3],
		[6, 6, 6, 6, 6, 6, 6, 6, 6, 4],
		[6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
	];
	private var bonusSpellsPerDay:Array<Array<Int>> = [
		[],
		[0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
		[0, 1, 1, 1, 0, 0, 0, 0, 0, 0],
		[0, 1, 1, 1, 1, 0, 0, 0, 0, 0],
		[0, 2, 1, 1, 1, 1, 0, 0, 0, 0],
		[0, 2, 2, 1, 1, 1, 1, 0, 0, 0],
		[0, 2, 2, 2, 1, 1, 1, 1, 0, 0],
		[0, 2, 2, 2, 2, 1, 1, 1, 1, 0],
		[0, 3, 2, 2, 2, 2, 1, 1, 1, 1],
		[0, 3, 3, 2, 2, 2, 2, 1, 1, 1],
		[0, 3, 3, 3, 2, 2, 2, 2, 1, 1],
		[0, 3, 3, 3, 3, 2, 2, 2, 2, 1],
		[0, 4, 3, 3, 3, 2, 2, 2, 2, 2],
		[0, 4, 4, 3, 3, 3, 3, 2, 2, 2],
		[0, 4, 4, 4, 3, 3, 3, 3, 2, 2],
		[0, 4, 4, 4, 4, 3, 3, 3, 3, 2],
		[0, 5, 4, 4, 4, 4, 3, 3, 3, 3]
	];
	
//	private var generalKnownSpellsPerLevel:Array<Array<Int>>
	public var knownSpellsNumber:Array<Int>;
	public var spellsNumberPerDay:Array<Int>;
	public var spellList:Array<Array<Spell>>;
	public var currentSpellsPerDay:Array<Int>;
	public function new(?casterLevel:Int=0, ?casterMainBonus:Int= 0, ?uuid:String) 
	{
		super(uuid);
		knownSpellsNumber = new Array<Int>();
		spellsNumberPerDay = new Array<Int>();
		spellList = new Array<Array<Spell>>();
		for ( i in 0...generalKnownSpellsPerLevel[casterLevel].length ) {
			setKnownSpellsForLevel(i, generalKnownSpellsPerLevel[casterLevel][i]);
		}
		for ( i in 0...generalSpellsPerDay[casterLevel].length ) {
			setSpellsNumberPerDay( i, generalSpellsPerDay[casterLevel][i] + bonusSpellsPerDay[casterMainBonus][i]);
	//		spellsNumberPerDay.push( generalSpellsPerDay[casterLevel][i] + bonusSpellsPerDay[casterMainBonus][i] );
	//		currentSpellsPerDay.push( generalSpellsPerDay[casterLevel][i] + bonusSpellsPerDay[casterMainBonus][i] );
		}
		currentSpellsPerDay = spellsNumberPerDay.copy();
		DDAssistant.console("Spell book ready");
	}
	public function setKnownSpellsForLevel(level:Int, value:Int) {
		while ( knownSpellsNumber.length <= level ) {
			knownSpellsNumber.push(0);
		}
		knownSpellsNumber[level] = value;
	}
	public function setSpellsNumberPerDay(level:Int, value:Int) {	
		while ( spellsNumberPerDay.length <= level ) {
			spellsNumberPerDay.push(0);
		}
		spellsNumberPerDay[level] = value;
	}
	public function setCurrentSpellsPerDay(level:Int, value:Int) {
		
		while ( spellsNumberPerDay.length <= level ) {
			spellsNumberPerDay.push(0);
		}
		spellsNumberPerDay[level] = value;
	}
	public function addSpellForLevel(spellDesc:AnonSpell) {
		while ( spellList.length <= spellDesc.classLevel ) {
			spellList.push(new Array<Spell>() );
		}
		spellList[spellDesc.classLevel].push( Spell.parse(spellDesc) );
		DDAssistant.console("Spell list Level " + spellDesc.classLevel + " is now");
		for ( spell in spellList[spellDesc.classLevel] ) {
			DDAssistant.console(spell.name);
		}
	}
	public function consumeSpell( spell:Spell ) {
		var level:Int = spell.level;
		if ( spellsNumberPerDay[level] > 0 ) {
			spellsNumberPerDay[level]--;
		}
	}
	
	function reset(){
		
	}
}
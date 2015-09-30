package models;
import network.Syncable;

/**
 * D&D 3.5 player datamodel
 * @author dunkean
 * @version 0.2
 */


class Player extends Syncable
{
	//Abilities
	public var Strength: String = "10";
	public var Dexterity: String = "10";
	public var Constitution: String = "10";
	public var Intelligence: String = "10";
	public var Wisdom: String = "10";
	public var Charisma: String = "10";
	
}






//Independent
//-----------
//.Progression: { classes: Array<class:{Class: String, level: Int} >, globalLevel(classes): Int } -- Bonusable(class.level, globalLevel)
//.Inner: {race: enum, alignment: enum, size: float, age: int, gender: enum, weight: float} -- Bonusable(Size)
//.Abilities: {STR:int, STRBonus(STR):int, DEX:int, DEXBonus(DEX):int, CON:int, CONBonus(CON):int, INT:int, INTBonus(INT):int, CHA:int, CHABonus(CHA):int, SAG:int, SAGBonus(SAG):int} -- Bonusable(STR, DEX, CON, INT, CHAR, SAG)
//
//Dependent
//---------
//.Life: {hitDiceRolls: Array<int>, hpModifs: Array<int>, totalLife(Abilities.CON, hitDiceRolls, Progression.globalLevel): Int, currentLife(totalLife, hpModifs)} -- Bonusable(TotalLife) -- DependsOn (Abilities, Progression)
//.SavingThrows: {FOR(Ability.CON, Progression.classes): Int, REF(Ability.DEX, Progression.classes): Int, WIL(Ability.SAG, Progression.classes): Int} --  Bonusable(FOR, REF, WIL) -- DependsOn (Abilities)
//.Skills: Array<Skill>
//.Skill: {type:enum, value(rank, abilityBonus): Int, rank: Int, abilityBonus(type, Abilities.*): Int} -- Bonusable(value) -- DependsOn(Abilities)
//.Celerity: {initiative(Ability.DEX): Int, baseSpeed(Inner.Race, Progression.classes): squares:Int/meters:Float, speed(baseSpeed, Equipment.totalWeight): squares:Int/meters:Float} -- Bonusable(initiative, speed) -- DependsOn
          //(Equipment, Abilities, Inner, Progression)
//.Language: {languages(learntLanguages, innerLanguages): Array<enum>, maxLangage(Inner.race, Progression.classes): Int, learntLanguages: Array<enum>, innerLanguages(Inner.race): Array<enum>} -- Bonusable(languages) --     
          //DependsOn(Inner, Progression)
//.Armor: {AC(naturalArmor, armorBonus, shieldBonus, Inner.size, maxDexBonus):Int, FF_AC(naturalArmor, armorBonus, shieldBonus, Inner.size):Int, TOUCH_AC(shieldBonus, Inner.size, maxDexBonus):Int, 
         //naturalArmor(Inner.race, Progression.classes):Int, armorBonus(Equipment.EquipedItems.slot.armor): Int, shieldBonus(Equipment.EquipedItems.slot.shield): Int, maxDexBonus(Equipment.EquipedItems.slot.armor, Ability.DEX): Int} -- Bonusable(AC, FF_AC, TOUCH_AC) -- DependsOn(Inner, Progression, Equipment, Ability)
//
//.Attacks: Array<Attack>
//.Attack: {type: enum, touch: Touch, damage:Damage, crit(type):enum} -- Bonusable(crit)
//.Touch: {baseTouch(Progression.classes): Array<Int>, grapple(baseAttacks, Ability.FOR, Inner.size): Int, abilityBonus(Attack.type, Abilities.*): Int, weaponBonus(Equipement.EquipedItems.slot.weapon): Int,
        //touch(baseTouch, abilityBonus, weaponBonus): Array<Int>} -- Bonusable(touch) -- DependsOn(Progressions, Abilities, Attack, Equipment)
//.Damages: Array<Damage>
//.Damage: {dice: enum/Int, count: Int, damageType: enum, weaponBonus(Equipement.EquipedItems.slot.weapon): Int, damageBonus(Attack.type, Abilities.*, weaponBonus, Abilities.FOR)} -- Bonusable(count, damageBonus) 
        //-- DependsOn(Abilities, Equipment, Attack)
//
//TODO: Damage.DamageDone, Attack.AttackDone. Touch.PowerBonus, Damage.PowerBonus
//
//
//Volatile
//--------
//Equipment: {totalWeight(EquipedItems, WornItems): Float, EquipedItems: Map<slot: enum, item:Item>, WornItems: Map<bag: String, item:Item>}
//DailySpells
//
//Database
//--------
//ClassBase: Array<Base>
//Spell: {name: String, school: enum, level:Int, target: enum, duration: Int, effect(Progression.level): Effect}
//SpellBase: Array<Spell>
//Power: {name: String, effect: Effect, type: enum[feat, racial, learnt, class?]}
//PowerBase: Array<Power>
//Item: {name: String, weight:Float, slot: enum, bonus: Bonus, effect: Effect}
//ItemBase: Array<Item>
//
//- *Langages: name / ALL
//
//- Effect: *(jsonSet) / duration / charge / recharge
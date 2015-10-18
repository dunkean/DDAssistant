package models.magic;

//import haxe.ui.toolkit.controls.Divider;
import models.magic.SpellDB.AnonSpell;
import network.Syncable;
import haxe.ds.StringMap;
/**
 * D&D 3.5 Spell datamodel
 * @author cda
 * @version 0.2
 */
class Spell extends Syncable
{
	public var name:String = "";
	public var level:Int = 0;
	public var range:String = "";
	public var target:String = "";
	public var duration:Duration;
	public var castingTime:Duration;

	public var levelPerClass:StringMap<Int>;
	
	public var summary:String = "";
	public var description:String= "";

	
	public var damage:Damage = new Damage();
	public static function parse(sort:AnonSpell) {
		var ret:Spell = new Spell();
		ret.name = sort.nom;
		ret.summary = sort.resume;
		ret.description = sort.description;
		ret.level = sort.classLevel;
		return ret;
	}
}
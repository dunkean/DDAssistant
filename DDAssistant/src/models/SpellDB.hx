package models;
import haxe.Json;
import sys.io.File;
import sys.FileSystem;
import haxe.Json;
/**
 * ...
 * @author cda
 */
typedef AnonSpell = {
	var nom:String;
	var niveau:Map<String, Int>;
}
class SpellDB
{
	public var content:Array<Dynamic>;
//	public var byLevel: Array < Array<Spell> >= new Array<Array<Spell>>();
//	public var byClass: Map< String, Array<Spell> >= new Map<String, Array<Spell>>();
	public function new() 
	{
	
		DDAssistant.console("NEW SPELL DB");
		DDAssistant.console("db/Spells_Ens_6.json" + sys.FileSystem.exists("db/Spells_Ens_6.json"));
		try {
			var file:String = File.getContent("./db/Spells_Ens_6.json");
			var content:Array<AnonSpell> = Json.parse( file );
			//DDAssistant.console(content);
			//var spells:Array<String> = Reflect.fields(content);
			for ( sort in content ) {
				DDAssistant.console(sort.nom);
				DDAssistant.console(" "+sort.niveau["Ens/Mag"]);
				//DDAssistant.console(sort.nom);
			}
		}
		catch (e:Dynamic) {
			DDAssistant.console(e);
		}
	}
	/*
	macro public static function json(path : String) {
    var value = sys.io.File.getContent(path),
        json = haxe.Json.parse(value);
    return macro $v{json};
	}
	*/
}
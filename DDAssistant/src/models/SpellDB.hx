package models;
import haxe.Json;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;
import sys.io.File;
import sys.FileSystem;
import haxe.Json;
import ru.stablex.ui.UIBuilder;
import flash.Lib;
/**
 * ...
 * @author cda
 */
typedef AnonSpell = {
	var nom:String;
	var description:String;
	var resume:String;
	var niveau:Map<String, String>;
}
class SpellDB
{
	public var content:Array<Dynamic>;
	public var view:Widget;
//	public var byLevel: Array < Array<Spell> >= new Array<Array<Spell>>();
//	public var byClass: Map< String, Array<Spell> >= new Map<String, Array<Spell>>();
	public function new() 
	{
		view = UIBuilder.create(SpellDBView);
		flash.Lib.current.addChild( UIBuilder.buildFn('ui/spellitem.xml')() );
	
		var dices= ~/(\d+d\d+) ((.*) (par\s|\/\s?)(niv|round)\w*|.*)/i;
		var cap= ~/.*\(.*max\D*(\d+d\d+)/i;
		var cap2= ~/.*\(\D*(\d+d\d+)\D*max.*\)/i;
		DDAssistant.console("NEW SPELL DB");
		try {
			//deployer dev "C:\Qt\Qt5.4.2\5.4\msvc2010_opengl\bin" "C:\Qt\QT5.4.2_msvc2010_opengl_static\msvc2010_opengl\bin" "C:\Qt\Qt5.4.2\Tools\QtCreator\bin" "C:\Users\dartnell\Documents\DEV\PrintackV2Deployer__conf\DefaultBuildList.txt" "C:\Users\dartnell\Documents\DEV\PrintackV2Deployer__conf2"
			var file:String = File.getContent("db/Spells_Ens_6.json");
			var content:Array<AnonSpell> = Json.parse( file );
/*
			for ( sort in content ) {
				var scaling:String ="";
				var effect:String="";
				var type:String="";
				var capedEffect:String="";
				DDAssistant.console(sort.nom);
				DDAssistant.console(Reflect.field(sort.niveau, "Ens/Mag"));
				if ( dices.match(sort.description) ) {
					effect = dices.matched(1);
					if ( dices.matched(5) != null ) {
						type = dices.matched(2);
						scaling = dices.matched(5);
					}
//					else {
//						type = dices.matched(2);
//					}
					if( cap.match(sort.description) ) {
						capedEffect= cap.matched(1);
					}
					else if (cap2.match(sort.description) ) {
						capedEffect= cap2.matched(1);
					}
					DDAssistant.console("damage: " + effect +" " + scaling);
					DDAssistant.console("Type :" +type);
					DDAssistant.console("max: " + capedEffect); 

				}
				//DDAssistant.console(sort.nom);
			}
			*/
			DDAssistant.console(content.length + " spells loaded");
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
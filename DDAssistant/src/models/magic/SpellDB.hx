package models.magic;
import format.svg.Text;
import haxe.Json;
import haxe.ui.toolkit.containers.Accordion;
import haxe.ui.toolkit.containers.ExpandablePanel;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.RootManager;
import haxe.ui.toolkit.controls.Progress;
import haxe.ui.toolkit.core.XMLController;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.VBox;
import ru.stablex.ui.widgets.Widget;
import sys.io.File;
import sys.FileSystem;
import haxe.Json;
import ru.stablex.ui.UIBuilder;
import flash.Lib;
import haxe.ui.toolkit.events.UIEvent;
import models.magic.SpellSelectionListener;
/**
 * ...
 * @author cda
 */
typedef AnonSpell = {
	var nom:String;
	var description:String;
	var resume:String;
	var niveau:Map<String, String>;
	var classLevel:Int;
}
@:build(haxe.ui.toolkit.core.Macros.buildController("ui/magic/spelldb.xml"))
class SpellDB extends XMLController
{
	public var byLevel: Array < Array<AnonSpell> > ;
	private var content:Array<AnonSpell>;	
	private var selectionListener:SpellSelectionListener;
	
	var dices= ~/(\d+d\d+) ((.*) (par\s|\/\s?)(niv|round)\w*|.*)/i;
	var cap= ~/.*\(.*max\D*(\d+d\d+)/i;
	var cap2= ~/.*\(\D*(\d+d\d+)\D*max.*\)/i;

//	public var byClass: Map< String, Array<Spell> >= new Map<String, Array<Spell>>();
	private static var instance:SpellDB = null;
	public static inline function getInstance():SpellDB
  	{
    	if (instance == null)
          return instance = new SpellDB();
      	else
          return instance;
  	}
	private function new() 
	{
		
	//	view = UIBuilder.create(SpellDBView);
		//flash.Lib.current.addChild( UIBuilder.buildFn('ui/magic/spellitem.xml')() );
		//byLevel = new Array<Array<Spell>>();
		DDAssistant.console("NEW SPELL DB");
		try {
			//deployer dev "C:\Qt\Qt5.4.2\5.4\msvc2010_opengl\bin" "C:\Qt\QT5.4.2_msvc2010_opengl_static\msvc2010_opengl\bin" "C:\Qt\Qt5.4.2\Tools\QtCreator\bin" "C:\Users\dartnell\Documents\DEV\PrintackV2Deployer__conf\DefaultBuildList.txt" "C:\Users\dartnell\Documents\DEV\PrintackV2Deployer__conf2"
			var file:String = File.getContent("db/Spells_Ens_6.json");
	//		var file:String = File.getContent("db/Spells.json");
			content = Json.parse( file );
	/*
			var current = 0;
			
			DDAssistant.showProgress(0, content.length, "parsing spells " + current + "/" + content.length);
			for ( sort in content ) {
				var scaling:String ="";
				var effect:String="";
				var type:String="";
				var capedEffect:String="";
	//			DDAssistant.console(sort.nom);
	//			DDAssistant.console(Reflect.field(sort.niveau, "Ens/Mag"));
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
	//				DDAssistant.console("damage: " + effect +" " + scaling);
	//				DDAssistant.console("Type :" +type);
	//				DDAssistant.console("max: " + capedEffect); 
				}
				DDAssistant.console((++current)+ "/"+content.length);
				DDAssistant.updateProgress( current, "parsing spells "+current+"/"+content.length );
				//DDAssistant.console(sort.nom);
			}
			*/
			DDAssistant.console(content.length + " spells loaded");
			DDAssistant.closeProgress();
			
		}
		catch (e:Dynamic) {
			DDAssistant.console(e);
		}
	}
	
	public function getList(caster:String, level:Int) {
		DDAssistant.console("getList");
		getComponent('list').removeAllChildren();
		var target = "" + level;
		var current:Int = 0;
		if ( byLevel == null ) {
			byLevel = new Array < Array<AnonSpell> > ();
		}
		while ( byLevel.length <= level ) {
			byLevel.push( new Array<AnonSpell>() );
		}
		//getComponent("list").removeAllChildren();
		var levelSpells:Array<AnonSpell> = byLevel[level];
		var current = 0;
		if ( levelSpells.length == 0 ) {
			DDAssistant.console('parsing spells');
			DDAssistant.showProgress(0, content.length, "selecting spells " + current + "/" + content.length);// , function() {
			
			DDAssistant.showProgress(0, content.length, "parsing spells " + current + "/" + content.length);
			for ( sort in content ) {
				if ( Reflect.field(sort.niveau, caster) == level ) {
					sort.classLevel = level;
					var scaling:String ="";
					var effect:String="";
					var type:String="";
					var capedEffect:String="";
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
		//				DDAssistant.console("damage: " + effect +" " + scaling);
		//				DDAssistant.console("Type :" +type);
		//				DDAssistant.console("max: " + capedEffect); 
						
					}
					levelSpells.push(sort);
					var spellItem:XMLController = new XMLController("ui/magic/spellitem.xml" );
					spellItem.getComponent("name").text = sort.nom;// + " : " + spell.resume;
					spellItem.getComponent("desc").text = sort.description;
					spellItem.view.id = "db_spell_" + current;
					var btn:Button = cast(spellItem.getComponent("spellAction"), Button);
					btn.text = "learn";
					btn.userData = sort;
					btn.addEventListener(UIEvent.CLICK, selectionListener.spellSelected);
					getComponent("list").addChild(spellItem.view);
				}
				if( ++current % 10 == 0 ) {
					DDAssistant.console((current)+ "/"+content.length);
					DDAssistant.updateProgress( current, "parsing spells " + current + "/" + content.length );
				}
			}
			
			DDAssistant.console(levelSpells.length + " spells loaded");
			byLevel[level] = levelSpells;
			DDAssistant.closeProgress();
		}
		else {
			DDAssistant.console("already filled");
			for ( spell in levelSpells ) {
				var spellItem:XMLController = new XMLController("ui/magic/spellitem.xml" );
				spellItem.getComponent("name").text = spell.nom;// + " : " + spell.resume;
				spellItem.getComponent("desc").text = spell.description;
				spellItem.view.id = "db_spell_" + (++current);
			
				getComponent("list").addChild(spellItem.view);
			}
		}
		return view;
	}
	public function setSelectionListener(listener:SpellSelectionListener) {
		DDAssistant.console("setting selection listener");
		selectionListener = listener;
	}
	/*
	macro public static function json(path : String) {
    var value = sys.io.File.getContent(path),
        json = haxe.Json.parse(value);
    return macro $v{json};
	}
	*/
}
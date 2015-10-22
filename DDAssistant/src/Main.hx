package;


import models.BaseElement;
import models.DiceType;
import models.Dice;
import models.Damage;
import models.TestClass;
import models.TestClass2;
import models.Player;
//import models.magic.Spell;
//import models.SpellDB;
//import models.magic.SorcererSpellBook;

import utils.UUID;

import haxe.Json;
import haxe.Serializer;
import haxe.Unserializer;
import network.Syncable;
import network.SyncSerializer;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.Lib;

import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;
import ru.stablex.ui.events.WidgetEvent;
import ru.stablex.ui.widgets.Box;
import ru.stablex.ui.widgets.Scroll;
import ru.stablex.ui.widgets.VBox;

#if !html5
	import network.Peer;
#end


/**
 * DDAssistant main window
 * @author dunkean
 * @version 0.2
 */
class Main extends ru.stablex.ui.widgets.Widget
{

	//properties
	public static var uuid: String;
	public static var assistant: String;
	
	//ui
	//public static var progressPopup:Root;
	//public static var progressBar:Progress;
    static public var alert : Dynamic->ru.stablex.ui.widgets.Floating; //callback to create alert popups
	
	/**
	 * Instanciate peer, resourceManager. Load last settings. 
	 */
	public static function main():Void
	{
		uuid = UUID.uuid(12, 16);
		assistant = 'Device-' + UUID.uuid(2, 16);
		loadSettings();

		configureStablex();		
		//addControlsListeners();
		#if !html5 
			Peer.start(); 
		#end
		
		
		
		//var spellDB = new SpellDB();
		//flash.Lib.current.addChild( UIBuilder.buildFn('sample.xml')() );
		//var s1:Spell = new Spell();
		//s1.damage = new Damage( BaseElement.Acid, new Dice(2, DiceType.D6) );
		//s1.damage.addDamage( BaseElement.Cold , "2d20");
		//s1.damage.addDamage( BaseElement.Cold , "2.5d20");
		//DDAssistant.console('S1: ' + s1.damage.roll() );
		
	}
	
	
	private static function configureStablex() {
		Lib.current.stage.align     = StageAlign.TOP_LEFT;
        //Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
        UIBuilder.setTheme('ru.stablex.ui.themes.android4');

        //register main class to access it's methods and properties in xml
        UIBuilder.regClass('Main');

        //initialize StablexUI
        UIBuilder.init('ui/android/defaults.xml');

        //register skins
        UIBuilder.regSkins('ui/android/skins.xml');

        //create callback for alert popup
        Main.alert = UIBuilder.buildFn('ui/alert.xml');

        //Create our UI
        //UIBuilder.buildFn('ui/index.xml')().show();
		UIBuilder.buildFn('ui/ddassistant.xml')().show();
		
		 // FPS counter {
             //var fps : flash.display.FPS = cast Lib.current.stage.addChild(new flash.display.FPS());
             //var format = new flash.text.TextFormat (flash.Assets.getFont ("ui/android/fonts/regular.ttf").fontName, 12, 0xFFFFFF);
             //fps.defaultTextFormat = format;
             //fps.selectable = false;
             //fps.embedFonts = true;
             //fps.x = 0;
             //fps.y = 0;
             //fps.mouseEnabled = false;
         //}
	}
	
	
	public static function log(string: String) {
		trace(string);
	}
	
	public static function showProgress(min:Int, max:Int, label:String, ?cb:Void ->Void) {
		/*
		var progress:XMLController = new XMLController("ui/progress.xml" );
		progress.getComponent("label").text = label;
		progressBar = cast( progress.getComponent("bar"), Progress);
		progressBar.pos= 0;
		progressBar.min = min;
		progressBar.max= max;
		Toolkit.openPopup( { percentWidth: 90, height: 100 }, function(root:Root) {
			progressPopup = root;
			root.addChild(progress.view);
			if ( cb != null ){
				cb();
			}
		});
		*/
	}
	public static function updateProgress(current:Int, ?label:String) {
		/*if( label != null ) {
			progressPopup.findChild("label").text = label;
		}*/
		//progressBar.pos= current;	
	}
	public static function closeProgress() {
		//RootManager.instance.destroyRoot(progressPopup);
	}
	private static function loadSettings() {
		//if (!FileSystem.exists(SystemPath.applicationStorageDirectory)) {
			//try{
				//FileSystem.createDirectory(SystemPath.applicationStorageDirectory);
			//}catch (e: Dynamic) {
				//DDAssistant.console("Cannot create data folder >\n" + e); 
			//}
		//}
		//
		//var settingsPath = SystemPath.applicationStorageDirectory + "/settingsPath.json";
		//
		//if (FileSystem.exists(settingsPath)) {
			//try{
				//var json = File.getContent(settingsPath);
				//var settings: Settings = Json.parse(json);
				//uuid = settings.uuid;
				//name = settings.name;
				//DDAssistant.console("DDAssistant Loaded");
			//}catch (e: Dynamic) {
				//DDAssistant.console("Cannot load settings. Creating new.");
				//return;
			//}
		//}else {
			//uuid = UUID.uuid(12, 16);
			//name = 'Device-' + UUID.uuid(2, 16);
			//var settings: Settings = {
				//name: DDAssistant.name,
				//uuid: DDAssistant.uuid
			//}
			//DDAssistant.console("DDAssistant Constructed");
			//var json = Json.stringify(settings);
			//try {
				//var f = File.append(settingsPath);
				//f.writeString(json);
				//f.close();
			//}catch (e: Dynamic) {
				//DDAssistant.console(e);
			//}
		//}
	}
}
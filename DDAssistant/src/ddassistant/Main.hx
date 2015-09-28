package ddassistant;

/**
 * Main class of DDAssistant
 * @author dunkean
 */

import ddassistant.Main.Test;
import haxe.ui.toolkit.containers.Stack;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.themes.GradientTheme;

class Test {
	
	public var testVar(default, set): String = "MAISON";
	function set_testVar(v: String) {
		trace("SETSETSET");
		this.testVar = v;
		return v;
	}
	 
}

class Main {
	
	/**
	 * Set theme / instanciate DDAssistant.
	 */
	
    static function main() {
		var test = new Test();
		test.testVar = "NOT NEW";
		Reflect.setField(test, "testVar", "NEW VALUE");
		trace(test.testVar);
		
       	Toolkit.theme = new GradientTheme();
		Toolkit.setTransitionForClass(Stack, "none");
		Toolkit.init();
		Toolkit.openFullscreen(function(root:Root) {
			var controller = new DDAssistant();
			root.addChild(controller.view);
		});
	}
}

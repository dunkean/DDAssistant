package;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.Lib;
import ru.stablex.ui.events.WidgetEvent;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Box;
import ru.stablex.ui.widgets.Scroll;
import ru.stablex.ui.widgets.Widget;


/**
* Simple demo project for StablexUI
*/
class Main extends ru.stablex.ui.widgets.Widget{
    /**
    * Enrty point
    *
    */
    static public function main () : Void{

        Lib.current.stage.align     = StageAlign.TOP_LEFT;
        Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;

        //register Main so we can use it in xml.
        UIBuilder.regClass("Main");
		UIBuilder.regClass('MyScroll');

        //initialize StablexUI
        UIBuilder.init();

        //Create our UI
        Lib.current.addChild( UIBuilder.buildFn('assets/ui/index.xml')() );
		
		//var widget : Scroll = cast UIBuilder.get('scrollZone');
		//var item1 : Widget = cast UIBuilder.get('item1');
		//var item2 : Widget = cast UIBuilder.get('item2');
		//var box : Box = cast UIBuilder.get('box');
		//
		//function frameEvent(event:flash.events.Event){
			////trace(box.y + " " + box.h);
		//};
	//
		//widget.addEventListener(WidgetEvent.SCROLL_START, function(event:WidgetEvent) {
			////trace('starting scroll');
			//widget.addEventListener(flash.events.Event.ENTER_FRAME, frameEvent);
		//});
		//
		//widget.addEventListener(WidgetEvent.SCROLL_STOP, function(event:WidgetEvent) {
			//widget.removeEventListener(flash.events.Event.ENTER_FRAME, frameEvent);
			////trace('ending scroll');
		//});
		//

    }//function main()
	
	


}//class Main



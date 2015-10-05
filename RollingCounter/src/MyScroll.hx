package ;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import ru.stablex.Assets;
import ru.stablex.ui.ClassBuilder;
import ru.stablex.ui.UIBuilder;
import flash.events.MouseEvent;
import flash.events.TouchEvent;
import ru.stablex.ui.events.ScrollEvent;
import ru.stablex.ui.events.WidgetEvent;
import ru.stablex.ui.widgets.HBox;
import ru.stablex.ui.widgets.Widget;
import ru.stablex.ui.widgets.Slider;
import ru.stablex.Err;


/**
* Scroll counter.
* First child of this widget will be used as container for scrolled content.
* When scrolling is about to start, <type>ru.stablex.ui.events.ScrollEvent</type>.BEFORE_SCROLL is dispatched.
* Handle this event to cancel scrolling if needed.
*
* @dispatch <type>ru.stablex.ui.events.WidgetEvent</type>.SCROLL_START - on start scrolling
* @dispatch <type>ru.stablex.ui.events.WidgetEvent</type>.SCROLL_STOP - on stop scrolling
* @dispatch <type>ru.stablex.ui.events.ScrollEvent</type>.BEFORE_SCROLL - dispatched when scrolling is about to start
*/
class MyScroll extends Widget{

    /**
    * :TODO:
    * On cpp application segfaults if scrolling is performed while resizing scroll widget
    */

    //allow vertical scrolling
    public var vScroll : Bool = true;
    //allow horizontal scrolling
    public var hScroll : Bool = true;
    //allow scrolling by mouse wheel
    public var wheelScroll : Bool = true;
    /**
    * Modifier to scroll horizontally instead of vertically, when using mouse wheel
    * Possible values: shift, alt, ctrl
    * Note for flash: some browsers reserve shift+wheel, alt+wheel, ctrl+wheel combinations
    */
    public var hScrollKey : String = 'alt';
    //allow scrolling by dragging
    public var dragScroll : Bool = true;
	
	
	
    /**
    * Container for content. Content is scrolled by moving this container.
    * This is always the first child of Scroll widget
    */
    public var box (get_box, never) : Widget;
	//public var box2 (get_box2, never) : Widget;

    //determine how far mouse wheel deltas will scroll the content
    public var wheelScrollSpeed : Float = 30;

    //scroll position along x axes
    public var scrollX (get_scrollX,set_scrollX) : Float;
    //scroll position along y axes
    public var scrollY (get_scrollY, set_scrollY) : Float;
	
	public var refUnitsY : Float;

	var cycleLength: Float;
	var stepLength: Float;
	
	
    /**
    * For neko and html5 targets onMouseDown dispatched several times (depends on display list depth)
    */
    private var _processingDrag : Bool = false;

	//private var numValue (default, set): Int = 0;

    /**
    * Constructor
    *  `.overflow` = false by default
    */
    public function new () : Void {
        super();
        this.overflow = false;
        this.addUniqueListener(MouseEvent.MOUSE_WHEEL, this._beforeScroll);
        this.addUniqueListener(MouseEvent.MOUSE_DOWN, this._beforeScroll);
    }//function new()

    
	/**
    * Getter for `.box`
    *
    */
    @:noCompletion private function get_box () : Widget {
		var child : DisplayObject = this.getChildAt(0);
		var widget: Widget = cast(child, Widget);
		return widget;
    }//function get_box()

	//@:noCompletion private function get_box2 () : Widget {
		//var child : DisplayObject = this.getChildAt(0);
		//var widget: Widget = cast(child, Widget);
		//return widget;
    //}//function get_box()


    /**
    * Setter for .scrollX
    *
    */
    @:noCompletion private function set_scrollX (x:Float) : Float {
        if( this.box._width > this._width ){
            if( x > 0 ) x = 0;
            if( x + this.box._width < this._width ) x = this._width - this.box._width;
    	} else {
    	    x = 0;
    	}

        this.box.left = x;
        return x;
    }//function set_scrollX()


    /**
    * Getter for .scrollX
    *
    */
    @:noCompletion private function get_scrollX () : Float {
        return this.box.left;
    }//function get_scrollX()


    /**
    * Setter for .scrollY
    *
    */
	var lastVal:Int = 0;
	var direction: Int = 1;
	var tenthDigit: Int = 0;
	var unitDigit: Int = 0;
	
    @:noCompletion private function set_scrollY (y:Float) : Float {
		stepLength = this.box._height / 11;
		cycleLength = stepLength * 10;
		this.refUnitsY = y;
		
        this.box.top = refUnitsY % cycleLength;
		if (box.top > 0) {
			box.top -= cycleLength; 
			if (unitDigit == 0 && direction == -1) {
				this.box.getChildAt(0).visible = false;
				this.box.getChildAt(1).visible = false;
				this.box.getChildAt(2).visible = true;
				this.box.getChildAt(3).visible = true;
			}
		}
		
		if (box.top < stepLength) {
			if (unitDigit == 0 && direction == 1) {
				this.box.getChildAt(0).visible = true;
				this.box.getChildAt(1).visible = true;
				this.box.getChildAt(2).visible = false;
				this.box.getChildAt(3).visible = false;
			}
		}
		
		
		var currentVal = Math.round((Math.abs(box.top / cycleLength) * 10)) % 10;
		
		if (currentVal != lastVal) {
			direction = currentVal - lastVal;
			lastVal = currentVal;
			if (direction == 9) direction = -1;
			if (direction == -9) direction = 1;
			unitDigit += direction;
			trace(currentVal + " " + lastVal + " > " + direction +" : " + unitDigit);
		}
        return refUnitsY;
    }//function set_scrollY()


    /**
    * Getter for .scrollY
    *
    */
    @:noCompletion private function get_scrollY () : Float {
        return this.box.top;
		//return refY;
    }//function get_scrollY()


    /**
    * Refresh container too
    *
    */
    override public function refresh () : Void {
        this.box.refresh();
        super.refresh();
        //this.box.addUniqueListener(WidgetEvent.INITIAL_RESIZE, this._update);
        //this.box.addUniqueListener(WidgetEvent.RESIZE, this._update);
        //this._update();
    }//function refresh()


    /**
    * Update bars, scrollX/scrollY etc.
    *
    */
    //private function _update (e:Event = null) : Void {
        
        // Check so that we are not scrolled too far
        //if (scrollY < this.h - this.box.h) {
            //scrollY = this.h - this.box.h;
        //}
        //if (scrollX < this.w - this.box.w) {
           //scrollX = this.w - this.box.w;
        //}
    //}//function _update()


  
    /**
    * When user want to scroll, dispatch ScrollEvent.BEFORE_SCROLL
    *
    */
    private function _beforeScroll(e:MouseEvent) : Void {
        this.addUniqueListener(ScrollEvent.BEFORE_SCROLL, this._startScroll);
        var e : ScrollEvent = new ScrollEvent(ScrollEvent.BEFORE_SCROLL, e);
        this.dispatchEvent(e);
    }//function _beforeScroll()


    /**
    * Start scrolling
    *
    */
    private function _startScroll(e:ScrollEvent) : Void {
        this.removeEventListener(ScrollEvent.BEFORE_SCROLL, this._startScroll);

        //scrolling cancelled
        if( e.canceled ) return;

        //scrolling by drag
        if( e.srcEvent.type == MouseEvent.MOUSE_DOWN && this.dragScroll ){
            this._dragScroll( e.srcAs(MouseEvent) );
        //scrolling by mouse wheel
        }else if( e.srcEvent.type == MouseEvent.MOUSE_WHEEL && this.wheelScroll ){
            this._wheelScroll( e.srcAs(MouseEvent) );
        }
    }//function _startScroll()


    /**
    * Start scroll by drag
    *
    */
    private function _dragScroll (e:MouseEvent) : Void {

        if( this._processingDrag ) return;
        this._processingDrag = true;
		
		stepLength = this.box._height / 11;
		cycleLength = stepLength * 10;

        var dx       : Float = this.mouseX - this.scrollX;
        var dy       : Float = this.mouseY - this.scrollY;
        var lastX    : Float = this.mouseX;
        var lastY    : Float = this.mouseY;
        var lastDx   : Float = 0;
        var lastDy   : Float = 0;
        var startX   : Float = this.mouseX;
        var startY   : Float = this.mouseY;
        var scrolled : Bool = false;
        //allowed scroll directions
        var vScroll : Bool = true; // (this.vScroll && this.box.h > this.h);
        var hScroll : Bool = true; // (this.hScroll && this.box.w > this.w);

        //stop previous scrolling
        this.tweenStop(["scrollX", "scrollY"], false, true);

        //Looks like html5 target does not respect .mouseChildren
        #if html5
            var blocker : Sprite = new Sprite();
            blocker.graphics.beginFill(0x000000, 0);
            blocker.graphics.drawRect(0, 0, this.w, this.h);
            blocker.graphics.endFill();
        #end

        //follow mouse pointer
        var fn = function(e:Event) : Void {
            if( scrolled ){
                if( hScroll ) this.scrollX = this.mouseX - dx;
                if( vScroll ) this.scrollY = this.mouseY - dy;

            //if user realy wants to scroll instead of interacting with content,
            //disable processing mouse events by children
            }else if(
                (hScroll && !scrolled && Math.abs(this.mouseX - startX) >= 5)
                || (vScroll && !scrolled && Math.abs(this.mouseY - startY) >= 5)
            ){
                #if html5 this.addChild(blocker); #end
                scrolled = true;
                this.box.mouseEnabled = false;
                this.box.mouseChildren = false;
                this.dispatchEvent(new WidgetEvent(WidgetEvent.SCROLL_START));
            }

            lastDx = this.mouseX - lastX;
            lastDy = this.mouseY - lastY;

            lastX = this.mouseX;
            lastY = this.mouseY;
        }//fn()

        //follow pointer
        this.addUniqueListener(Event.ENTER_FRAME, fn);

        //stop following
        var fnStop : MouseEvent->Void = null;
        fnStop = function(e:MouseEvent) : Void {
            this._processingDrag = false;

            this.removeEventListener(Event.ENTER_FRAME, fn);
            Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, fnStop);

            //if( scrolled ){
                var finish : Void->Void = function() : Void {
                    this.dispatchEvent(new WidgetEvent(WidgetEvent.SCROLL_STOP));
					//var val = (Math.abs(refY / cycleLength) * 10) % 10;
					//this.numValue = Math.round(val);
                };
				
				var distanceToYValue = Math.abs(scrollY % stepLength);
				if (distanceToYValue > (stepLength/2))
					distanceToYValue -= stepLength;
					
                //go-go!
                if( vScroll && hScroll ){
                    this.tween(0.4, {scrollX:this.scrollX + lastDx * 20, scrollY:this.scrollY + distanceToYValue}, 'Quad.easeOut').onComplete(finish);
                }else if( vScroll ){
                    this.tween(0.4, {scrollY:this.scrollY + distanceToYValue}, 'Expo.easeOut').onComplete(finish);
                }else{
                    this.tween(0.4, {scrollX:this.scrollX + distanceToYValue}, 'Expo.easeOut').onComplete(finish);
                }

                #if html5 if( blocker.parent == this) this.removeChild(blocker); #end
                this.box.mouseEnabled  = true;
                this.box.mouseChildren = true;
            //}
        }//fnStop()

        //stop scrolling
        Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, fnStop);
        Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, fnStop);
    }//function _dragScroll()


	//public function set_numValue(val: Int) {
		//numValue = val;
		//return val;
	//}
	
    /**
    * Scroll by wheel
    *
    */
    private function _wheelScroll (e:MouseEvent) : Void {
        //scroll horizontally
        if(
            this.hScroll
            && (
                (e.altKey && this.hScrollKey == 'alt')
                || (e.shiftKey && this.hScrollKey == 'shift')
                || (e.ctrlKey && this.hScrollKey == 'ctrl')
            )
        ){
            this.tweenStop();
            this.scrollX += e.delta * wheelScrollSpeed;

        //scroll vertically
        }else if( this.vScroll ){
            this.tweenStop();
            this.scrollY += e.delta * wheelScrollSpeed;
        }
    }//function _wheelScroll()


    /**
    * Stop scrolling. Use this method to interrupt inertial scrolling
    *
    */
    public function stopScrolling () : Void {
        this.tweenStop(['scrollX', 'scrollY']);
    }//function stopScrolling()

}//class Scroll


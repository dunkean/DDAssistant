package;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.Lib;
import openfl.Assets;
import openfl.display.BitmapData;
import ru.stablex.Assets;
import ru.stablex.ui.events.ScrollEvent;
import ru.stablex.ui.events.WidgetEvent;
import ru.stablex.ui.skins.Img;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;



/**
 * Rolling counter
 * @author dunkean
 * @version 0.1
 */
class Counter extends Widget
{

	private static var cycleLength: Float;
	private static var stepLength: Float;
	
	//public var value (get, set);
	//private var _value (get, set);
    
	public var numbers: Array<Widget> = new Array();
	public var posNumbers: Array<Widget> = new Array();
	public var negNumbers: Array<Widget> = new Array();
	
	private var scrollY(get,set): Float;
	private var scrollX: Float;
	private var refY: Float;
	private var refX: Float;

	private var _processingDrag : Bool = false;
	
	public function new () : Void {
        super();
        this.overflow = false;
		
		var bmpPosNumbers: BitmapData = Assets.getBitmapData("assets/img/numbers.png");
		var bmpNegNumbers: BitmapData = Assets.getBitmapData("assets/img/reversenumbers.png");
		stepLength = bmpPosNumbers.height / 11;
		cycleLength = stepLength * 10;
		var srcWidth = bmpPosNumbers.width;
		
		//this.h = stepLength;
		//this.w = srcWidth * 3;
		
		trace(this.h);
		trace(this.w);
		
		for (i in 0...3) {
			posNumbers.push(
				UIBuilder.create(Widget, {
					widthPt : 100,
					h: 770,
					left: srcWidth * i
				})
			);
			this.addChild(posNumbers[i]);
			
			negNumbers.push(
				UIBuilder.create(Widget, {
					widthPt : 100,
					h: 770,
					left: srcWidth * i
				})
			);
			this.addChild(negNumbers[i]);
		}
		
		for (i in 0...3) {
			posNumbers[i].skin = new Img();
			cast(posNumbers[i].skin, Img)._src = "assets/img/numbers.png";
			negNumbers[i].skin = new Img();
			cast(negNumbers[i].skin, Img)._src = "assets/img/reversenumbers.png";
		}
		
		for (i in 0...3) {
			negNumbers[i].visible = false;
		}
		numbers = posNumbers;
		
        this.addUniqueListener(MouseEvent.MOUSE_WHEEL, this._beforeScroll);
        this.addUniqueListener(MouseEvent.MOUSE_DOWN, this._beforeScroll);
    }
	
	
	//public static function resize( source:Bitmap, width:Int, height:Int ) : Bitmap
	//{
		//var scaleX:Float = width / source.bitmapData.width;
		//var scaleY:Float = height / source.bitmapData.height;
		//var data:BitmapData = new BitmapData(width, height, true);
		//var matrix:Matrix = new Matrix();
		//matrix.scale(scaleX, scaleY);
		//data.draw(source.bitmapData, matrix);
		//return new Bitmap(data);
	//}
	
	
	private function _beforeScroll(e:MouseEvent) : Void {
        this.addUniqueListener(ScrollEvent.BEFORE_SCROLL, this._startScroll);
        var e : ScrollEvent = new ScrollEvent(ScrollEvent.BEFORE_SCROLL, e);
        this.dispatchEvent(e);
    }
	
	private function _startScroll(e:ScrollEvent) : Void {
        this.removeEventListener(ScrollEvent.BEFORE_SCROLL, this._startScroll);
        if( e.canceled ) return;

        if( e.srcEvent.type == MouseEvent.MOUSE_DOWN ){
            this._dragScroll( e.srcAs(MouseEvent) );
        }else if( e.srcEvent.type == MouseEvent.MOUSE_WHEEL ){
            this._wheelScroll( e.srcAs(MouseEvent) );
        }
    }
	
	
	
	var lastVal:Int = 0;
	var direction: Int = 1;
	var tenthDigit: Int = 0;
	var unitDigit: Int = 0;
	
    private function set_scrollY (y:Float) : Float {
		this.refY = y;
		
        this.numbers[0].top = refY % cycleLength;
		if (this.numbers[0].top > 0) {
			this.numbers[0].top -= cycleLength; 
			if (unitDigit == 0 && direction == -1) {
				for (i in 0...3) {
					negNumbers[i].visible = true;
					posNumbers[i].visible = false;
				}
				numbers = negNumbers;
			}
		}
		
		if (this.numbers[0].top < stepLength) {
			if (unitDigit == 0 && direction == 1) {
				for (i in 0...3) {
					negNumbers[i].visible = false;
					posNumbers[i].visible = true;
				}
				numbers = posNumbers;
			}
		}
		
		
		var currentVal = Math.round((Math.abs(this.numbers[0].top / cycleLength) * 10)) % 10;
		
		if (currentVal != lastVal) {
			direction = currentVal - lastVal;
			lastVal = currentVal;
			if (direction == 9) direction = -1;
			if (direction == -9) direction = 1;
			unitDigit += direction;
			trace(currentVal + " " + lastVal + " > " + direction +" : " + unitDigit);
		}
        return refY;
    }

	private function get_scrollY () : Float {
        return this.numbers[0].top;
    }

	
	private function _dragScroll (e:MouseEvent) : Void {
        if( this._processingDrag ) return;
        this._processingDrag = true;
		
        var dx       : Float = this.mouseX - this.scrollX;
        var dy       : Float = this.mouseY - this.scrollY;
        var lastX    : Float = this.mouseX;
        var lastY    : Float = this.mouseY;
        var lastDx   : Float = 0;
        var lastDy   : Float = 0;
        var startX   : Float = this.mouseX;
        var startY   : Float = this.mouseY;
        var scrolled : Bool = false;

        //stop previous scrolling
        this.tweenStop(["scrollX", "scrollY"], false, true);

        //html5 target does not respect .mouseChildren
        #if html5
            var blocker : Sprite = new Sprite();
            blocker.graphics.beginFill(0x000000, 0);
            blocker.graphics.drawRect(0, 0, this.w, this.h);
            blocker.graphics.endFill();
        #end

        var fn = function(e:Event) : Void {
            if( scrolled ){
                this.scrollX = this.mouseX - dx;
                this.scrollY = this.mouseY - dy;
				
            //disable processing mouse events by children
            }else if(
                (!scrolled && Math.abs(this.mouseX - startX) >= 5)
                || (!scrolled && Math.abs(this.mouseY - startY) >= 5)
            ){
                #if html5 this.addChild(blocker); #end
                scrolled = true;
                this.numbers[0].mouseEnabled = false;
                this.numbers[0].mouseChildren = false;
                this.dispatchEvent(new WidgetEvent(WidgetEvent.SCROLL_START));
            }

            lastDx = this.mouseX - lastX;
            lastDy = this.mouseY - lastY;

            lastX = this.mouseX;
            lastY = this.mouseY;
        }

        //follow pointer
        this.addUniqueListener(Event.ENTER_FRAME, fn);

        //stop following
        var fnStop : MouseEvent->Void = null;
        fnStop = function(e:MouseEvent) : Void {
            this._processingDrag = false;

            this.removeEventListener(Event.ENTER_FRAME, fn);
            Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, fnStop);

			var finish : Void->Void = function() : Void {
				this.dispatchEvent(new WidgetEvent(WidgetEvent.SCROLL_STOP));
			};
			
			var distanceToYValue = Math.abs(scrollY % stepLength);
			if (distanceToYValue > (stepLength/2))
				distanceToYValue -= stepLength;
				
			this.tween(0.4, {scrollX:this.scrollX + lastDx * 20, scrollY:this.scrollY + distanceToYValue}, 'Quad.easeOut').onComplete(finish);

			#if html5 if( blocker.parent == this) this.removeChild(blocker); #end
			this.numbers[0].mouseEnabled  = true;
			this.numbers[0].mouseChildren = true;
        }

        //stop scrolling
        Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, fnStop);
        Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, fnStop);
    }


	//public function set_numValue(val: Int) {
		//numValue = val;
		//return val;
	//}
	
    private function _wheelScroll (e:MouseEvent) : Void {
        //scroll horizontally
        //if(
            //this.hScroll
            //&& (
                //(e.altKey && this.hScrollKey == 'alt')
                //|| (e.shiftKey && this.hScrollKey == 'shift')
                //|| (e.ctrlKey && this.hScrollKey == 'ctrl')
            //)
        //){
            //this.tweenStop();
            //this.scrollX += e.delta * wheelScrollSpeed;
//
        ////scroll vertically
        //}else if( this.vScroll ){
            //this.tweenStop();
            //this.scrollY += e.delta * wheelScrollSpeed;
        //}
    }
}
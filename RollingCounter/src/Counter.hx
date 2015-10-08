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
	public var digitsCount = 3;
	private static var cycleLength: Float;
	private static var stepLength: Float;
	
	//public var value (get, set);
	//private var _value (get, set);
    
	public var numbers: Array<Widget> = new Array();
	public var posNumbers: Array<Widget> = new Array();
	public var negNumbers: Array<Widget> = new Array();
	
	private var scrollY(get,set): Float;
	private var absoluteY: Float = 0;

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
		
		for (i in 0...digitsCount) {
			posNumbers.push(
				UIBuilder.create(Widget, {
					widthPt : 100,
					h: 770,
					left: srcWidth * (digitsCount-1-i)
				})
			);
			this.addChild(posNumbers[i]);
			
			negNumbers.push(
				UIBuilder.create(Widget, {
					widthPt : 100,
					h: 770,
					left: srcWidth * (digitsCount-1-i)
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
		
        this.addUniqueListener(MouseEvent.MOUSE_WHEEL, this.startScroll);
		this.addUniqueListener(MouseEvent.MOUSE_DOWN, this.startScroll);
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

	
	
	
	private function startScroll(e:MouseEvent) : Void {
        if ( e.type == MouseEvent.MOUSE_DOWN ) {
			trace("drag");
            this._dragScroll( e );
        }else if ( e.type == MouseEvent.MOUSE_WHEEL ) {
			trace("wheel");
            this._wheelScroll( e );
        }
    }
	
	
	var lastVal:Int = 0;
	var direction: Int = 1;
	var tenthDigit: Int = 0;
	var unitDigit: Int = 0;
	
    private function set_scrollY (y:Float) : Float {
		this.absoluteY = y;
		
        this.numbers[0].top = absoluteY % cycleLength;
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
        return absoluteY;
    }
	
	var ySum : Float = 0;
	private function scrollDigits (y:Float) : Void {
		ySum += y;
		if (ySum > 0) {
			if (negNumbers[0].visible == false) {
				for (i in 0...3) {
					negNumbers[i].visible = true;
					posNumbers[i].visible = false;
				}
				numbers = negNumbers;
			}
			this.numbers[0].top = ySum % cycleLength;
			this.numbers[0].top -= cycleLength;
		}else {
			if (posNumbers[0].visible == false) {
				for (i in 0...3) {
					negNumbers[i].visible = false;
					posNumbers[i].visible = true;
				}
				numbers = posNumbers;
			}
			this.numbers[0].top = ySum % cycleLength;
		}
		
    }

	private function get_scrollY () : Float {
        return this.numbers[0].top;
    }

	
	private function _dragScroll (e:MouseEvent) : Void {
        //var dy       : Float = this.mouseY - this.scrollY;
		var dy 		 : Float = 0;
        var lastY    : Float = this.mouseY;
        var lastDy   : Float = 0;
        var startY   : Float = this.mouseY;
        var scrolled : Bool = false;

        this.tweenStop(["scrollY"], false, true);

		
        //follow pointer
        var fn = function(e:Event) : Void {
            //this.scrollY = this.mouseY - dy;
            lastDy = this.mouseY - lastY;
            lastY = this.mouseY;
			scrollDigits(lastDy);
        }
        this.addUniqueListener(Event.ENTER_FRAME, fn);
		//

        //stop following
        var fnStop : MouseEvent->Void = null;
        fnStop = function(e:MouseEvent) : Void {
            this.removeEventListener(Event.ENTER_FRAME, fn);
            Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, fnStop);

			var finish : Void->Void = function() : Void {
				this.dispatchEvent(new WidgetEvent(WidgetEvent.SCROLL_STOP));
			};
			
			//var distanceToYValue = Math.abs(scrollY % stepLength);
			//if (distanceToYValue > (stepLength/2))
				//distanceToYValue -= stepLength;
				//
			//this.tween(0.4, {scrollY:this.scrollY + distanceToYValue}, 'Quad.easeOut').onComplete(finish);
        }
        Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, fnStop);
        Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, fnStop);
		//
    }

	
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
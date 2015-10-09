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
	private var srcHeight = 770;
	private var srcWidth = 42;
	private static var cycleLength: Float;
	private static var stepLength: Float;
	
	public var digitsCount = 2;    
	public var numbers: Array<Widget> = new Array();
	public var posNumbers: Array<Widget> = new Array();
	public var negNumbers: Array<Widget> = new Array();
	private var ySum : Float = 0;
	private var _processingDrag : Bool = false;
	
	private var _value: Int;
	//public var value (get, set);
	
	
	public function new () : Void {
        super();
        this.overflow = false;
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

	override public function onCreate () : Void {
		//COMPUTE RESIZE HERE
		var bmpPosNumbers: BitmapData = Assets.getBitmapData("assets/img/numbers.png");
		var bmpNegNumbers: BitmapData = Assets.getBitmapData("assets/img/reversenumbers.png");
		stepLength = bmpPosNumbers.height / 11;
		cycleLength = stepLength * 10;
		srcWidth = bmpPosNumbers.width;
		srcHeight = bmpPosNumbers.height;
		
		for (i in 0...digitsCount) {
			posNumbers.push(
				UIBuilder.create(Widget, {
					widthPt : 100,
					h: srcHeight,
					left: srcWidth * (digitsCount-1-i)
				})
			);
			this.addChild(posNumbers[i]);
			
			negNumbers.push(
				UIBuilder.create(Widget, {
					widthPt : 100,
					h: srcHeight,
					left: srcWidth * (digitsCount-1-i)
				})
			);
			this.addChild(negNumbers[i]);
		}
		
		
		
		for (i in 0...digitsCount) {
			negNumbers[i].visible = false;
		}
		numbers = posNumbers;
		
		for (i in 0...digitsCount) {
			posNumbers[i].skin = new Img();
			cast(posNumbers[i].skin, Img)._src = "assets/img/numbers.png";
			negNumbers[i].skin = new Img();
			cast(negNumbers[i].skin, Img)._src = "assets/img/reversenumbers.png";
		}
		
		for (i in 0...digitsCount) {
			posNumbers[i].refresh();
			negNumbers[i].refresh();
		}
		//this.refresh();
		
		
        this.addUniqueListener(MouseEvent.MOUSE_WHEEL, this.startScroll);
		this.addUniqueListener(MouseEvent.MOUSE_DOWN, this.startScroll);
		
    }
	
	
	private function startScroll(e:MouseEvent) : Void {
        if ( e.type == MouseEvent.MOUSE_DOWN ) {
			//trace("drag");
            this._dragScroll( e );
        }else if ( e.type == MouseEvent.MOUSE_WHEEL ) {
			//trace("wheel");
            this._wheelScroll( e );
        }
    }
	
	
	//var lastVal:Int = 0;
	//var direction: Int = 1;
	//var currentVal = Math.round((Math.abs(this.numbers[0].top / cycleLength) * 10)) % 10;
	//
	//if (currentVal != lastVal) {
		//direction = currentVal - lastVal;
		//lastVal = currentVal;
		//if (direction == 9) direction = -1;
		//if (direction == -9) direction = 1;
		//unitDigit += direction;
		//trace(currentVal + " " + lastVal + " > " + direction +" : " + unitDigit);
	//}
	
	
	private function scrollDigits (y:Float) : Void {
		var dy = y * 3;
		ySum += dy;
		var modulo = ySum % cycleLength;
		if (ySum > 0) {
			
			if (negNumbers[0].visible == false) {
				for (i in 0...digitsCount) {
					negNumbers[i].visible = true;
					posNumbers[i].visible = false;
				}
				negNumbers[1].top = - cycleLength;
				//negNumbers[2].top = - cycleLength;
				numbers = negNumbers;
			}
			this.numbers[0].top = modulo - cycleLength;
			if ( modulo < (10 * stepLength) && modulo > (9 * stepLength) ) {
				this.numbers[1].top += dy;
			}
		}else {
			if (posNumbers[0].visible == false) {
				for (i in 0...digitsCount) {
					negNumbers[i].visible = false;
					posNumbers[i].visible = true;
				}
				numbers = posNumbers;
			}
			this.numbers[0].top = modulo;
			if ( modulo < (-9 * stepLength) && modulo > (-10 * stepLength)) {
				this.numbers[1].top += dy;
			}
			
		}
    }

	//public function set_unitDigit(y:Float): Float {
		//trace("set " + y);
		//numbers[0].top = y;
		//return y;
	//}

	
	private function _dragScroll (e:MouseEvent) : Void {
		var dy 		 : Float = 0;
        var lastY    : Float = this.mouseY;
        var lastDy   : Float = 0;
        var startY   : Float = this.mouseY;
        var scrolled : Bool = false;

        this.tweenStop(["scrollY"], false, true);
		#if html5
            var blocker : Sprite = new Sprite();
            blocker.graphics.beginFill(0x000000, 0);
            blocker.graphics.drawRect(0, 0, this.w, this.h);
            blocker.graphics.endFill();
        #end
		
        //follow pointer
        var fn = function(e:Event) : Void {
			#if html5 this.addChild(blocker); #end
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
			
			for (i in 0...digitsCount) {
				var distanceToYValue = Math.abs(numbers[i].top % stepLength);
				if (distanceToYValue > (stepLength/2))
					distanceToYValue -= stepLength;
				//if(i>0)
					numbers[i].top += distanceToYValue;
				//else
					//this.tween(0.4, { unitDigit: numbers[0].top + distanceToYValue}, 'Quad.easeOut').onComplete(finish);
			}
			
			_value = Math.round( -ySum / stepLength);
			
        }
		#if html5 if( blocker.parent == this) this.removeChild(blocker); #end
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
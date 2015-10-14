package;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.Lib;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.geom.Matrix;
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
	//XML CONFIGURABLE
	public var digitsCount = 2;    
	public var scrollSpeed = 2;
	public var wheelSpeed = 1;
	
	//COUNTER IMGS PARAMS
	private static var cycleLength: Float;
	private static var stepLength: Float;
	public var numbers: Array<Widget> = new Array();
	public var posNumbers: Array<Widget> = new Array();
	public var negNumbers: Array<Widget> = new Array();	

	//VALUE
	private var ySum : Float = 0;
	private var _value: Int;
	//public var value (get, set);
	
	
	public function new () : Void {
        super();
        this.overflow = false;
    }
	


	override public function onCreate () : Void {
		var bmpPosNumbers: BitmapData = Assets.getBitmapData("assets/img/numbers.png");
		var bmpNegNumbers: BitmapData = Assets.getBitmapData("assets/img/reversenumbers.png");
		
		var srcWidth = bmpPosNumbers.width;
		var srcHeight = bmpPosNumbers.height;

		var factorX = (this.w / digitsCount ) / srcWidth;
		var factorY = (this.h * 11) / srcHeight;
		
		for (i in 0...digitsCount) {
			posNumbers.push(
				UIBuilder.create(Widget, {
					widthPt : 100,
					h: srcHeight,
					left: factorX * srcWidth * (digitsCount-1-i)
				})
			);
			this.addChild(posNumbers[i]);
			posNumbers[i].scaleX = factorX;
			posNumbers[i].scaleY = factorY;
			
			negNumbers.push(
				UIBuilder.create(Widget, {
					widthPt : 100,
					h: srcHeight,
					left: factorX * srcWidth * (digitsCount-1-i)
				})
			);
			this.addChild(negNumbers[i]);
			negNumbers[i].scaleX = factorX;
			negNumbers[i].scaleY = factorY;
		}
		
		stepLength = (posNumbers[0].h / 11) * factorY;
		cycleLength = stepLength * 10;
		
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
	
	private function round(top: Float): Float {
		var distanceToYValue = Math.abs(top % stepLength);
		if (distanceToYValue > (stepLength/2))
			distanceToYValue -= stepLength;
		return distanceToYValue;
	}
	
	
	private function scrollDigits (y:Float) : Void {
		var dy = y;
		ySum += dy;
		var modulo = ySum % cycleLength;
		var digitsModulo: Array<Float> = new Array();
		for (i in 0...digitsCount - 1) {
			var digitCycleLength: Float = cycleLength * Math.pow(10, i);
			var digitSum: Float = ySum + (ySum > 0 ? 0.5 : -0.5) * stepLength;
			if (ySum > 0) 
				digitsModulo[i] = ( Math.floor( digitSum / digitCycleLength) * stepLength ) % cycleLength;
			else 
				digitsModulo[i] = ( Math.fceil( digitSum / digitCycleLength) * stepLength ) % cycleLength;
		}
		if (ySum > 0) {
			if (negNumbers[0].visible == false) {
				for (i in 0...digitsCount) {
					negNumbers[i].visible = true;
					posNumbers[i].visible = false;
				}
				numbers = negNumbers;
			}
			this.numbers[0].top = modulo - cycleLength;
			for (i in 0...digitsCount - 1) {
				this.numbers[i+1].top = digitsModulo[i] - cycleLength;
			}
			//Rolling during 9-10 transition
			//if ( modulo < (10 * stepLength) && modulo > (9 * stepLength) ) {
				//this.numbers[1].top += dy;
			//}
		}else {
			if (posNumbers[0].visible == false) {
				for (i in 0...digitsCount) {
					negNumbers[i].visible = false;
					posNumbers[i].visible = true;
				}
				numbers = posNumbers;
			}
			this.numbers[0].top = modulo;
			for (i in 0...digitsCount - 1) {
				this.numbers[i+1].top = digitsModulo[i];
			}
			//Rolling during 9-10 transition
			//if ( modulo < (-9 * stepLength) && modulo > (-10 * stepLength)) {
				//this.numbers[1].top += dy;
			//}
			
		}
    }

	
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
            lastDy = this.mouseY - lastY;
            lastY = this.mouseY;
			scrollDigits(lastDy*scrollSpeed);
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
				var distanceToYValue = round(numbers[i].top);
				numbers[i].top += distanceToYValue;
			}
			
			_value = Math.round( -ySum / stepLength);
			trace(_value);
			
        }
        Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, fnStop);
        Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, fnStop);
    }

	
    private function _wheelScroll (e:MouseEvent) : Void {
		if(e.delta > 0)
			scrollDigits(stepLength * wheelSpeed * -1);
		else
			scrollDigits(stepLength * wheelSpeed);
			
		for (i in 0...digitsCount) {
			var distanceToYValue = round(numbers[i].top);
			numbers[i].top += distanceToYValue;
		}
    }
}
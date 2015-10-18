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
import ru.stablex.ui.widgets.Text;
import ru.stablex.ui.widgets.Widget;



/**
 * Rolling counter
 * @author dunkean
 * @version 0.1
 */
class Counter extends Widget
{
	//STATIC UI PARAMS
	private static inline var counterWidthPt = 1;
	
	//XML CONFIGURABLE
	public var digitsCount = 2;    
	public var scrollSpeed = 2;
	public var wheelSpeed = 1;
	public var title = "CAR";
	public var posAsset = "assets/img/numbers.png";
	public var negAsset = "assets/img/reversenumbers.png";
	
	//COUNTER IMGS PARAMS
	private static var cycleLength: Float;
	private static var stepLength: Float;
	public var numbers: Array<Widget> = new Array();
	public var posNumbers: Array<Widget> = new Array();
	public var negNumbers: Array<Widget> = new Array();	

	//VALUE
	private var ySum : Float = 0;
	@:isVar private var _value(get, set): Int;
	public var value (get, set): Int;
	
	
	public function new () : Void {
        super();
        this.overflow = false;
    }
	
	/************************/
	/****   BIND LOGIC   ****/
	/************************/
	
	public function bind(syncableUuid: String, field: String): Void {
	
	}
	
	private function get__value(): Int {
		return this._value;
	}
	
	private function set__value(val: Int): Int {
		return this._value = val;
	}
	
	public function get_value(): Int {
		return this._value;
	}
	
	public function set_value(val: Int): Int {
		return this._value = val;
	}
	
	
	/************************/
	/*****   UI LOGIC   *****/
	/************************/

	override public function onCreate () : Void {
		//BEGIN create counter
		var bmpPosNumbers: BitmapData = Assets.getBitmapData(posAsset);
		var bmpNegNumbers: BitmapData = Assets.getBitmapData(negAsset);
		
		var srcWidth = bmpPosNumbers.width;
		var srcHeight = bmpPosNumbers.height;
		
		var counterAvailableWidth = this.w * counterWidthPt;
		var factorX = (counterAvailableWidth / digitsCount ) / srcWidth;
		var factorY = (this.h * 11) / srcHeight;
		
		for (i in 0...digitsCount) {
			posNumbers.push(
				UIBuilder.create(Widget, {
					widthPt : 100,
					h: srcHeight,
					left: factorX * srcWidth * (digitsCount-1-i) + (this.w - counterAvailableWidth)
				})
			);
			this.addChild(posNumbers[i]);
			posNumbers[i].scaleX = factorX;
			posNumbers[i].scaleY = factorY;
			
			negNumbers.push(
				UIBuilder.create(Widget, {
					widthPt : 100,
					h: srcHeight,
					left: factorX * srcWidth * (digitsCount-1-i) + (this.w - counterAvailableWidth)
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
			cast(posNumbers[i].skin, Img)._src = posAsset;
			negNumbers[i].skin = new Img();
			cast(negNumbers[i].skin, Img)._src = negAsset;
		}
		
		for (i in 0...digitsCount) {
			posNumbers[i].refresh();
			negNumbers[i].refresh();
		}
		
        this.addUniqueListener(MouseEvent.MOUSE_WHEEL, this.startScroll);
		this.addUniqueListener(MouseEvent.MOUSE_DOWN, this.startScroll);
		//END create counter
		
		//BEGIN create title
		//var texxxt = UIBuilder.create(Text, {
			//text  : title,
			//label : {
				//selectable : false
			//},
			//format     : {
				//font   : Assets.getFont('assets/font/GLECB.TTF').fontName,
				////italic : true,
				//color  : 0xFFFFFF,
				//size   : this.h
			//}
		//});
		//texxxt.h = srcHeight;
		////texxxt.scaleY = factorY;
		//this.addChild(texxxt);
		//END create title
    }
	
	
	private function startScroll(e:MouseEvent) : Void {
        if ( e.type == MouseEvent.MOUSE_DOWN ) {
            this._dragScroll( e );
        }else if ( e.type == MouseEvent.MOUSE_WHEEL ) {
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
		}
    }

	
	private function _dragScroll (e:MouseEvent) : Void {
		var dy 		 : Float = 0;
        var lastY    : Float = this.mouseY;
        var lastDy   : Float = 0;
        var startY   : Float = this.mouseY;
        var scrolled : Bool = false;

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
		if(e.delta < 0)
			scrollDigits(stepLength * wheelSpeed * -1);
		else
			scrollDigits(stepLength * wheelSpeed);
			
		for (i in 0...digitsCount) {
			var distanceToYValue = round(numbers[i].top);
			numbers[i].top += distanceToYValue;
		}
		
		_value = Math.round( -ySum / stepLength);
    }
}
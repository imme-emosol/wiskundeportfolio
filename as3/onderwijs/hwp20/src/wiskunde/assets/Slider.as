package wiskunde.assets
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	/**
	 * De slider is een Sprite die bestaat uit een marker die over een afstand van 300 pixels verschoven kan worden
	 * De Slider bepaalt de x-coordinaat van de marker. 
	 * De waarde van de slider is gelijk aan x.positieMarker * schaal
	 * @author Jelle Sjollema
	 */
	public class Slider extends Sprite
	{
		/**
		 * x-coordinaat marker vermenigvuldigd met de schaal
		 */
		public var waarde:Number;
		/**
		 * de schaal van de slider
		 */
		public var schaal:Number;
		
		private var txt:TextField;
		private var box:TextField;
		private var controller:Sprite;
		
		public function Slider(label:String='slider', schaal:Number = 1) 
		{
			this.schaal = schaal;
			box = new TextField();
			box.text = label;
			tekenAchtergrond();
			tekenController();
		}
		
		private function tekenAchtergrond():void
		{
			this.graphics.lineStyle(3, 0x333333);
			this.graphics.beginFill(0xeeeeee);
			this.graphics.drawRoundRect(-10, 0, 380, 50, 10, 10);
			
			this.graphics.lineStyle(2, 0x000000);
			this.graphics.moveTo(0, 25);
			this.graphics.lineTo(300, 25);
			
			for (var i:uint = 0; i <= 300; i++)
			{
				if (i % 10 == 0 )
				{
					this.graphics.lineStyle(1);
					this.graphics.moveTo(i,20);
					this.graphics.lineTo(i, 30);
					
				}
				if (i % 50 == 0 )
				{
					this.graphics.lineStyle(3);
					this.graphics.moveTo(i,15);
					this.graphics.lineTo(i, 35);	
				}

			}
			
		}
		
		private function tekenController():void
		{
			controller = new Sprite();
			controller.buttonMode = true;
			controller.x = 50;
			controller.y = 25;
			this.waarde = controller.x*schaal;
			
			controller.graphics.lineStyle(3);
			controller.graphics.beginFill(0x0092BC);
			//controller.graphics.drawCircle(0, 0, 12);
			controller.graphics.drawRoundRect( -8, -16, 16, 32, 5, 5);
			addChild(controller);
			controller.addEventListener(MouseEvent.MOUSE_DOWN, sleep);
			controller.addEventListener(MouseEvent.MOUSE_UP, stopSleep);
			controller.addEventListener(MouseEvent.MOUSE_OUT, stopSleep);
			
			box.x = 320;
			box.y = 0;
			box.width = 40;
			addChild(box);
			//box.background = true;
			
			txt = new TextField();
			txt.x = 320;
			txt.y = 20;
			txt.width = 30;
			txt.height = 20;
			txt.background = true;
			txt.text = String(controller.x);
			addChild(txt);
		}

		private function sleep(e:MouseEvent):void
		{
			addEventListener(Event.ENTER_FRAME, update);
			var rechthoek:Rectangle = new Rectangle(0, 25, 300, 0);
			controller.startDrag(false,rechthoek);
		}
		
		private function stopSleep(e:MouseEvent):void
		{
			controller.stopDrag();
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			txt.text = String(Math.round(controller.x * schaal));
			this.waarde = Math.round(controller.x* schaal);
		}
		
		public function setSlider(waarde:Number):void
		{
			if (waarde*schaal > 0 && waarde*schaal <= 300)
			{
				this.waarde = waarde*schaal;
				controller.x = waarde*schaal;
				txt.text = String(Math.round(controller.x));
			}
			
		}
		
	}

}
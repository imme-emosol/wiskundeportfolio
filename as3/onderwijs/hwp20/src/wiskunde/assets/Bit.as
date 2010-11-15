package wiskunde.assets
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * Is een sprite met twee mogelijke waarden: true of false. De Bit wisselt van waarde als erop geklikt wordt.
	 * @author Jelle Sjollema
	 */
	public class Bit extends Sprite
	{
		public var toestand:Boolean = false;
		public var waarde:Number = 0;
		private var beginWaarde:Number;
		private var hoogte:Number;
		private var breedte:Number;
		private var kleurTrue:uint = 0x00ff00;
		private var kleurFalse:uint = 0xff0000
		private var label:String;
		private var box:TextField;
		private var format:TextFormat;
		
		public function Bit(x:Number, y:Number, breedte:Number = 100, hoogte:Number = 100,waarde:Number = 0, label:String = null) 
		{
			this.x = x;
			this.y = y;	
			this.hoogte = hoogte;
			this.breedte = breedte;
			this.beginWaarde = waarde;
			this.label = label;
			
			if (label != null)
			{
				labelMaken();
			}
			

			
			addEventListener(MouseEvent.CLICK, update);
		}
		
		public function tekenBit():void
		{
			trace(box.x);

			if (toestand)
			{
				clearBit();
				this.graphics.lineStyle(2);
				this.graphics.beginFill(kleurTrue);
				this.graphics.drawRect(0, 0, this.breedte, this.hoogte);
				this.graphics.endFill();
			}
			else
			{
				clearBit();
				this.graphics.lineStyle(2);
				this.graphics.beginFill(kleurFalse);
				this.graphics.drawRect(0, 0, this.breedte, this.hoogte);
				this.graphics.endFill();
			}
			
		}
		
		public function clearBit():void
		{
			this.graphics.clear();
		}
		
		public function update(e:MouseEvent):void
		{
			
			if (toestand)
			{
				toestand = false;
				waarde = 0;
			}
			else
			{
				toestand = true;
				waarde = beginWaarde;
			}
			tekenBit();
		}
		
		public function setToestand(a:Boolean):void
		{
			this.toestand = a;
			tekenBit();
		}
		
		private function labelMaken():void
		{
			format = new TextFormat();
			format.font = "Arial";
			format.size = 16;
			format.bold = true;
			format.color = 0xffffff;
			format.align = "center";
			
			box = new TextField();
			box.defaultTextFormat = format;
			box.width = this.breedte+1;
			box.height = 22;
			box.y = hoogte+2;
			box.background = true;
			box.backgroundColor = 0x000000;
			box.text = label;
			this.addChild(box);
			trace(box.y);
		}
		
		
		
	}

}
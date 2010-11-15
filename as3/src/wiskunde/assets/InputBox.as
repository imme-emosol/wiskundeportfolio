package wiskunde.assets
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class InputBox extends Sprite
	{
		private var label:TextField;
		public var box:TextField;
		private var format:TextFormat;
		public var waarde:Number;
 
		public function InputBox(x:Number, y:Number, labelText:String, waarde:Number = 0) 
		{
			this.x = x;
			this.y = y;
			this.waarde = waarde;
 
			format = new TextFormat();
			format.color = 0xffffff;
			format.align = "center";
			format.font = "Arial";
			format.bold = true;
 
 
 
			label = new TextField();
			label.defaultTextFormat = format;
			label.width = 140;
			label.height = 20;
			label.text = labelText;
			label.background = true;
			label.backgroundColor = 0x0092BC ;
			label.border = true;
			label.selectable = false;
			addChild(label)
 
			format.color = 0x000000;
			format.size = 36;
			box = new TextField();
			box.defaultTextFormat = format;
			box.y = 20;
			box.width = 140;
			box.height = 40;
			box.type = TextFieldType.INPUT;
			box.border = true;
			box.background = true;
			box.backgroundColor = 0xeeeeff;
			box.text = String(waarde);
			addChild(box);
 
			box.addEventListener(Event.CHANGE, update);
			box.addEventListener(MouseEvent.CLICK, select);
		}
 
		public function update(e:Event):void
		{
			this.waarde = Number(box.text);
		}
 
		public function set setWaarde(a:Number):void
		{
			this.waarde = a;
			box.text = String(a);
		}
 
		public function select(e:MouseEvent):void
		{
 
			box.setSelection(0, 100);
		}
 
	}
 
}

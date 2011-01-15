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
	public class OutputBox extends Sprite
	{
		private var label:TextField;
		public var box:TextField;
		private var format:TextFormat;
		public var waarde:Number;
 
		public function OutputBox(x:Number, y:Number, labelText:String) 
		{
			this.x = x;
			this.y = y;
 
			format = new TextFormat();
			format.color = 0xFFFFFF;
			format.align = "center";
			format.font = "Arial";
			format.bold = true;
 
			label = new TextField();
			label.defaultTextFormat = format;
			label.width = 140;
			label.height = 20;
			label.text = labelText;
			label.background = true;
			label.backgroundColor = 0x0092BC;
			label.border = true;
			label.selectable = false;
			addChild(label)
 
			format.color = 0xFFFFFF;
			format.size = 36;
			box = new TextField();
			box.defaultTextFormat = format;
			box.y = 20;
			box.width = 140;
			box.height = 40;
			box.selectable = false;
			box.border = true;
			box.background = true;
			box.backgroundColor = 0x0092BC ;
			addChild(box);
		}
 
		public function update(waarde:Number):void
		{
			this.waarde = waarde;
			box.text = String(waarde);
 
		}
 
	}
 
}

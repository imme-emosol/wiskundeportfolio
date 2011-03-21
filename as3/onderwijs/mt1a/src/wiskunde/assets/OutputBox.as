package wiskunde.assets 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class OutputBox extends Sprite
	{
		public var label:TextField;
		public var labelText:String;
		public var box:TextField;
		public var boxText:String;
		public var waarde:Number;
		private var format:TextFormat;
		
		public function OutputBox(labelText:String) 
		{
			format = new TextFormat();
			format.size = 22;
			format.align = "center";
			
			
			
			this.labelText = labelText;
			label = new TextField();
			
			format.color = 0xeeeeee;
			label.defaultTextFormat = format;
			
			box = new TextField();
			label.border = true;
			box.border = true;
			box.y = 30;
			box.width = 140;
			box.height = 30;
			box.background = true;
			box.backgroundColor = 0xeeeeee;
			label.width = 140;
			label.height = 30;
			label.background = true;
			label.backgroundColor = 0X171799;
			label.selectable = false;

			
			label.text = labelText;
			
			format.size = 18;
			format.color = 0x0000ff;
			box.defaultTextFormat = format;
			box.text = "-";
			
			addChild(label);
			addChild(box);
			
		}
		
		public function set setNumber(a:Number):void
		{
			box.text = String(a);
		}
		
	}

}
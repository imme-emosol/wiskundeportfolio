package wiskunde.assets 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class InputBox extends Sprite
	{
		public var label:TextField;
		public var labelText:String;
		public var box:TextField;
		public var boxText:String;
		public var waarde:Number;
		private var format:TextFormat;
		
		public function inputBox(labelText:String) 
		{
			format = new TextFormat();
			format.size = 26;
			format.align = "center";
			
			
			
			this.labelText = labelText;
			label = new TextField();
			
			label.defaultTextFormat = format;
			
			box = new TextField();
			label.border = true;
			box.border = true;
			box.y = 50;
			box.width = 140;
			box.height 80;
			box.type = TextFieldType.INPUT
			
			label.width = 140;
			label.height = 50;
			label.background = true;
			label.backgroundColor = 0xcccccc;
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
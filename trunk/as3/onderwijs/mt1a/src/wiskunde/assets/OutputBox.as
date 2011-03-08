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
			label.width = 140;
			label.height = 50;
			
			label.text = labelText;
			//box.text = boxText;
			
			addChild(label);
			addChild(box);
			
		}
		
	}

}
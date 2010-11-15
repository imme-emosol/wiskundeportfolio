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
		public var box:TextField;
		public var tekst:String;
		public var formaat:TextFormat;
		
		public function OutputBox(x:Number, y:Number,inTekst:String) 
		{
			formaat = new TextFormat();
			formaat.size = 30;
			
			this.x = x;
			this.y = y;
			this.tekst = inTekst;			
			box = new TextField();
			box.defaultTextFormat = formaat;
			box.width = 140;
			box.text = tekst;
			addChild(box);
			
			
		}
		
	}

}
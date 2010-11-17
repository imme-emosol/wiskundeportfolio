package wiskunde.objecten 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Afbeelding extends Sprite
	{
		public var url:String;
		public var hoogte:Number;
		public var breedte:Number;
		
		public const AFBEELDING_GELADEN:String = "afbeelding_geladen";
		private var lader:Loader;
		
		
		public function Afbeelding() 
		{
			lader = new Loader();
			url = "http://wiki.wiskundeportfolio.nl/logo/wisportfolio_logo.png";
			
			lader.load(new URLRequest(url));
			addChild(lader);

			
		}
		
	}

}
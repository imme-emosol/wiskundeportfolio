package wiskunde.assets 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Afbeelding extends Sprite
	{
		public var lader:Loader;
		public var url:String;
		public var hoogte:Number;
		public var breedte:Number;
		
		public static const PLAATJE_GELADEN:String = "plaatje_geladen";
		private var req:URLRequest;
		
		
		public function Afbeelding(url:String) 
		{
			this.url = url;
			lader = new Loader();
			req = new URLRequest(url);
			lader.load(req);
			lader.contentLoaderInfo.addEventListener(Event.COMPLETE, compleet);

		}
		
		private function compleet(e:Event):void
		{
			hoogte = lader.height;
			breedte = lader.width;
			addChild(lader);
			this.dispatchEvent(new Event(Afbeelding.PLAATJE_GELADEN, true));
		}
		
	}

}
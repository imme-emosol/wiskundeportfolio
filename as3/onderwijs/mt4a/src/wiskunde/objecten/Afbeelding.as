package wiskunde.objecten 
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
		public var url:String;
		public var hoogte:Number;
		public var breedte:Number;
		
		public static const AFBEELDING_GELADEN:String = "afbeelding_geladen";
		private var lader:Loader;
		
		
		public function Afbeelding(url:String) 
		{
			
			lader = new Loader();
			this.url = url;
			
			lader.load(new URLRequest(url));
			
			lader.contentLoaderInfo.addEventListener(Event.COMPLETE, update)
			
		}
		
		private function update(e:Event):void
		{
			addChild(lader);
			hoogte = lader.height;
			breedte = lader.width;
			this.dispatchEvent(new Event(AFBEELDING_GELADEN, true));
		}
		
	}

}
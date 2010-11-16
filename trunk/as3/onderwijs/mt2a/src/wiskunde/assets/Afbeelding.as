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
		private var req:URLRequest;
		
		
		public function Afbeelding(url:String) 
		{
			this.url = url;
			lader = new Loader();
			
			//url = "http://www.signtotaal.nl/Webpagina%27s%20Standhouders/Opleidingen/Mediacollege_Amsterdam/Mediacollege_Amsterdam_logo.jpg";
			req = new URLRequest(url);
			
			lader.load(req);
			lader.contentLoaderInfo.addEventListener(Event.COMPLETE, compleet);
			
			
			
			
		}
		
		private function compleet(e:Event):void
		{
			addChild(lader);
			trace('de breedte is ' + lader.width);
			trace('de hoogte is ' + lader.height);
		}
		
	}

}
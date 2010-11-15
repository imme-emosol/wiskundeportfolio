package wiskunde.assets
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.Formaat
	import wiskunde.operaties.BreukOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Afbeelding extends Sprite
	{
		public var formaat:Formaat;
		public var breedte:Number;
		public var hoogte:Number;
		public var AR:Breuk;
		public var roosterAfbeelding:Boolean
		
		private var lader:Loader;
		private var urlVerzoek:URLRequest;
		public static const AFBEELDING_GELADEN:String = "afbeelding_geladen";
		
		public function Afbeelding(roosterAfbeelding:Boolean = false) 
		{
			
			this.roosterAfbeelding = roosterAfbeelding
		}
		
		public function importeerAfbeelding(url:String):void
		{
			lader = new Loader();
			urlVerzoek = new URLRequest(url);
			lader.load(urlVerzoek);
			lader.contentLoaderInfo.addEventListener(Event.COMPLETE, update);
		}
		
		private function update(e:Event):void
		{
			this.hoogte = lader.height;
			this.breedte = lader.width;
			if (roosterAfbeelding)
			{
				lader.y = lader.height;
				lader.scaleY = -1;
			}
			
			this.addChild(lader);
			
			this.formaat = new Formaat(breedte, hoogte);
			AR = new Breuk(e.target.width, e.target.height);
			AR = BreukOperaties.vereenvoudigen(AR);
			dispatchEvent(new Event(AFBEELDING_GELADEN, true));
		}
		
	}

}
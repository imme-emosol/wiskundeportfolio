package toepassingen.verhoudingen 
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import wiskunde.assets.OutputBox;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class AfbeeldingImporteren extends Sprite
	{
		public var lader:Loader;
		public var url:String;
		public var hoogteBox:OutputBox;
		public var breedteBox:OutputBox;
		
		public function AfbeeldingImporteren() 
		{
			lader = new Loader();
			url = "http://wiki.wiskundeportfolio.nl/images/b/bb/Dobbelstenen.jpg";
		
			var aanvraag:URLRequest = new URLRequest(url);
			lader.load(aanvraag);
			addChild(lader);
			
			hoogteBox = new OutputBox(0, 540, "hoogte");
			breedteBox = new OutputBox(140, 540, "breedte");
			addChild(hoogteBox);
			addChild(breedteBox);
			
			
			lader.contentLoaderInfo.addEventListener(Event.COMPLETE, geefInfo);
		}
		
		private function geefInfo(e:Event):void
		{
			trace(lader.width, lader.height);
			hoogteBox.box.text = String(lader.height);
			breedteBox.box.text = String(lader.width);
		}
		
	}

}
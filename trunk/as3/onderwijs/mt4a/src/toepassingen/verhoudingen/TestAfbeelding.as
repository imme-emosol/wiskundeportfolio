package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.objecten.Afbeelding;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestAfbeelding extends Sprite
	{
		public var afb:Afbeelding;
		
		public function TestAfbeelding() 
		{
			afb = new Afbeelding("http://wiki.wiskundeportfolio.nl/logo/wisportfolio_logo.png");
			afb.addEventListener(Afbeelding.AFBEELDING_GELADEN, update);
			
			
		}
		
		private function update(e:Event):void
		{
			addChild(afb)
			trace(afb.hoogte);
			trace(afb.breedte);
		}
		
	}

}
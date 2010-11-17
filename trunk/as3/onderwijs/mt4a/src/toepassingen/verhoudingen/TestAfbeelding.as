package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.objecten.Afbeelding;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.VerhoudingOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestAfbeelding extends Sprite
	{
		public var afb:Afbeelding;
		public var verh:Verhouding;
		
		public function TestAfbeelding() 
		{
			afb = new Afbeelding("http://www.girlscene.nl/images/library/2e/29/fa/b9/10_b418d71d761506bc4f2cbe80ea3c3f3912f0ff42.jpg");
			afb.addEventListener(Afbeelding.AFBEELDING_GELADEN, update);
			
			
		}
		
		private function update(e:Event):void
		{
			addChild(afb)
			
			verh = new Verhouding (afb.hoogte, afb.breedte);
			trace(verh.deeltal);
			trace(verh.deler);
			trace(verh.quotient);
			
			trace(VerhoudingOperaties.schaalDeeltal(verh, 400));
			afb.height = VerhoudingOperaties.schaalDeeltal(verh, 400);
			afb.width= 400;
			
		}
		
	}

}
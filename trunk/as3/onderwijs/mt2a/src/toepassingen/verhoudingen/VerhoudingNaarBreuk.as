package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Afbeelding;
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.BreukOperaties;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class VerhoudingNaarBreuk extends Sprite
	{
		public var v:Verhouding;
		public var b:Breuk;
		
		public var afb:Afbeelding;
		
		public function VerhoudingNaarBreuk() 
		{
			afb = new Afbeelding("http://images.fanpop.com/images/image_uploads/wallpaper--weed-babes-marijuana-235754_1024_768.jpg");
			afb.addEventListener(Afbeelding.PLAATJE_GELADEN, update);
			
		}
		
		private function update(e:Event):void
		{
			
			v = new Verhouding(afb.breedte, afb.hoogte);
			var deeltal: Breuk = GetalOperaties.getalAdBreuk(v.deeltal);
			var deler:Breuk = GetalOperaties.getalAdBreuk(v.deler);
			var deling:Breuk = BreukOperaties.delen(deeltal, deler);
			b = BreukOperaties.vereenvoudig(deling);
			trace(b.teller, b.noemer);
			addChild(afb);
			
		}
		
	}

}
package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
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
		
		public function VerhoudingNaarBreuk() 
		{
			v = new Verhouding(0.8, 0.6);
			var deeltal: Breuk = GetalOperaties.getalAdBreuk(v.deeltal);
			var deler:Breuk = GetalOperaties.getalAdBreuk(v.deler);
			var deling:Breuk = BreukOperaties.delen(deeltal, deler);
			b = BreukOperaties.vereenvoudig(deling);
			trace(b.teller, b.noemer);
			
		}
		
	}

}
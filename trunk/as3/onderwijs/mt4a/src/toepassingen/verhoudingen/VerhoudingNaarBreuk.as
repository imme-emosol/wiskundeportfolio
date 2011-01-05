package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.BreukOperaties;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.VerhoudingOperaties;
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
			v = new Verhouding(3.2, 1.6);
			
			var teller:Breuk = GetalOperaties.getalNaarBreuk(v.deeltal);
			var noemer:Breuk = GetalOperaties.getalNaarBreuk(v.deler);
			
			b = BreukOperaties.delen(teller, noemer);
			
			trace(b.teller, b.noemer);
			
			
			
		}
		
	}

}
package toepassingen.lijnen 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Lijn;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.LijnOperatie;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class FunctieVoorschrift extends Sprite
	{
		public var l:Lijn;
		public var P:Punt;
		public var Q:Punt;
		
		public function FunctieVoorschrift() 
		{
			P = new Punt(100, -100);
			Q = new Punt( -20, 160);
			l = LijnOperatie.lijnDoorTweePunten(P, Q);
			trace(l.a + ' ' + l.b + ' ' + l.c);
			
			
		}
		
	}

}
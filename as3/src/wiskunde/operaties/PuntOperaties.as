package wiskunde.operaties 
{
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class PuntOperaties
	{
		
		static public function afstand(P:Punt, Q:Punt):Number
		{
			var antwoord:Number;
			var dx:Number = Q.x - P.x;		
			var dy:Number = Q.y - P.y;
			
			antwoord = GetalOperaties.wortel(GetalOperaties.kwadraat(dx) + GetalOperaties.kwadraat(dy));
			
			return antwoord;
		}
		
	}

}
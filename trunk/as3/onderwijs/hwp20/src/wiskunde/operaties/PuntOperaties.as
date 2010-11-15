package wiskunde.operaties 
{
	import wiskunde.objecten.Hoek;
	import wiskunde.objecten.Punt;
	/**
	 * Operaties met Punten
	 * @author Jelle Sjollema
	 */
	public class PuntOperaties
	{
		
		/**
		 * Getal dat de afstand tussen de punten P en Q weergeeft
		 * @param	P
		 * @param	Q
		 * @return
		 */
		public static function afstand(P:Punt, Q:Punt):Number
		{
			var antwoord:Number = GetalOperaties.pythagoras(P.x - Q.x, P.y - Q.y);
			return antwoord;
		}
		
		public static function dx(P:Punt, Q:Punt):Number
		{
			return P.x - Q.x;
		}

		public static function dy(P:Punt, Q:Punt):Number
		{
			return P.y - Q.y;
		}
		
		public static function ds(P:Punt, Q:Punt):Number
		{
			var antwoord:Number = GetalOperaties.pythagoras(P.x - Q.x, P.y - Q.y);
			return antwoord;
		}		
		
		public static function hoek(P:Punt, Q:Punt):Hoek
		{
			var hoek:Number = Math.atan2(dy(P, Q), dx(P, Q));
			var antwoord:Hoek = new Hoek(hoek, "r");
			return antwoord;
		}
		
	}

}
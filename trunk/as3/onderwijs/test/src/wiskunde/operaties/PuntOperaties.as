package wiskunde.operaties 
{
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class PuntOperaties
	{
		
		public static function dx(P:Punt, Q:Punt):Number
		{
			var antwoord:Number;
			antwoord = P.x - Q.x;
			return antwoord;
		}
		
		public static function dy(P:Punt, Q:Punt):Number
		{
			var antwoord:Number;
			antwoord = P.y - Q.y;
			return antwoord;
		}
		public static function afstand(P:Punt, Q:Punt):Number
		{
			var antwoord:Number;
			antwoord = GetalOperaties.pythagoras(dx(P, Q), dy(P,Q));
			return antwoord;
		}
		
	}

}
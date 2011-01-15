package wiskunde.operaties 
{
	import wiskunde.objecten.Verhouding;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class VerhoudingOperaties
	{
		
		public static function schaalDeeltal(a:Verhouding, deler:Number):Number
		{
			var antwoord:Number;
			antwoord = deler * a.deeltal / a.deler;
			return antwoord;
		}
		
		public static function schaalDeler(a:Verhouding, deeltal:Number):Number
		{
			var antwoord:Number;
			antwoord = deeltal * a.deler / a.deeltal;
			return antwoord;
		}
		
	}

}
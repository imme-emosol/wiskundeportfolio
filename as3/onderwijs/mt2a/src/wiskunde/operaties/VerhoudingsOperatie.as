package wiskunde.operaties 
{
	import wiskunde.objecten.Verhouding;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class VerhoudingsOperatie
	{
		public static function optellen(a:Verhouding, b:Verhouding):Verhouding
		{
			var antwoord:Verhouding;
			
			var deeltal:Number = a.deeltal * b.deler + b.deeltal * a.deler;
			var deler:Number = a.deler * b.deler;
			antwoord = new Verhouding(deeltal, deler);
			
			return antwoord;
		}
		
		public static function schaalDeeltal(a:Verhouding, deler:Number):Verhouding
		{
			var deeltal:Number = a.deeltal / a.deler * deler;
			var antwoord:Verhouding = new Verhouding(deeltal, deler);
			return antwoord;
		}
		
		public static function schaalDeler(a:Verhouding, deeltal:Number):Verhouding
		{
			var deler:Number = a.deler / a.deeltal * deeltal;
			var antwoord:Verhouding = new Verhouding(deeltal, deler);
			return antwoord;
		}
		
		public static function inverse(a:Verhouding):Verhouding
		{
			var antwoord:Verhouding = new Verhouding(a.deler, a.deeltal);
			return antwoord;
		}
		
	}

}
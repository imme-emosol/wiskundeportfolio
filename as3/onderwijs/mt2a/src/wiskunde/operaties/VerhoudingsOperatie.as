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
		
	}

}
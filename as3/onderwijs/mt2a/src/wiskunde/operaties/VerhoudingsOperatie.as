package wiskunde.operaties 
{
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.QGetal;
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
		public static function breukNaarQGetal(a:Breuk):QGetal
		{
			var antwoord:QGetal;
			
			var entier:String;
			var decimaal:String;
			var repetend:String;
			
			var getal:String = GetalOperaties.staartDeling(a.teller, a.noemer,2000);
			
			repetend = GetalOperaties.vindRepetend(getal);
			decimaal = GetalOperaties.vindDecimaal(getal);
			var temp:Array = decimaal.split(".");
			decimaal = temp[1];
			entier = temp[0];
			
			antwoord = new QGetal(entier, decimaal, repetend);
			return antwoord;
		}
		
	}

}
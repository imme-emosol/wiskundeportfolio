package wiskunde.operaties 
{
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.Getal;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * Operaties met Breuken
	 * @author Jelle Sjollema
	 */
	public class BreukOperaties
	{
		/**
		 * Geeft met behulp van een boolean aan of een verhouding een breuk is of niet
		 * @param	a
		 * @return
		 */
		public static function isBreuk(a:Verhouding):Boolean
		{
			var antwoord:Boolean = false;
			if (GetalOperaties.isGeheelGetal(a.deeltal) && GetalOperaties.isGeheelGetal(a.deler))
			{
				antwoord = true;
			}
			return antwoord
		}
		
		/**
		 * Beschrijft een Breuk met behulp van de kleinst mogelijke teller en deler
		 * @param	a
		 * @return
		 */
		public static function vereenvoudigen(a:Breuk):Breuk
		{
		var ggd:Number = GetalOperaties.ggd(a.teller, a.noemer);
		var antwoord:Breuk;
		antwoord = new Breuk(a.teller / ggd, a.noemer / ggd);
		return antwoord;
		}


		
		/**
		 * Telt Breuk a op bij Breuk b
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function som(a:Breuk,b:Breuk):Breuk
		{
			var antwoord:Breuk= new Breuk((a.teller* b.noemer) + (b.teller* a.noemer), a.noemer * b.noemer);
			return antwoord;
		}
		
	
		/**
		 * Trekt Breuk b af van Breuk a
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function verschil(a:Breuk,b:Breuk):Breuk
		{
			var antwoord:Breuk= new Breuk((a.teller* b.noemer) - (b.teller* a.noemer), a.noemer * b.noemer);
			return antwoord;
		}
		
		
		/**
		 * Deelt Breuk a door Breuk b
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function quotient(a:Breuk, b:Breuk):Breuk
		{
			var antwoord:Breuk = new Breuk(a.teller * b.noemer, a.noemer * b.teller);
			return antwoord;
		}
		
				/**
		 * Vermenigvuldigt Breuk a met Breuk b
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function product(a:Breuk, b:Breuk):Breuk
		{
			var antwoord:Breuk = new Breuk(a.teller * b.teller, a.noemer * b.noemer);
			return antwoord;
		}
		
		public static function inverse(a:Breuk):Breuk
		{
			var antwoord:Breuk = new Breuk(a.noemer, a.teller);
			return antwoord;
		}
		
	}

}
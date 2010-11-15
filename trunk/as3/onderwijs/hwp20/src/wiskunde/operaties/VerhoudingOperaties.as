package wiskunde.operaties 
{
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.Getal;
	import wiskunde.objecten.Verhouding;
	/**
	 * Operaties met verhoudingen
	 * @author Jelle Sjollema
	 */
	public class VerhoudingOperaties
	{

		/**
		 * Telt Verhoudingen a en b bij elkaar op
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function som(a:Verhouding,b:Verhouding):Verhouding
		{
			var antwoord:Verhouding = new Verhouding((a.deeltal * b.deler) + (b.deeltal * a.deler), a.deler * b.deler);
			return antwoord;
		}

		/**
		 * Trekt verhoudingen a en b van elkaar af
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function verschil(a:Verhouding, b:Verhouding):Verhouding
		{
			var antwoord:Verhouding = new Verhouding((a.deeltal * b.deler) - (b.deeltal * a.deler), (a.deler * b.deler));
			return antwoord;
		}
		
		/**
		 * Vermenigvuldigt de verhoudingen a en b
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function product(a:Verhouding, b:Verhouding):Verhouding
		{
			var antwoord:Verhouding = new Verhouding(a.deeltal * b.deeltal, a.deler * b.deler);
			return antwoord;
		}
		
		/**
		 * Deelt de verhouding a door verhouding b
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function quotient(a:Verhouding, b:Verhouding):Verhouding
		{
			var antwoord:Verhouding = new Verhouding(a.deeltal * b.deler, a.deler * b.deeltal);
			return antwoord;
		}

		/**
		 * verwisselt deler en deeltal
		 * @param	a
		 * @return
		 */
		public static function inverse(a:Verhouding):Verhouding
		{
			var antwoord:Verhouding = new Verhouding(a.deler,a.deeltal);
			return antwoord;
		}
		
		/**
		 * geeft verhouding b dezelfde verhouding als a door of de deler, of het deeltal aan te passen 
		 * @param	a
		 * @param	b
		 * @param	update
		 * @return
		 */
		public static function schalen(a:Verhouding,b:Verhouding, update:String = "deeltal"):Verhouding
		{
			
			if (isNaN(b.deeltal))
			{
				b.deeltal = a.deeltal * b.deler / a.deler;
				
			}
			if (isNaN(b.deler))
			{
				b.deler = a.deler * b.deeltal / a.deeltal;
			}
			
			if (!isNaN(b.deler) && !isNaN(b.deeltal))
			{
				switch (update)
				{
					case "deeltal":
					b.deeltal = a.deeltal * b.deler / a.deler;
					break;
					case "deler":
					b.deler = a.deler * b.deeltal / a.deeltal;
					break
					
				}
				
			}
			return b;
		}
		
		public static function verhoudingNaarBreuk(a:Verhouding):Breuk
		{
			var deler:Number = a.deler;
			var deeltal:Number = a.deeltal;
			
			var sDeler:String = String(deler);
			var sDeeltal:String = String(deeltal);
			
			var indexDeler:int = sDeler.indexOf(".");
			var indexDeeltal:int = sDeeltal.indexOf(".");
			
			var ordeDeler:Number;
			var ordeDeeltal:Number;

			
			if (indexDeler== -1)
			{
				ordeDeler = 1
			}
			else
			{
				ordeDeler = GetalOperaties.lengte(Number(sDeler.slice(indexDeler + 1, sDeler.length)));
				ordeDeler = Math.pow(10, ordeDeler);
			}
			
			if (indexDeeltal== -1)
			{
				ordeDeeltal = 1
			}
			else
			{
				ordeDeeltal = GetalOperaties.lengte(Number(sDeeltal.slice(indexDeeltal + 1, sDeeltal.length)));
				ordeDeeltal = Math.pow(10, ordeDeeltal);
			}
			
			var factor:Number
			
			if (ordeDeeltal >= ordeDeler)
			{
				factor = ordeDeeltal;
			}
			else
			{
				factor = ordeDeler
			}

			var antwoord:Breuk = new Breuk(a.deeltal * factor, a.deler * factor);
			antwoord = BreukOperaties.vereenvoudigen(antwoord);
			return antwoord;
		}
	}

}
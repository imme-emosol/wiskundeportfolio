package wiskunde.operaties 
{
	/**
	 * Operaties met Getallen
	 * @author Jelle Sjollema
	 */
	public class GetalOperaties
	{
		
		public static function kwadraat(a:Number):Number
		{
			var antwoord:Number;
			antwoord = a * a;
			//antwoord = Math.pow(a, 2);

			return antwoord;
		}
		
		/**
		 * De wortel uit een getal trekken... 
		 */
		public static function wortel(a:Number):Number
		{
			var antwoord:Number;
			antwoord = Math.sqrt(a);
			return antwoord;
		}
		
		public static function pythagoras(a:Number, b:Number):Number
		{
			var antwoord:Number;
			antwoord = wortel(kwadraat(a) + kwadraat(b))
			return antwoord
		}
		
		public static function afronding(a:Number, decimalen:Number):Number
		{
			var antwoord:Number;
			antwoord = Math.round(a * Math.pow(10, decimalen)) / Math.pow(10, decimalen);
			
			return antwoord;
		}

		
	}

}
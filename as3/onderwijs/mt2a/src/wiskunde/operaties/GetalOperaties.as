package wiskunde.operaties 
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class GetalOperaties
	{
		public static function afronding(a:Number, decimaal:Number):Number
		{
			var antwoord:Number;
			antwoord  = Math.round(a* Math.pow(10,decimaal))/Math.pow(10,decimaal);
			return antwoord;
		}
		
		public static function kwadraat(a:Number):Number
		{
			var antwoord:Number;
			antwoord = a * a;
			return antwoord;
		}
		
		public static function wortel(a:Number):Number
		{
			var antwoord:Number;
			antwoord = Math.sqrt(a);
			return antwoord;
		}

		
	}

}
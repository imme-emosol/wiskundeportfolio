package wiskunde.operaties 
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class LogischeOperaties
	{
		
		public static function en(a:Boolean, b:Boolean):Boolean
		{
			var antwoord:Boolean;
			antwoord = a && b;
			return antwoord;
		}
		
		public static function of(a:Boolean, b:Boolean):Boolean
		{
			var antwoord:Boolean;
			antwoord = a || b;
			return antwoord;	
		}
		
		public static function niet(a:Boolean):Boolean
		{
			var antwoord:Boolean;
			antwoord = !a;
			return antwoord;
		}
	}

}
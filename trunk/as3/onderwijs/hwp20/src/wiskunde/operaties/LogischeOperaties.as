package wiskunde.operaties 
{
	/**
	 * Operaties met booleaanse getallen
	 * @author Jelle Sjollema
	 */
	public class LogischeOperaties
	{
		/**
		 * Logische en-operatie
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function en(a:Boolean, b:Boolean):Boolean
		{
			var antwoord:Boolean = a && b;
			return antwoord;
		}
		
		/**
		 * Logische of-operatie
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function of(a:Boolean, b:Boolean):Boolean
		{
			var antwoord:Boolean = a || b;
			return antwoord;
		}

		/**
		 * Logische niet-operatie
		 * @param	a
		 * @param	b
		 * @return
		 */ 
		public static function niet(a:Boolean):Boolean
		{
			var antwoord:Boolean = !a;
			return antwoord;
		}

		
		/**
		 * Logische noch-operatie
		 * @param	a
		 * @param	b
		 * @return
		 */
		 
		public static function noch(a:Boolean, b:Boolean):Boolean
		{
			var antwoord:Boolean = niet(of(a,b));
			return antwoord;
		}
		

		/**
		 * Logische exclusieve of-operatie
		 * @param	a
		 * @param	b
		 * @return
		 */
		 
		public static function exclusieveOf(a:Boolean, b:Boolean):Boolean
		{
			var antwoord:Boolean = of(en(a,niet(b)),en(niet(a),b));
			return antwoord;
		}
		
	}

}
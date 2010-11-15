package wiskunde.objecten
{
	import wiskunde.operaties.GetalOperaties;
	/**
	 * Geeft een getal weer als en verhouding van twee gehele getallen.
	 * @author Jelle Sjollema
	 */
	public class Breuk
	{

		/**
		 * De Grootste Gemene Deler van Teller en Noemer
		 */
		public var ggd:Number;
		/**
		 * Het gehele getal boven de deelstreep of vinculum
		 */
		public var teller:Number;
		/**
		 * Het gehele getal onder de deelstreep of vinculum
		 */
		public var noemer:Number
		
		/**
		 * Het getal dat de breuk representeert
		 * @param	teller
		 * @param	noemer
		 */
		public var waarde:Number
		
		
		public function Breuk(teller:Number,noemer:Number)
		{
			this.teller = teller;
			this.noemer = noemer;
			ggd = GetalOperaties.ggd(teller, noemer);
			this.waarde = teller/noemer
		}
		
	}

}
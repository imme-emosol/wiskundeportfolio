package wiskunde.objecten
{
	/**
	 * Een Verhouding geeft een getal weer als de verhouding van een deeltal en deler.
	 * @author Jelle Sjollema
	 */
	public class Verhouding

	{
		/**Het getal waardoor gedeeld wordt en onder de deelstreep staat*/
		public var deler:Number;
		
		/** het getal dat gedeeld wordt en boven de deelstreep staat*/
		public var deeltal:Number;
		
		public var waarde:Number;
		
		public function Verhouding(deeltal:Number, deler:Number) 
		{
			this.deeltal = deeltal;
			this.deler = deler;
			this.waarde = deeltal / deler;
		}
				
	}

}
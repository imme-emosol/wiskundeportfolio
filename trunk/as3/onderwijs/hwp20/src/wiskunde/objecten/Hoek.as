package wiskunde.objecten
{
	/**
	 * Geeft de verhouding weer tussen een deel van een cirkel en een gehele cirkel.<BR>
	 * @author Jelle Sjollema
	 */
	public class Hoek
	{
		/** de hoek in graden
		 * */
		
		public var graden:Number;
		
		/** de hoek in radialen*/
		public var rad:Number;
		
		/**
		 * 
		 * @param	h: hoek
		 * @param	soort: keuze voor "g" in graden of "r" in radialen
		 * @default "g"
		 */
		public function Hoek(h:Number, soort:String = "g")
		
		{
			if (soort == "r")
			{
				this.rad = h;
				this.graden = h*180/Math.PI
			}
			else
			{
				this.graden = h;
				this.rad = h*Math.PI/180
			}	
		}

	}

}
package wiskunde.objecten 
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Verhouding
	{
		public var deler:Number;
		public var deeltal:Number;
		public var quotient:Number;
		
		public function Verhouding(deeltal:Number, deler:Number) 
		{
			this.deeltal = deeltal;
			this.deler = deler;
			this.quotient = deeltal / deler;
			
		}
		
	}

}
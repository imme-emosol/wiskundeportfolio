package wiskunde.objecten
{
	/**
	 * Geeft de afmetingen van een afbeelding
	 * @author Jelle Sjollema
	 */
	public class Formaat
	{
		public var breedte:Number;
		public var hoogte:Number;
		public var oppervlakte:Number;
		public var omtrek:Number;
		
		public function Formaat(breedte:Number = NaN, hoogte:Number=NaN) 
		{
			this.breedte = breedte;
			this.hoogte = hoogte;
			this.oppervlakte = breedte * hoogte;
			this.omtrek = 2 * breedte + 2 * hoogte;
		}
		
		public function setFormaat(breedte:Number, hoogte:Number):void 
		{
			this.breedte = breedte;
			this.hoogte = hoogte;
			this.oppervlakte = breedte * hoogte;
			this.omtrek = 2 * breedte + 2 * hoogte;
		}
		
		public function geefFormaat():String
		{
			return String(this.breedte + " x " + this.hoogte);
		}
	}

}
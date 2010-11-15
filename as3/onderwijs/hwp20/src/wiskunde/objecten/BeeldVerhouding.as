package wiskunde.objecten
{
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.Verhouding;
	/**
	 * Geeft de verhouding tussen breedte en hoogte van een afbeelding in een verhouding
	 * @author Jelle Sjollema
	 */
	public class BeeldVerhouding extends Breuk
	{
		public var breedte:Number;
		public var hoogte:Number;
		
		public function BeeldVerhouding(breedte:Number=NaN, hoogte:Number=NaN) 
		{
			super(breedte, hoogte);
			this.breedte = breedte;
			this.hoogte = hoogte;
		}
		
		public function setBeeldVerhouding(breedte:Number, hoogte:Number):void
		{
			this.breedte = breedte;
			this.hoogte = hoogte;
		}
		
	}

}
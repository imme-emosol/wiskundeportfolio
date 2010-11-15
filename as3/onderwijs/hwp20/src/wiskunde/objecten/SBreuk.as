package wiskunde.objecten 
{
	import wiskunde.operaties.GetalOperaties;
	/**
	 * Geeft een getal weer als de som van een geheel Getal en een Breuk.
	 * @author Jelle Sjollema
	 */
	public class SBreuk
	{
		/**
		 * Het getal voor de breuk
		 */
		public var entier:Number
		
		/**
		 * De decimaal van een getal geschreven als breuk
		 */
		public var breuk:Breuk;
		public var waarde:Number
		
		public function SBreuk(entier:Number, breuk:Breuk) 
		{
			this.entier = entier
			this.breuk = breuk;
			
			this.waarde = (entier*breuk.noemer+breuk.teller) / breuk.noemer
		}
		
	}

}
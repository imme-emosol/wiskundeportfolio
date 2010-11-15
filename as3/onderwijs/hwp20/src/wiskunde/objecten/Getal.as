package wiskunde.objecten
{
	import flash.display.Sprite;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * Bestaat uit een entier, decimaal en repetend
	 * * @author Jelle Sjollema
	 */
	public class Getal
	{
		/** de waarde van het getal waar praktisch mee gewerkt kan worden */
		public var waarde:Number;
		
		/**Het imaginaire deel van het getal */
		public var img:Number;
		
		/** De waarde van het cijfer voor de decimale punt */
		public var entier:Number;
		
		/**
		 * de waarde van het cijfer achter de decimale punt
		 */
		public var decimaal:Number;
		
		/**
		 * het cijfer of cijferreeks dat herhaald wordt
		 */
		public var repetend:Number;
		
		
		/** Bijvoorbeeld het getal 12.234444... wordt ingevoerd als
		 * waarde: 12.23 repetent:4
		 * Default is de repetent gelijk aan 0
		 */
		public function Getal(entier:Number=0, decimaal:Number=0, repetend:Number =0) 
		{
			
			this.entier = entier;
			this.decimaal = decimaal;
			this.repetend = repetend;
		}
		
		/**
		 * als er geen . in het getal staat, is de decimaal NaN
		 * als er een . in het getal staat, is de rest de decimaal
		 * @param	a
		 */
		public function setGetal(a:Number):void 
		{
			this.repetend = 0;
			
			//maak van het getal een string
			var cijfer:String = String(a);
			
			//splits de string op de plaats van de "."
			var index:int = cijfer.indexOf(".");

			var sEntier :String = cijfer.slice(0, index);
			this.entier = Number(sEntier);
			
			if (index == -1)
			{
				decimaal = NaN;
			}
			else
			{
				this.decimaal = Number(cijfer.slice(index + 1, cijfer.length));
			}

		}
		
		
	}

}
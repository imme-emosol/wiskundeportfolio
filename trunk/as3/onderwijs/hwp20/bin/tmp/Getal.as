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
		public function Getal(a:Number, repetend:Number =0) 
		{
			//Bepaal entier en Decimaal
			determineerGetal(a);
			
			//als er een repetend is opgegeven, voeg die toe
			this.repetend = repetend;
			
			//bepaal de waarde van het getal
			if (!isNaN(this.repetend))
			{
			
				//vul het getal tot 10 decimalen achter de komma 
				//met de repetend
				var sWaarde:String = String(waarde);
				{
					for (var i:uint = 0; sWaarde.length < 10; i++)
					{
						sWaarde += String(repetend);
					}
				}
				this.waarde = Number(sWaarde);
			}
			else
			{
				//als er geen repetend is ingevoerd
				//is de waarde van het getal
				//gelijk aan het ingevoerde getal
				this.waarde = waarde;
			}
		}
		
		private function determineerGetal(a:Number):void 
		{
			// maak van het ingevoerde getal een string
			//trace(a);
			var cijfer:String = String(a);
			trace(cijfer, 'cijfer');
			
			//splits de string op de plaats van de "."
			var index:int = cijfer.indexOf(".");
			trace(index, 'index');

			
			//eerste getal is de entier
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
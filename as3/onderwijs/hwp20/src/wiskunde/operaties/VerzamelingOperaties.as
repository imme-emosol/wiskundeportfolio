package wiskunde.operaties 
{
	import wiskunde.objecten.verzamelingen.PriemGetallen;
	/**
	 * Operaties met verzamelingen
	 * @author Jelle Sjollema
	 */
	public class VerzamelingOperaties
	{
		/**
		 * Geeft het aantal elementen in een verzameling
		 * @param	V
		 * @return
		 */
		public static function cardinaliteit(V:Array):Number
		{
			var antwoord:Number = V.length;
			return antwoord;
		}
		
				/**
		 * Geeft een array met alle delers van Natuurlijk getal a
		 * @param	a
		 * @return
		 */
		static public function delers(a:Number):Array
		{
			var arr:Array = new Array();
			
			if (GetalOperaties.isNatuurlijkGetal(a))
			{
				for (var i:int = 0; i < (a / 2) + 1; i++)
				{
					if (a % i == 0)
					{
						arr.push(i)
					}
				}	
			}
			else
			{
				arr.push(NaN);
			}
			
			return arr
		}
		
		static public function priemDelers(a:Number):Array
		{
			var antwoord:Array = new Array();
			var p:PriemGetallen = new PriemGetallen(a/2);
			var temp:Number = new Number(a);
			var factor:Number;
			
			for (var i:int = 0; i < p.priemgetallen.length; i++)
			{
				var priemgetal:Number = p.priemgetallen[i];
				while (GetalOperaties.isDeler(temp, priemgetal))
				{
					antwoord.push(priemgetal);
					temp = temp / priemgetal;
				}
			}
			return antwoord;
			
		}
		
	}

}
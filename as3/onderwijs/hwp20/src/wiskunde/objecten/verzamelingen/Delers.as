package wiskunde.objecten.verzamelingen 
{
	import wiskunde.operaties.GetalOperaties;
	/**
	 * Een verzameling getallen die deller zijn van natuurlijk getal n.
	 * @author Jelle Sjollema
	 */
	public class Delers
	{
		/**
		 * natuurlijk getal
		 */
		public var n:uint;
		
		/**
		 * verzameling delers van n
		 */
		public var delers:Array;
		
		/**
		 * 
		 * @param	n Natuurlijk Getal
		 */
		public function Delers(n:Number ) 
		{
			delers = new Array();
			this.n = uint(n);

			if (GetalOperaties.isNatuurlijkGetal(n))
			{	
				for (var i:int = 0; i <= n ; i++)
				{
					if (n % i == 0)
					{
						delers.push(i)
					}
				}	
			}
		}
		
	}

}
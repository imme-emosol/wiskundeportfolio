package wiskunde.objecten.verzamelingen
{
	//import wiskunde.operaties.GetalOperaties;
	/**
	 * Een verzameling getallen kleiner dan max die enkel deelbaar door 1 en zichzelf zijn
	 * @author Jelle Sjollema
	 */
	public class PriemGetallen
	{
		/**
		 * bovengrens van de verzameling
		 * @default =100
		 */
		public var max:int;
		
		/**
		 * verzameling priemgetallen
		 */
		public var priemgetallen:Array;
		/**
		 * 
		 * @param	max: maximale getal
		 */
		public function PriemGetallen(max:int= 100) 
		{
			this.max = max
			priemgetallen = new Array();
			
			for (var i:Number = 2; i <= max; i++)
			{
				var d:Delers = new Delers(i);
				
				if (d.delers.length == 2)
				{
					priemgetallen.push(i);
				}
			}
			
		}
		
	}

}
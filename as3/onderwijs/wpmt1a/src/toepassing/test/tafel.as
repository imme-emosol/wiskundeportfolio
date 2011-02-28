package toepassing.test 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Getal;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class tafel extends Sprite
	{
		public var getal:Getal = new Getal(15);
		
		public function tafel() 
		{
			for (var i:int = 0; i < 11; i++)
			{
				getal.waarde = 15;
				trace(i, getal.waarde, i * getal.waarde,'h');
			}
			
		}
		
	}

}
package toepassingen.hoeken 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Hoek;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class HoekTest extends Sprite
	{
		public var hoek:Hoek;
		
		public function HoekTest() 
		{
			hoek = new Hoek(1,false);
			trace(hoek.graden, hoek.radialen, hoek.omwentelingen);
			
			hoek.graden = 1000;
			trace(hoek.graden, hoek.radialen, hoek.omwentelingen);
			
			
		}
		
	}

}
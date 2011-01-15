package toepassingen.hoeken 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Hoek;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class testHoek extends Sprite
	{
		
		public function testHoek() 
		{
			var h:Hoek = new Hoek(90);
			trace(h.rad);
			
			var i:Hoek = new Hoek(1.5707963267948966, "r");
			trace(i.graden);
			
			
		}
		
	}

}
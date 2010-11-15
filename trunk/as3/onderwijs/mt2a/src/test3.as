package  
{
	import flash.display.Sprite;
	import wiskunde.objecten.Lijn;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class test3 extends Sprite
	{
		
		public function test3() 
		{
			var l:Lijn = new Lijn(5, 3, 1500);
			trace("-480," +l.berekenY( -480));
			trace(l.berekenY(480));
			
			trace(l.berekenX(300));
			trace(l.berekenX( -300));
			
		}
		
	}

}

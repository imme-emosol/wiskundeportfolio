package  
{
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import org.wiskunde.objecten.Lijn;
	import org.wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Temp extends Sprite
	{
		
		public function Temp() 
		{
			var l:Lijn = new Lijn(-4, 7, -28);
			
			var Q:Punt = l.berekenX(0);
			var R:Punt = l.berekenX(8);
			var S:Punt = l.berekenY(0);
			var T:Punt = l.berekenY(8);
			
			trace(Q.x, Q.y);
			trace(R.x, R.y);
			trace(S.x, S.y);
			trace(T.x, T.y);
			
		}
		
	}

}
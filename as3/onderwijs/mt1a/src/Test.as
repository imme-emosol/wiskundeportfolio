package  
{
	import flash.display.Sprite;
	import wiskunde.objecten.Getal;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Test extends Sprite
	{
		
		public function Test() 
		{
			var a:Getal = new Getal(8);
			trace(a.waarde);
			
			a.optellen(2);
			trace(a.waarde);
			
			
		}
		
	}

}
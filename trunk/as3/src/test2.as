package  
{
	import flash.display.Sprite;
	import wiskunde.operaties.LogischeOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class test2 extends Sprite
	{
		
		public function test2() 
		{
			var a:Boolean = true;
			var b:Boolean = false;
			
			trace(LogischeOperaties.en(a, b));
			trace(LogischeOperaties.of(a, b));
			trace(LogischeOperaties.niet(a));
		}
		
	}

}
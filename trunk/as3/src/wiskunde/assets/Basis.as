package wiskunde.assets 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Basis extends Sprite
	{
		public var rooster:Rooster;
		
		public function Basis() 
		{
			rooster = new Rooster(20, 480, 20, 300);
			addChild(rooster);
			
		}
		
	}

}
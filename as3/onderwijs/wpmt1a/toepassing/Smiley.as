package toepassing 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Smiley extends Sprite
	{
		public var gezicht:Punt;
		public var linkerOog:Punt;
		
		
		public function Smiley() 
		{
			gezicht = new Punt(480, 300);
			gezicht.tekenPunt(300,0xffff00);
			addChild(gezicht);
			
			
		}
		
	}

}
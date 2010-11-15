package wiskunde.assets
{
	import wiskunde.assets.Rooster;
	import flash.display.Sprite;
	
	/**
	 * Tekent een wiskunderooster
	 * @author Jelle Sjollema
	 */
	public class Basis extends Sprite
	{
		public var rooster:Rooster;
		
		public function Basis() 
		{
			setRooster(480,300,0.4,20,20);		
		}
		
		public function setRooster(offsetX:Number,offsetY:Number,alpha:Number, Dx:Number, Dy:Number):void
		{
			if (rooster)
			{
				removeChild(rooster);
			}
			rooster = new Rooster(offsetX,offsetY,alpha,Dy,Dx);
			addChild(rooster);
		}

	}
}
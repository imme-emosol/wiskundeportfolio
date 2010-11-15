package wiskunde.assets
{
	import flash.display.Sprite;
	
	/**
	 * Tekent een wiskunderooster
	 * @author Jelle Sjollema
	 */
	public class Rooster extends Sprite
	{
		
		public function Rooster() 
		{
			for (var i:int = 0; i <= 30; i++)
			{
				if (i % 5 == 0)
				{
					graphics.lineStyle(3, 0xAAAAAA);
				}
				else
				{
					graphics.lineStyle(1, 0x999999);
				}
				graphics.moveTo(0, i*20);
				graphics.lineTo(800, i*20);
			}
			
			for (var j:int = 0; j <= 40; j++)
			{
				if (j % 5 == 0)
				{
					graphics.lineStyle(3, 0xAAAAAA);
				}
				else
				{
					graphics.lineStyle(1, 0x999999);
				}
				graphics.moveTo(j * 20, 0);
				graphics.lineTo(j * 20, 600);
				
			}
			
		}
		public function assen():void
		{
			graphics.lineStyle(4,0x0092BC);
			graphics.moveTo(400, 0);
			graphics.lineTo(400, 600);
			graphics.moveTo(0, 300);
			graphics.lineTo(800, 300);
		}
	}
}
package toepassing 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Stad extends Sprite
	{

		
		public function Stad() 
		{
			var achtergrond:Sprite = new Sprite();
			achtergrond.graphics.beginFill(0x00FF00);
			achtergrond.graphics.drawRect(0, 0, 960, 600);
			achtergrond.graphics.endFill();
			addChild(achtergrond);
			
			for (var i:int = 0; i < 120; i++)
			{
				var a:Sprite = new Huisje();
				var schaal:Number = Math.random()/5;
				a.scaleX = -schaal;
				a.scaleY = schaal;
				a.x = Math.random()*960;
				a.y = Math.random() * 600;
				addChild(a);
			}
			
		}
		
	}

}
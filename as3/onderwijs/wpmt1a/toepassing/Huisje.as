package toepassing 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Huisje extends Sprite
	{
 
		public function Huisje() 
		{
			this.graphics.lineStyle(4);
			this.graphics.beginFill(0xcccccc);
			this.graphics.moveTo(200, 500);
			this.graphics.lineTo(200, 300);
			this.graphics.lineTo(600, 400);
			this.graphics.lineTo(600, 600);
			this.graphics.endFill();
 
			this.graphics.beginFill(0x999999);
			this.graphics.moveTo(600, 600);
			this.graphics.lineTo(800, 500);
			this.graphics.lineTo(800, 300);
			this.graphics.lineTo(600, 400);
			this.graphics.endFill();
 
			this.graphics.beginFill(0x999999);
			this.graphics.moveTo(600, 400);
			this.graphics.lineTo(800, 300);
			this.graphics.lineTo(700, 200);
			this.graphics.endFill();
 
			this.graphics.beginFill(0xff0000);
			this.graphics.moveTo(600, 400);
			this.graphics.lineTo(700, 200);
			this.graphics.lineTo(300, 100);
			this.graphics.lineTo(200, 300);
			this.graphics.endFill();
 
 
 
		}
 
	}
 
}
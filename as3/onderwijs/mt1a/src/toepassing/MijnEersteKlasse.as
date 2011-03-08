package toepassing 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class MijnEersteKlasse extends Sprite
	{
		
		public function MijnEersteKlasse() 
		{
			this.graphics.lineStyle(2);
			this.graphics.beginFill(0xff00ff);
			this.graphics.moveTo(100, 100);
			this.graphics.lineTo(200, 200);
			this.graphics.lineTo(400, 50);
			this.graphics.lineTo(100, 100);
		}
		
	}

}
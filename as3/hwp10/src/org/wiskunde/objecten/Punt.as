package org.wiskunde.objecten 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Punt extends Sprite
	{
		public function Punt(x:Number, y:Number) 
		{
			this.x = x;
			this.y = y;	
		}
		
		public function tekenPunt(r:Number, kleur:uint):void
		{
			this.graphics.lineStyle(2);
			this.graphics.beginFill(kleur);
			this.graphics.drawCircle(0, 0, r);
			this.graphics.endFill();
		}
		
	}

}
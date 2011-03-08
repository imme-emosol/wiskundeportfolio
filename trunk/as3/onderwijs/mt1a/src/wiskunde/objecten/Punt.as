package wiskunde.objecten 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
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
		
		public function tekenPunt(straal:Number,kleur:uint):void
		{
			this.graphics.lineStyle(2);
			this.graphics.beginFill(kleur);
			this.graphics.drawCircle(0, 0, straal);
			this.graphics.endFill();
		}
		
		public function sleepPunt():void
		{
			this.buttonMode = true;
			this.addEventListener(MouseEvent.MOUSE_DOWN, startSleep);
			this.addEventListener(MouseEvent.MOUSE_UP, stopSleep);
		}
		
		private function startSleep(e:MouseEvent):void
		{
			this.startDrag();
		}
		
		private function stopSleep(e:MouseEvent):void
		{
			this.stopDrag();
		}
		
	}

}
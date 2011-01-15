package wiskunde.objecten 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Punt extends Sprite
	{
		public static const PUNT_SLEEP:String = "punt_sleep";
		public static const PUNT_STOP:String = "punt_stop";
		
		public function Punt(x:Number, y:Number) 
		{
			this.x  = x;
			this.y = y;
			
			
		}
		
		public function tekenPunt(straal:Number = 10, kleur:uint = 0xff0000):void
		{
			this.graphics.lineStyle(2);
			this.graphics.beginFill(kleur);
			this.graphics.drawCircle(0, 0, straal);
			this.graphics.endFill();
		}
		
		public function sleepPunt():void
		{
			buttonMode = true;
			addEventListener(MouseEvent.MOUSE_DOWN, beginSleep);
			addEventListener(MouseEvent.MOUSE_UP, stopSleep);
		}
		
		private function beginSleep(e:MouseEvent):void
		{
			this.dispatchEvent(new Event(Punt.PUNT_SLEEP, true));
			startDrag();
			
		}
		
		private function stopSleep(e:MouseEvent):void
		{
			this.dispatchEvent(new Event(Punt.PUNT_STOP,true));
			stopDrag();
		}
		
		
		
	}

}
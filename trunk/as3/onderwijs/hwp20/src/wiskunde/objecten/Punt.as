package wiskunde.objecten
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * Lokatie weergegeven in een x- en y coordinaat
	 * @author Jelle Sjollema
	 */
	public class Punt extends Sprite
	{
		public function Punt(x:Number=NaN, y:Number=NaN) 
		{
			this.x = x;
			this.y = y;	
		}
		
		/**
		 * verplaatst het punt naar de opgegeven coordinaten
		 * @param	x
		 * @param	y
		 */
		public function setPunt(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
		}
		
		
		/**
		 * Tekent het punt met straal r en kleur 
		 * @param	r
		 * @param	kleur
		 * @param	lijnkleur
		 */
		public function tekenPunt(r:Number=10, kleur:uint=0xff0000, lijnkleur:uint =0x000000):void
		{
			this.graphics.lineStyle(2,lijnkleur);
			this.graphics.beginFill(kleur,0.4);
			this.graphics.drawCircle(0, 0, r);
			this.graphics.endFill();
			this.graphics.lineStyle(1,lijnkleur);
			this.graphics.moveTo( -r/4, 0);
			this.graphics.lineTo( r/4, 0);
			this.graphics.moveTo( 0, -r/4);
			this.graphics.lineTo( 0, r/4);
		}
		
		/**
		 * Verwijdert de tekening van de punt
		 */
		public function clearPunt():void
		{
			this.graphics.clear();
		}
		
		/**
		 * Activeert de sleepmogelijkheid van de punt
		 */
		public function sleepPunt():void
		{			
			this.buttonMode = true;
			addEventListener(MouseEvent.MOUSE_DOWN, sleep);
			addEventListener(MouseEvent.MOUSE_UP, stopSleep);
		}
		
		private function sleep(e:MouseEvent):void
		{
			this.startDrag();
		}
		
		
		private function stopSleep(e:MouseEvent):void
		{
			stopDrag();
		}
		
		
	}

}
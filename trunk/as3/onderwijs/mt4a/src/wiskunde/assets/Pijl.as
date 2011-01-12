package wiskunde.assets 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Pijl extends Sprite
	{
		
		public var lengte:Number;
		public var kleur:uint;
		
		public function Pijl() 
		{
			//
		}
		
		public function tekenPijl(lengte:Number, kleur:uint):void
		{
			this.lengte = lengte;
			this.kleur = kleur;
			tekenStok();
			tekenPunt();
		}
		
		private function tekenStok():void
		{
			 
			 graphics.lineStyle(4, kleur);
			 graphics.moveTo(0, 0);
			 graphics.lineTo(lengte, 0);
		}
		private function tekenPunt():void
		{
			var b:Number = 20;
			var h:Number = 30;
			graphics.lineStyle(2, kleur);
			graphics.beginFill(kleur);
			graphics.moveTo(lengte, 0);
			graphics.lineTo( lengte-b, h / 2);
			graphics.lineTo( lengte-b, -h / 2);
			graphics.lineTo(lengte, 0);
			graphics.endFill();
		}
		
	}

}
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
			this.scaleY = -1;
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
			 graphics.lineTo( 0,lengte);
		}
		private function tekenPunt():void
		{
			var b:Number = 30;
			var h:Number = 20;
			graphics.lineStyle(2, kleur);
			graphics.beginFill(kleur);
			graphics.moveTo(0,lengte);
			graphics.lineTo(h / 2,lengte-b);
			graphics.lineTo(-h / 2,lengte-b);
			graphics.lineTo(0,lengte);
			graphics.endFill();
		}
		
	}

}
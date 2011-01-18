package wiskunde.assets 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Pijl2 extends Sprite 
	{
		public var lengte:Number;
		public var kleur:uint;
		
		public function Pijl2(lengte:Number, kleur:uint=0x000000) 
		{
			this.lengte = lengte;
			this.kleur = kleur;
			
			tekenPijl(lengte, kleur);
		}
		
		public function tekenPijl(lengte:Number, kleur:uint):void
		{
			var pHoogte:Number = 30;
			var pBreedte:Number = 10;
			this.graphics.beginFill(kleur);
			this.graphics.lineStyle(4,kleur);
			this.graphics.moveTo(0, 0);
			this.graphics.lineTo(0, -(lengte-pHoogte));
			
			this.graphics.lineTo(pBreedte / 2, -(lengte-pHoogte));
			this.graphics.lineTo(0, -lengte);
			this.graphics.lineTo( -pBreedte / 2, -(lengte-pHoogte));
			this.graphics.lineTo(0, -(lengte-pHoogte));
			this.graphics.endFill();
		}
	}

}
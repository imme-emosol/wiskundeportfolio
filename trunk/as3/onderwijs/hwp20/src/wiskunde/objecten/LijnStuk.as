package wiskunde.objecten 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class LijnStuk extends Sprite
	{
		public var P:Punt;
		public var Q:Punt;
		public var lijnKleur:uint = 0x000000;
		public var lijnDikte:int = 3;
		
		public function LijnStuk(P:Punt, Q:Punt) 
		{
			this.P = P;
			this.Q = Q;
		}
		
		public function tekenLijnStuk():void
		{
			var teken:Graphics = this.graphics;
			teken.clear();
			teken.lineStyle(lijnDikte, lijnKleur);
			teken.moveTo(P.x, P.y);
			teken.lineTo(Q.x, Q.y);
		}
		
	}

}
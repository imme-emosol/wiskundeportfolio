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
		
		public function LijnStuk(P:Punt, Q:Punt) 
		{
			this.P = P;
			this.Q = Q;
		}
		
		public function tekenLijnStuk(lijnkleur:uint = 0x000000, lijndikte:Number = 2):void
		{
			var t:Graphics = this.graphics;
			t.clear();
			t.lineStyle(lijndikte);
			t.moveTo(P.x, P.y);
			t.lineTo(Q.x, Q.y);
		}
	}

}
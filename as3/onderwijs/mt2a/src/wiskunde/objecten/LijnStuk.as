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
		
		public function tekenLijnStuk():void
		{
			var g:Graphics = this.graphics;
			//g.clear();
			//g.lineStyle(4);
			g.lineStyle(Math.random() * 100, Math.random() * 0xffffff, Math.random())
			g.moveTo(P.x, P.y);
			g.lineTo(Q.x, Q.y);
		}
	}

}
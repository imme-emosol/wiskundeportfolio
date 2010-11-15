package wiskunde.objecten 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	/**
	 * Verbindt 3 punten met elkaar
	 * @author Jelle Sjollema
	 */
	public class Driehoek extends Sprite
	{
		public var P:Punt;
		public var Q:Punt;
		public var R:Punt;
		public var S:Punt;
		public var kleur:uint =0xff0000;
		public var lijndikte:Number
		
		public function Driehoek(P:Punt,Q:Punt,R:Punt) 
		{
			this.P = P;
			this.Q = Q;
			this.R = R;
		}
		
		public function setDriehoek(P:Punt, Q:Punt, R:Punt):void
		{
			clearDriehoek();
			this.P = P;
			this.Q = Q;
			this.R = R;
			tekenDriehoek();
		}
		
		public function tekenDriehoek(kleur:uint = 0xffff00, lijndikte:Number= 0 ):void
		{
			this.kleur = kleur;
			this.lijndikte = lijndikte;
			var tmp:Graphics = this.graphics;
			tmp.clear();
			tmp.lineStyle(lijndikte);
			tmp.beginFill(kleur,0.4);
			tmp.moveTo(P.x, P.y);
			tmp.lineTo(Q.x, Q.y);
			tmp.lineTo(R.x, R.y);
		}
		
		public function clearDriehoek():void
		{
			this.graphics.clear();
		}
		
	}

}
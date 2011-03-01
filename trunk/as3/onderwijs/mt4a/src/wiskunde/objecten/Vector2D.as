package wiskunde.objecten 
{
	import flash.display.Sprite;
	import flash.net.URLLoaderDataFormat;
	import wiskunde.assets.Pijl;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Vector2D extends Sprite
	{
		private var _dx:Number;
		private var _dy:Number;
		private var _hoek:Hoek;
		private var _norm:Number;
		private var _schaal:Number;
		
		private var pijl:Pijl;
		
		
		public function Vector2D(dx:Number, dy:Number) 
		{
			hoek = new Hoek(1);
			this.dx = dx;
			this.dy = dy;
		}
		
		public function tekenVector(schaal:Number = 50):void
		{
			norm = Math.sqrt(dx * dx + dy * dy);
			pijl = new Pijl();
			pijl.tekenPijl(norm*schaal, 0x0000ff);
			hoek.radialen = Math.atan2(dy, dx);
			pijl.rotation = hoek.graden+90;
			addChild(pijl);
		}
		
	}

}
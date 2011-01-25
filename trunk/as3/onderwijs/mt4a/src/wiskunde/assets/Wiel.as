package wiskunde.assets 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Hoek;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Wiel extends Sprite
	{
		public var r:Number;
		
		public function Wiel(r:Number) 
		{
			var pijl1:Pijl = new Pijl();
			pijl1.tekenPijl(r,0xffffff);
			addChild(pijl1);
			
			var pijl2:Pijl = new Pijl();
			pijl2.tekenPijl(r, 0xffffff);
			pijl2.rotation = 90;
			addChild(pijl2);
			
			var pijl3:Pijl = new Pijl();
			pijl3.tekenPijl(r, 0xffffff);
			pijl3.rotation = 180;
			addChild(pijl3);
			
			var pijl4:Pijl = new Pijl();
			pijl4.tekenPijl(r, 0xffffff);
			pijl4.rotation = 270;
			addChild(pijl4);
									
			
			this.r = r;
			this.graphics.lineStyle(2);
			this.graphics.beginFill(0x191977);
			this.graphics.drawCircle(0, 0, r);
			this.graphics.endFill();
			
		}
		
		public function draaiWiel(hoek:Hoek):void
		{
			this.rotation += hoek.graden;
		}
		
	}

}
package wiskunde.assets 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Raster extends Sprite
	{
		private var Dy:Number;
		private var Dx:Number;
		private var yc:Number;
		private var xc:Number;
		
		public function Raster(Dx:Number, Dy:Number) 
		{
			
			this.Dx = Dx;
			this.Dy = Dy;
			
			this.graphics.lineStyle(2,0x000000);
			
			for (var i:int = 0; i < 600/Dy; i++)
			{
				yc = Dy * i;
				this.graphics.moveTo(0, yc);
				this.graphics.lineTo(960, yc);
			}

			for (i = 0; i < 960/Dx; i++)
			{
				xc= Dx* i;
				this.graphics.moveTo(xc, 0);
				this.graphics.lineTo(xc, 600);
			}

			
			

		
		}
		
	}

}
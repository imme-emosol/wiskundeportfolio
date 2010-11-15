﻿package wiskunde.assets 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Raster extends Sprite
	{
		public var yc:Number;
		public var Dy:Number = 20;
		public var offsetY:Number = 0;
		public var xc:Number;
		public var Dx:Number = 20;
		public var offsetX:Number = 0;
		public var modX:Number;
		public var modY:Number;
		
		public function Raster(Dx:Number, offsetX:Number, Dy:Number, offsetY:Number,modX:Number = 100, modY:Number=  100 ) 
		{
			this.Dx = Dx;
			this.Dy = Dy;
			this.offsetX = offsetX;
			this.offsetY = offsetY;
			this.modX = modX;
			this.modY = modY;
			
			if (Dx <= 0 || Dy <= 0)
			{
				throw new Error("dx en dy moeten groter zijn dan nul");
			}
			
			for (var i:int = 0; i <= 600/Dy; i++)
			{
				this.x = offsetX;
				this.y = 600-offsetY;
				this.scaleY = -1;
				
				yc = -offsetY + i * Dy;
				if (yc % modY == 0)
				{
					if (yc == 0)
					{
						graphics.lineStyle(5,0x0092BC);
					}
					else
					{
						graphics.lineStyle(3,0x000000);
					}
				}
				else
				{
					graphics.lineStyle(1,0x000000);
				}
				
				
				graphics.moveTo(0-offsetX, yc);
				graphics.lineTo(960-offsetX, yc);
			}

		for (var j:int = 0; j <= 960/Dy; j++)
			{
				xc = -offsetX + j * Dx;
				if (xc % modX == 0)
				{
					if (xc == 0)
					{
						graphics.lineStyle(5,0x0092BC);
					}
					else
					{
						graphics.lineStyle(3,0x000000);
					}
				}
				else
				{
					graphics.lineStyle(1,0x000000);
				}
				graphics.moveTo(xc, 0-offsetY);
				graphics.lineTo(xc, 600-offsetY);
			}

		}
		
	}

}
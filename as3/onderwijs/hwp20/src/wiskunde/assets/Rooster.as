package wiskunde.assets 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Rooster extends Sprite
	{
		public var yc:Number;
		public var Dy:Number = 20;
		public var offsetY:Number = 0;
		public var xc:Number;
		public var Dx:Number = 20;
		public var offsetX:Number = 0;
		public var alpha_lijn:Number;
		
		public function Rooster(offsetX:Number, offsetY:Number, alpha_lijn:Number = 0.4, Dy:Number = 20, Dx:Number = 20) 
		{
			this.Dx = Dx;
			this.Dy = Dy;
			this.offsetX = offsetX;
			this.offsetY = offsetY;
			this.alpha_lijn = alpha_lijn;
			
			this.graphics.beginFill(0xffffff);
			this.graphics.drawRect(-offsetX, -offsetY, 960, 600);
			this.graphics.endFill();
			
			for (var i:int = 0; i <= 600/Dy; i++)
			{
				this.x = offsetX;
				this.y = 600-offsetY;
				this.scaleY = -1;
				
				yc = -offsetY + i * Dy;
				if (yc % 100 == 0)
				{
					if (yc == 0)
					{
						graphics.lineStyle(3,0x0092BC);
					}
					else
					{
						graphics.lineStyle(3,0x999999,alpha_lijn);
					}
				}
				else
				{
					graphics.lineStyle(1,0x999999,alpha_lijn);
				}
				
				
				graphics.moveTo(0-offsetX, yc);
				graphics.lineTo(960-offsetX, yc);
			}

		for (var j:int = 0; j <= 960/Dy; j++)
			{
				xc = -offsetX + j * Dx;
				if (xc % 100 == 0)
				{
					if (xc == 0)
					{
						graphics.lineStyle(3,0x0092BC);
					}
					else
					{
						graphics.lineStyle(3,0x999999,alpha_lijn);
					}
				}
				else
				{
					graphics.lineStyle(1,0x999999,alpha_lijn);
				}
				graphics.moveTo(xc, 0-offsetY);
				graphics.lineTo(xc, 600-offsetY);
			}

		}
		
	}

}
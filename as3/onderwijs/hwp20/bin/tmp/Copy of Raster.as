package wiskunde.assets 
{
	import flash.display.Sprite;
	import wiskunde.operaties.LogischeOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Raster extends Sprite
	{
		public var teller:Number;
		public var Dx:Number;
		public var offsetX:Number ;
		public var Dy:Number;
		public var offsetY:Number
		public var lijnX:Number;
		public var lijnY:Number;
		
		public function Raster( Dx:Number, Dy:Number) 
		{
			this.Dx = Dx;
			this.offsetX = offsetX;
			this.Dy = Dy;
			this.offsetY = offsetY;
			//this.lijnX = lijnX;
			//this.lijnY = lijnY;
			
			if (LogischeOperaties.en(Dx > 0, Dy >0 ))
			{			
				for (var i:int = 0; i <= int(600/Dy); i++)
				{	 
					if (Dy*i %100== 0)
					{
						graphics.lineStyle(3, 0xAAAAAA);
					}
					else
					{
						graphics.lineStyle(1, 0x999999);
					}
					graphics.moveTo(0, Dy*i);
					graphics.lineTo(960, Dy*i);
				}
	 
				for (var j:int = 0; j <= int(960/Dx); j++)
				{
	 
					if (Dx*j % 100 == 0)
					{
						graphics.lineStyle(3, 0xAAAAAA);
					}
					else
					{
						graphics.lineStyle(1, 0x999999);
					}
					graphics.moveTo(Dx*j,0);
					graphics.lineTo(Dx*j, 600);
	 
				}
				
			}

		}
		
	}

}
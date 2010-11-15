package wiskunde.assets
{
	import flash.display.Sprite;
	
	/**
	 * .Tekent een pijl
	 * @author Jelle Sjollema
	 */
	public class Pijl extends Sprite
	{
		public var lengte:Number
		public var color:uint;
		
		public function Pijl(lengte:Number,color:uint) 
		{
			this.lengte = lengte;
			this.color = color;
			teken(lengte, color);
			
		}
		
		public function teken(lengte:Number, color:uint):void
		{
			tekenPijl(lengte, color);
			
		}
		
		private function tekenPijl(lengte:Number,color:uint):void
		{
			var hoogte:Number = 5;
			var breedte:Number = 20;
			
			graphics.clear();
			graphics.lineStyle(3, color);
			graphics.moveTo(0, 0);
			
			graphics.beginFill(color);
			if (lengte > 0)
			{
				graphics.lineTo(lengte, 0);				
				graphics.lineTo(lengte-breedte, -hoogte);
				graphics.lineTo(lengte-breedte, hoogte);
				graphics.lineTo(lengte, 0);
				graphics.endFill();				
			}
			else
			{
				graphics.lineTo(lengte, 0);				
				graphics.lineTo(lengte+breedte, -hoogte);
				graphics.lineTo(lengte+breedte, hoogte);
				graphics.lineTo(lengte, 0);
				graphics.endFill();				
			}
			
		}
		
	}

}
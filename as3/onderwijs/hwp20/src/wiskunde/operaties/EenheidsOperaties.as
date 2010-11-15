package wiskunde.operaties 
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class EenheidsOperaties
	{
		
		public static function pixelsNaarPunten(pixels:Number):Number
		{
			return 3 * pixels / 4;
		}
		
		public static function pixelsNaarEms(pixels:Number):Number
		{
			return pixels / 16;
		}
		
		public static function pixelsNaarPercent(pixels:Number):Number
		{
			return pixels * 100 / 16;
		}
		
		public static function puntenNaarPixels(punten:Number):Number
		{
			return punten * 4 / 3;
		}
		
		public static function puntenNaarEms(punten:Number):Number
		{
			return punten / 12;
		}
		
		public static function puntenNaarPercent(punten:Number):Number
		{
			return punten * 100 / 12;
		}
		
		public static function emsNaarPixels(ems:Number):Number
		{
			return ems * 16;
		}
		
		public static function emsNaarPunten(ems:Number):Number
		{
			return ems * 12;
		}
		
		public static function emsNaarPercent(ems:Number):Number
		{
			return ems * 100;
		}

		public static function percentNaarPixels(percent:Number):Number
		{
			return percent*12 / 100;
		}

				public static function percentNaarPunten(percent:Number):Number
		{
			return percent *16/100;
		}

				public static function percentNaarEms(percent:Number):Number
		{
			return percent / 100;
		}

		
	}

}
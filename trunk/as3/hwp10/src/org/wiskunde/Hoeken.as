package org.wiskunde 
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Hoeken
	{	
		public static function rad(graden:Number):Number
		{
			return graden * Math.PI / 180;
		}
		
		public static function graden(rad:Number):Number
		{
			return rad * 180 / Math.PI;
		}
		
	}

}
package org.wiskunde.meetkunde
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Hoek
	{
		public var graden:Number;
		public var rad:Number;
		
		public function Hoek(h:Number, soort:String = "g")
		{
			if (soort == "r")
			{
				this.rad = h;
				this.graden = h*180/Math.PI
			}
			else
			{
				this.graden = h;
				this.rad = h*Math.PI/180
			}	
		}
	}

}
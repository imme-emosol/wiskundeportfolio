package wiskunde.objecten 
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Hoek 
	{
		private var g:String;
		public var graden:Number;
		public var rad:Number;
		
		public function Hoek(hoek:Number, g:String = "g") 
		{
			if (g == "g")
			{
				this.graden = hoek;
				this.rad = hoek * Math.PI / 180; 
			}
			else
			{
				this.rad = hoek;
				this.graden = hoek * 180 / Math.PI;
			}
			
		}
		
	}

}
package wiskunde.objecten 
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Getal 
	{
		public var waarde:Number;
		
		public function Getal(waarde:Number) 
		{
			this.waarde = waarde;
			
		}
		
		public function optellen(a:Number):void
		{
			waarde = waarde + a;
		}
		
		public function vermenigvuldigen(a:Number):void
		{
			this.waarde *= a;
		}
	}

}
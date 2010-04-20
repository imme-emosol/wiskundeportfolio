package org.wiskunde.objecten 
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Getal extends Number
	{
		public var a:Number
		
		public function Getal(a:Number) 
		{
			this.a = a;
			
		}
		
		public function set waarde(a:Number):void
		{
			this.a = a;
		}
		
	}

}
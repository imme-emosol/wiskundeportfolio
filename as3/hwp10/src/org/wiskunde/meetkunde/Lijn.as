package org.wiskunde.meetkunde
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Lijn
	{
		public var a:Number;
		public var b:Number;
		public var c:Number;
		
		public function Lijn(a:Number, b:Number, c:Number) 
		{
			this.a = a;
			this.b = b;
			this.c = c;
		}
		
		public function berekenX(y:Number):Punt
		{
			var P:Punt = new Punt((c-b*y)/a, y);
			return P;
		}
		
		public function berekenY(x:Number):Punt
		{
			var P:Punt = new Punt(x,(c-a*x)/b);
			return P;
		}		
	}

}
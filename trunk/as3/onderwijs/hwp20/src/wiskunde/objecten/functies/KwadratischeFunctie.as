package wiskunde.objecten.functies 
{
	import wiskunde.objecten.functies.Functie;
	/**
	 * f(x): y = ax^2 + bx + c
	 * @author Jelle Sjollema
	 */
	public class KwadratischeFunctie extends Functie
	{
		private var a:Number, b:Number, c:Number;
		
		public function KwadratischeFunctie(a:Number, b:Number, c:Number) 
		{
			this.params = new Array(a, b, c);
			this.a = a;
			this.b = b;
			this.c = c;
		}
		
		override public function bereken(x:Number):Number 
		{
			return a * x * x + b * x + c;
		}
		
		override public function afgeleide():Functie 
		{
			return new LineaireFunctie(2 * a, b);
			//return f;
		}
	}

}
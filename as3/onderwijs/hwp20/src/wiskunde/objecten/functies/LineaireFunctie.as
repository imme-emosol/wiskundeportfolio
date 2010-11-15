package wiskunde.objecten.functies 
{
	import wiskunde.objecten.functies.Functie;
	/**
	 * f(x): y = ax + b
	 * @author Jelle Sjollema
	 */
	public class LineaireFunctie extends Functie
	{
		private var a:Number, b:Number;
		public function LineaireFunctie(a:Number, b:Number) 
		{
			this.params = new Array(a, b);
			this.a = a;
			this.b = b;
		}
		
		override public function afgeleide():Functie 
		{
			return new LineaireFunctie(a, 0);
		}
		
		override public function bereken(x:Number):Number 
		{
			return a * x + b;
		}
		
	}

}
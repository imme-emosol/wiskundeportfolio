package wiskunde.objecten.functies 
{
	import wiskunde.objecten.functies.Functie;
	/**
	 * f(x): y = a/(bx+c)
	 * @author Jelle Sjollema
	 */
	public class ReciprokeFunctie extends Functie
	{
		private var a:Number;
		private var b:Number;
		private var c:Number;
		
		public function ReciprokeFunctie(a:Number, b:Number, c:Number)
		{
			this.params = new Array();
			params.push(a);
			params.push(b);
			params.push(c);
			this.a = a;
			this.b = b;
			this.c = c;
		}
		
		override public function bereken(x:Number):Number 
		{
			return  (a / (b*x + c)) ;
		}
		
		override public function afgeleide():Functie 
		{
			return null;
		}
	}

}
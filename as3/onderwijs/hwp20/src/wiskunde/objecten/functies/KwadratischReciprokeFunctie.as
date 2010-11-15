package wiskunde.objecten.functies 
{
	import wiskunde.objecten.functies.Functie;
	/**
	 * f(x): y =(ax^2 + bx + c)/(dx + e)
	 * @author Jelle Sjollema
	 */
	public class KwadratischReciprokeFunctie extends Functie
	{
		private var a:Number;
		private var b:Number;
		private var c:Number;
		private var d:Number;
		private var e:Number;
		
		public function KwadratischReciprokeFunctie(a:Number, b:Number, c:Number, d:Number, e:Number)
		{
			this.params = new Array();
			params.push(a);
			params.push(b);
			params.push(c);
			params.push(d);
			params.push(e);
			this.a = a;
			this.b = b;
			this.c = c;
			this.d = d;
			this.e = e;

		}
		
		override public function bereken(x:Number):Number 
		{
			return (a*x*x  + b*x + c) / (d*x + e) ;
		}
		
		override public function afgeleide():Functie 
		{
			return null;
		}
	}

}
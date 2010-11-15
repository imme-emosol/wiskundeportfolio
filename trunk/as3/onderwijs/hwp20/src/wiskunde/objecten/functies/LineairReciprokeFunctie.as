package wiskunde.objecten.functies 
{
	import wiskunde.objecten.functies.Functie;
	/**
	 * f(x): y = a/(bx+c)
	 * @author Jelle Sjollema
	 */
	public class LineairReciprokeFunctie extends Functie
	{
		private var a:Number;
		private var b:Number;
		private var c:Number;
		private var d:Number;
		
		public function LineairReciprokeFunctie(a:Number, b:Number, c:Number, d:Number)
		{
			this.params = new Array();
			params.push(a);
			params.push(b);
			params.push(c);
			params.push(d);
			this.a = a;
			this.b = b;
			this.c = c;
			this.d = d;
		}
		
		override public function bereken(x:Number):Number 
		{
			return  (a*x  + b)/ (c*x + d) ;
		}
		
		override public function afgeleide():Functie 
		{
			return null;
		}
		
		public function setParams(a:Number, b:Number, c:Number, d:Number):void
		{
						params.push(a);
			params.push(b);
			params.push(c);
			params.push(d);
			this.a = a;
			this.b = b;
			this.c = c;
			this.d = d;
		}
		
	}

}
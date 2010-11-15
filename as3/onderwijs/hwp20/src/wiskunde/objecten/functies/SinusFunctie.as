package wiskunde.objecten.functies 
{
	import wiskunde.objecten.functies.Functie;
	
	/**
	 * f(x): y =offset + amplitude sin(golfgetal*x + fase)
	 * * @author Jelle Sjollema
	 */
	public class SinusFunctie extends Functie
	{
		private var offset:Number, amplitude:Number, golfgetal:Number, fase:Number;
		
		public function SinusFunctie(offset:Number, amplitude:Number, golfgetal:Number, fase:Number) 
		{
			this.params = new Array(offset, amplitude, golfgetal, fase);
			this.offset = offset;
			this.amplitude = amplitude;
			this.golfgetal = golfgetal;
			this.fase = fase;
		}
		
		override public function bereken(x:Number):Number 
		{
			return offset + amplitude * Math.sin(golfgetal * x + fase);
		}
		
		override public function afgeleide():Functie 
		{
			return new null
		}
	}

}
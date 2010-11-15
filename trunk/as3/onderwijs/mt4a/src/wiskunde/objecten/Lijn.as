package wiskunde.objecten 
{
	import flash.display.Sprite;
	import wiskunde.operaties.PuntOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Lijn extends Sprite
	{
		public var a:Number;
		public var b:Number;
		public var c:Number;
		
		private var P:Punt;
		private var Q:Punt
		
		public function Lijn(a:Number, b:Number, c:Number) 
		{
			this.a = a;
			this.b = b;
			this.c = c;
		}
		
		public function setLijn(a:Number, b:Number, c:Number):void
		{
			this.a = a;
			this.b = b;
			this.c = c;
		}
		
		public function berekenX(yp:Number):Number
		{
			var antwoord:Number;
			antwoord = (c - b * yp) / a;
			return antwoord;
		}
		
		public function berekenY(xp:Number):Number
		{
			var antwoord:Number;
			antwoord = (c - a * xp) / b;
			return antwoord;
		}
		
		public function tekenLijn(minX:Number = -480, maxX:Number = 480, minY:Number = -300, maxY:Number = 300):void
		{
			var P1:Punt = new Punt(minX, berekenY(minX));
			var P2:Punt = new Punt(maxX, berekenY(maxX));
			var P3:Punt = new Punt(berekenX(minY), minY);
			var P4:Punt = new Punt(berekenX(maxY), maxY);
			
			var LB:Punt = new Punt(minX, maxY);
			var RB:Punt = new Punt(maxX, maxY);
			var LO:Punt = new Punt(minX, minY);
			var RO:Punt = new Punt(maxX, minY);
			
			this.graphics.clear();
			this.graphics.lineStyle(4, 0xff0000);
			
			this.graphics.moveTo(P1.x, P1.y);
			this.graphics.lineTo(P2.x, P2.y);
			this.graphics.lineTo(P3.x, P3.y);
			this.graphics.lineTo(P4.x, P4.y);

			
		}
		
	}

}
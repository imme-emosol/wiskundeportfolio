package wiskunde.objecten
{
	import flash.display.Sprite;
	import wiskunde.objecten.Punt;
	/**
	 * Een verzameling punten (x,y) die voldoen aan de vergelijking: ax + by = c<BR>
	 * Zie: <a href="http://wiki.wiskundeportfolio.nl/index.php/Lijn">wiskundeObject Lijn</a>
	 * @author Jelle Sjollema
	 */
	public class Lijn extends Sprite
	{
 
		/**
		 * de relatieve verplaatsing dy
		 */
		public var a:Number;
		/**
		 * de relatieve verplaatsing dx
		 */
		public var b:Number;
		/**
		 *  een maat voor de snijpunten met de x-as (c/b)  en y-as (c/a)
		 */
		public var c:Number;
		/**
		 * als er een tekening van de lijn bestaat, wordt deze variabele true
		 */
		public var tekening:Boolean;
 
		public function Lijn(a:Number, b:Number, c:Number) 
		{
			this.a = a;
			this.b = b;
			this.c = c;
			tekening = false;
 
		}
 
		/**
		 * Als het functievoorschrift van een bestaande lijn wordt aangepast en de tekening van de lijn 
		 * aangepast moet worden, kan deze methode worden gebruikt
		 * @param	a
		 * @param	b
		 * @param	c
		 */
 
		public function setLijn(a:Number, b:Number, c:Number):void
		{
			this.a = a;
			this.b = b;
			this.c = c;
			if (tekening)
			{
				tekenLijn();
			}
		}
 
		/**
		 * als van een lijn de parameter c nog niet bekend is (NaN), kan met behulp 
		 * van deze methode de waarde voor c worden bepaald
		 * @param	p: Een punt dat op de lijn ligt
		 */
		public function berekenC(p:Punt):void
		{
			this.c = a * p.x + b * p.y;
		}
 
		/**
		 * Berekent de x-waarde voor een punt op de lijn bij ingevoerde y
		 * @param	y
		 * @return
		 */
		public function berekenX(y:Number):Number
		{
			return (c-(b*y))/a;
		}
 
		/**
		 * Berekent de y-waarde voor een punt op de lijn bij ingevoerde yx
		 * @param	x
		 * @return
		 */
		public function berekenY(x:Number):Number
		{
			return (c-(a*x))/b;
		}
 
		/**
		 * Tekent de lijn
		 */
		public function tekenLijn(minX:Number=-480, maxX:Number=480, minY:Number=-300, maxY:Number=300):void
		{
			this.x = 480;
			this.y = 300;
			tekening = true;
			this.scaleY = -1;
 
			while (this.numChildren > 0)
			{
				removeChildAt(0)
			}
 
 
			var P:Punt = new Punt(0,0);
			var Q:Punt = new Punt(0, 0);
 
			var links:Boolean =  berekenY(minX) >= minY && berekenY(minX) <= maxY;
			var rechts:Boolean = berekenY(maxX) >= minY && berekenY(maxX) <= maxY;
			var onder:Boolean =  berekenX(maxY) > minX && berekenX(maxY) < maxX;
			var boven:Boolean =  berekenX(minY) > minX && berekenX(minY) < maxX;
 
 
			if (links && boven)
			{
				P = new Punt(minX, berekenY(minX));
				Q = new Punt(berekenX(minY), minY);
			}			
			if (links && rechts)
			{
				P = new Punt(minX, berekenY(minX));
				Q = new Punt(maxX, berekenY(maxX));
			}
 
			if (links && onder)
			{
				P = new Punt(minX, berekenY(minX));
				Q = new Punt(berekenX(maxY), maxY);
			}
 
			if (boven && rechts)
			{
				P = new Punt(berekenX(minY), minY);
				Q = new Punt(maxX, berekenY(maxX));
			}
 
			if (boven && onder)
			{
				P = new Punt(berekenX(minY), minY);
				Q = new Punt(berekenX(maxY), maxY);
			}
			if (onder && rechts)
			{
				P = new Punt(maxX, berekenY(maxX));
				Q = new Punt(berekenX(maxY), maxY);
			}
 
			P.tekenPunt(5, 0x0092BC );
			Q.tekenPunt(5, 0x0092BC );
 
			addChild(P);
			addChild(Q);
 
 
			this.graphics.clear();
			this.graphics.lineStyle(4, 0xff0000 );
			this.graphics.moveTo(P.x, P.y);
			this.graphics.lineTo(Q.x, Q.y);
		}
 
	}
 
}


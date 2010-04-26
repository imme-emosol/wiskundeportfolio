package org.wiskunde.vectoren
{
	import flash.display.Sprite;
	import org.wiskunde.functies.Hoeken;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class WVector extends Sprite
	{
		public var dx:Number;
		public var dy:Number;
		public var r:Number;
		public var hoek:Number;
		private var tekening:Boolean;
		private var kleur:uint;
		private var schaal:Number
		
		public function WVector() 
		{
			tekening = false;
		}
		
		public function setCartesiaans(dx:Number, dy:Number):void
		{
			this.dx = dx;
			this.dy = dy;
			this.r = Math.sqrt(dx * dx + dy * dy);
			this.hoek = Math.atan2(dy, dx);
			
			if(tekening)
			{
				teken(this.schaal, this.kleur)
			}
		}
		
		public function setPool(r:Number, hoek:Number):void
		{
			this.r = r;
			this.hoek = hoek;
			this.dx = r*Math.cos(hoek);
			this.dy = r * Math.sin(hoek);
			
			if(tekening)
			{
				teken(this.schaal, this.kleur)
			}
		}
			
		public function teken(schaal:Number, kleur:uint):void
		{
			tekening = true;
			this.schaal = schaal;
			this.kleur = kleur;
			var lengte:Number = schaal * r;
			var hoogte:Number = 5;
			var breedte:Number = 20;
			
			this.rotation = Hoeken.graden(hoek);
			
			graphics.clear();
			graphics.lineStyle(3, kleur);
			graphics.moveTo(0, 0);
			
			graphics.beginFill(kleur);
			if (lengte > 0)
			{
				graphics.lineTo(lengte, 0);				
				graphics.lineTo(lengte-breedte, -hoogte);
				graphics.lineTo(lengte-breedte, hoogte);
				graphics.lineTo(lengte, 0);
				graphics.endFill();				
			}
			else
			{
				graphics.lineTo(lengte, 0);				
				graphics.lineTo(lengte+breedte, -hoogte);
				graphics.lineTo(lengte+breedte, hoogte);
				graphics.lineTo(lengte, 0);
				graphics.endFill();				
			}
		}
	}
}
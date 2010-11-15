package wiskunde.assets
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.objecten.Hoek;
	/**
	 * Tekent een gradenboog
	 * @author Jelle Sjollema
	 */
	public class GradenBoog extends Sprite
	{
		
		public var segment:Sprite
		public var r:Number;
		
		public function GradenBoog(r:Number = 250) 
		{
			if (r < 200)
			{
				r = 200;
			}
			this.r = r;
			var tekening:Graphics = this.graphics;
			segment = new Sprite();
			addChild(segment);
			
			tekening.lineStyle(1);
			tekening.beginFill(0xeeeeff, 0.4);
			tekening.drawCircle(0, 0, r);
			tekening.endFill();
			
			tekening.lineStyle(2);
			tekening.moveTo( -r, 0);
			tekening.lineTo(r, 0);
			tekening.moveTo(0, r);
			tekening.lineTo(0, -r);
			
			for (var i:uint = 0; i < 360; i++)
			{
				
				
				var hoek:Hoek = new Hoek(i);
				if (i %5 == 0)
				{
					tekening.lineStyle(2);
					
					if (i % 10 == 0)
					{
						tekening.moveTo( 100 * Math.cos(hoek.rad),  100* Math.sin(hoek.rad));
						tekening.lineTo( + r * Math.cos(hoek.rad), r * Math.sin(hoek.rad));						
					}
					else
					{
						tekening.moveTo( (r-20) * Math.cos(hoek.rad),  (r-20)* Math.sin(hoek.rad));
						tekening.lineTo(r * Math.cos(hoek.rad), r * Math.sin(hoek.rad));	
	
					}
				}
					
				else
				{
					tekening.lineStyle(1);
					tekening.moveTo( (r-5) * Math.cos(hoek.rad), (r-5) * Math.sin(hoek.rad));
					tekening.lineTo(r * Math.cos(hoek.rad),  r * Math.sin(hoek.rad));
				}
			}
		}
		
		
		public function clearSegment():void
		{
			segment.graphics.clear();
		}
		
		public function tekenSegment(begin:Number, eind:Number, kleur:uint=0xff0000, alpha:Number = 0.5):void
		{
			trace(r);
			var tekening:Graphics = segment.graphics;
			var h0:Hoek = new Hoek(begin);
			tekening.beginFill(kleur,alpha);
			tekening.lineTo(250 * Math.cos(h0.rad), 250 * Math.sin(h0.rad));
			var h1:Hoek = new Hoek(eind);
			for (var j:Number = h0.graden; j <= h1.graden; j++)
			{
				var h2:Hoek = new Hoek(j);
				tekening.lineTo(r * Math.cos(h2.rad),r * Math.sin(h2.rad));
			}
			tekening.lineTo(0, 0);
			tekening.endFill();
		}
		
	}

}
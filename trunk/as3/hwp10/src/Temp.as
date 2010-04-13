package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.portfolio.assets.Pijl;
	import org.wiskunde.WVector;
	import org.wiskunde.Hoeken;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Temp extends Sprite
	{
		public var a:WVector = new WVector();
		
		public function Temp() 
		{
			a.setCartesiaans(5, 5);
			trace(a.r);
			trace(Hoeken.graden(a.hoek));
			a.teken(10, 0x0000ff);
			addChild(a);
			a.x = 300;
			a.y = 300;
			
			addEventListener(Event.ENTER_FRAME, beweeg);
		}
		
		public function beweeg(e:Event):void
		{
			a.x = a.x + a.dx;
			a.y = a.y + a.dy;
			
			if (a.y > 600)
			{
				a.setCartesiaans(a.dx, -a.dy);	
			}
			
			if (a.x > 800)
			{
				a.setCartesiaans( -a.dx, a.dy);
			}
			
			if (a.y < 0)
			{
				a.setCartesiaans(a.dx, -a.dy);
				
			}
			if (a.x < 0)
			{
				a.setCartesiaans( -a.dx, a.dy);
			}
			
		}
		
		
	}

}
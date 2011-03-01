package toepassingen.vectoren 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.objecten.Punt;
	import wiskunde.objecten.Vector2D;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestVector extends Sprite
	{
		public var v:Vector2D;
		public var P:Punt;
		
		public function TestVector() 
		{
			v = new Vector2D(1, 2);
			P = new Punt(450, 300);
			P.tekenPunt(20, 0xff0000);
			addChild(P);
			P.addChild(v);
			addEventListener(Event.ENTER_FRAME, update);
			v.tekenVector();
			
		}
		
		private function update(e:Event):void
		{
			if (P.x > 960)
			{
				v.dx = - v.dx;
			}
			
			if (P.y > 600)
			{
				v.dy = - v.dy;
			}
			
			P.x += v.dx;
			P.y += v.dy;
			
		}
		
	}

}
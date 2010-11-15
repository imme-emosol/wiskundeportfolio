package toepassingen.driehoeken
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.assets.Basis;
	import wiskunde.assets.Rooster;
	import wiskunde.objecten.Driehoek;
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class tekenTweeDriehoeken extends Basis
	{
		public var driehoek1:Driehoek;
		public var driehoek2:Driehoek;
		
		public var W:Punt;
		public var R:Punt;
		public var G:Punt;
		public var B:Punt;
		
		public function tekenTweeDriehoeken() 
		{
			W = new Punt(200, 200);
			W.tekenPunt(10, 0xffffff);
			W.sleepPunt();

			
			R = new Punt(400, 200);
			R.tekenPunt(10, 0xff0000);
			R.sleepPunt();
			
			G = new Punt(200, 400);
			G.tekenPunt(10, 0x00ff00);
			G.sleepPunt();
			
			B = new Punt(400, 400);
			B.tekenPunt(10, 0x0000ff);
			B.sleepPunt();

			driehoek1 = new Driehoek(W,R,G);
			driehoek1.tekenDriehoek(0xff00ff);
			addChild(driehoek1);
			
			driehoek2 = new Driehoek(G, B, R);
			driehoek2.tekenDriehoek(0xffff00);
			addChild(driehoek2);
	
			addChild(W);
			addChild(R);
			addChild(G);
			addChild(B);
			
			W.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			R.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			G.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			B.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			
			W.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			R.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			G.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			B.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
		}
		
		public function beginUpdate(e:MouseEvent):void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function stopUpdate(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void
		{
			driehoek1.setDriehoek(W, R, G);
			driehoek1.tekenDriehoek(0xff00ff);
			driehoek2.setDriehoek(G, B, R);
			driehoek2.tekenDriehoek(0xffff00);
		}
		
		
	}

}
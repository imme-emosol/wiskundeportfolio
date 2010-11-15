package toepassingen.driehoeken 
{
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
	public class tekenDriehoek extends Basis
	{
		public var driehoek:Driehoek;
		public var P:Punt;
		public var Q:Punt;
		public var R:Punt;
		
		public function tekenDriehoek() 
		{
			P = new Punt(100, 100);
			P.tekenPunt(10, 0xff0000);
			P.sleepPunt();

			
			Q = new Punt(500, 100);
			Q.tekenPunt(10, 0x00ff00);
			Q.sleepPunt();
			
			R = new Punt(400, 500);
			R.tekenPunt(10, 0x0000ff);
			R.sleepPunt();
			
			driehoek = new Driehoek(P, Q, R);
			driehoek.tekenDriehoek();
			addChild(driehoek);
			
			addChild(P);
			addChild(Q);
			addChild(R);
			
			P.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			Q.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			R.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			
			P.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			Q.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			R.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
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
			driehoek.setDriehoek(P, Q, R);
		}
		
	}

}
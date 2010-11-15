package toepassingen.punten 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.objecten.LijnStuk;
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class LijnStukTekenen extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var l:LijnStuk;
		
		public function LijnStukTekenen() 
		{
			P = new Punt(300, 100);
			P.tekenPunt();
			P.sleepPunt();
			
			Q = new Punt( -300, -200);
			Q.tekenPunt(10, 0x0000ff);
			Q.sleepPunt();

			
			l = new LijnStuk(P, Q);
			l.tekenLijnStuk();
			rooster.addChild(l);
			
			rooster.addChild(P);
			rooster.addChild(Q);
			
			P.addEventListener(Punt.START_SLEEP, startUpdate);
			P.addEventListener(Punt.STOP_SLEEP, stopUpdate);
			
			Q.addEventListener(Punt.START_SLEEP, startUpdate);
			Q.addEventListener(Punt.STOP_SLEEP, stopUpdate);
			

		}
		
		private function update(e:Event):void
		{
			l.tekenLijnStuk();
		}
		
		private function startUpdate(e:Event):void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function stopUpdate(e:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
	}

}
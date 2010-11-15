package toepassingen.punten 
{
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.objecten.LijnStuk;
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TelenLijnstuk extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var l:LijnStuk;
		
		public function TelenLijnstuk() 
		{
			P = new Punt(200, 100);
			Q = new Punt( -300, -50);
			P.tekenPunt();
			Q.tekenPunt();
			P.sleepPunt();
			Q.sleepPunt();
			
			rooster.addChild(P);
			rooster.addChild(Q);
			
			l = new LijnStuk(P, Q);
			l.tekenLijnStuk();
			rooster.addChild(l);
			
			
			P.addEventListener(Punt.PUNT_SLEEP, startUpdate);
			Q.addEventListener(Punt.PUNT_SLEEP, startUpdate);
			P.addEventListener(Punt.PUNT_STOP, stopUpdate);
			Q.addEventListener(Punt.PUNT_STOP, stopUpdate);
		}
		
		private function startUpdate(e:Event):void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function stopUpdate(e:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			l.tekenLijnStuk();
		}
		
	}

}
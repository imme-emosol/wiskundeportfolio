package toepassingen.hoeken 
{
	import flash.events.Event;
	import flash.events.TextEvent;
	import wiskunde.assets.Basis;
	import wiskunde.assets.Pijl;
	import wiskunde.objecten.Hoek;
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class PijlWijzer extends Basis
	{
		public var pijl:Pijl;
		public var P:Punt;
		public var Q:Punt;
		public var hoek:Hoek;
		
		public function PijlWijzer() 
		{
			hoek = new Hoek(20, true);
			pijl = new Pijl();
			pijl.tekenPijl(100, 0x191977);
			rooster.addChild(pijl);
			
			P = new Punt(0, 0);
			P.tekenPunt(10, 0x191970);
			rooster.addChild(P);
			
			Q = new Punt(200, 200);
			Q.tekenPunt(10, 0xff0000);
			rooster.addChild(Q);
			
			Q.sleepPunt();
			Q.addEventListener(Punt.PUNT_SLEEP, updateStart);
			update(null);
		}
		
		private function updateStart(e:Event):void
		{
			addEventListener(Event.ENTER_FRAME, update);
			Q.addEventListener(Punt.PUNT_STOP, updateStop);
		}
		
		private function update(e:Event):void
		{
			hoek.radialen = Math.atan2(Q.y, Q.x);
			pijl.rotation = hoek.graden + 90;
		}
		
		private function updateStop(e:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
	}

}
package toepassingen.punten 
{
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TekenPunt extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var R:Punt;
		
		public var outputP:OutputBox;
		
		public function TekenPunt() 
		{
			P = new Punt(100, 100);
			P.tekenPunt(10, 0x0000ff);
			P.sleepPunt();
			rooster.addChild(P);
			
			outputP = new OutputBox(0, 0, "coord P");
			
			
			
			addChild(outputP);
			
			Q = new Punt( -100, -100);
			Q.tekenPunt(10, 0x00ff00);
			Q.sleepPunt();
			rooster.addChild(Q);
			
			R = new Punt( -100, 100);
			R.tekenPunt();
			R.sleepPunt();
			rooster.addChild(R);
			P.addEventListener(Punt.PUNT_SLEEP, starten);
			P.addEventListener(Punt.PUNT_STOP, stoppen);
			
		}
		
		private function starten(e:Event):void
		{
			addEventListener(Event.ENTER_FRAME, update);
			trace('punt is gestart');
		}
		
		private function stoppen(e:Event):void
		{
			trace('punt is gestopt');
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			
			outputP.box.text = String(P.x) + " " + String(P.y);
		}
		
	}

}
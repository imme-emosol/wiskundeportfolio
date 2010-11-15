package toepassingen.punten 
{
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.PuntOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TweePunten extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var afstand:Number;
		public var afstandBox:OutputBox;
		
		public function TweePunten() 
		{
			P = new Punt(100, 100);
			Q = new Punt ( -200, -100);
			
			P.tekenPunt(10, 0xff0000);
			Q.tekenPunt(10, 0x0000ff);
			
			P.sleepPunt();
			Q.sleepPunt();
			
			rooster.addChild(P);
			rooster.addChild(Q);
			
			afstand = PuntOperaties.afstand(P, Q);
			afstandBox = new OutputBox(0, 0, String(GetalOperaties.afronding(afstand,1)));
			addChild(afstandBox);
			
			P.addEventListener(Punt.START_SLEEP, startUpdate);
			P.addEventListener(Punt.STOP_SLEEP, stopUpdate);
			
			Q.addEventListener(Punt.START_SLEEP, startUpdate);
			Q.addEventListener(Punt.STOP_SLEEP, stopUpdate);
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
			afstand = PuntOperaties.afstand(P, Q);
			afstandBox.box.text = String(GetalOperaties.afronding(afstand, 1));
		}
	}

}
package toepassingen.lijnen 
{
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Lijn;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.LijnOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class LijnDoorTweePunten extends Basis
	{
		public var l:Lijn;
		public var P:Punt;
		public var Q:Punt;
		
		public var aBox:OutputBox;
		public var bBox:OutputBox;
		public var cBox:OutputBox;
		
		public function LijnDoorTweePunten() 
		{
			aBox = new OutputBox(0, 0, 'a');
			bBox = new OutputBox(140, 0, 'b');
			cBox = new OutputBox(280, 0, 'c');
			
			addChild(aBox);
			addChild(bBox);
			addChild(cBox);
			
			
			P = new Punt(100, -100);
			Q = new Punt( -20, 160);
			
			l = LijnOperaties.lijnDoorTweePunten(P, Q);
			
			P.tekenPunt(10, 0xff0000);
			Q.tekenPunt(10, 0x0000ff);
			
			l.tekenLijn();
			rooster.addChild(l);
			
			rooster.addChild(P);
			rooster.addChild(Q);
			
			P.sleepPunt();
			Q.sleepPunt();
			
			P.addEventListener(Punt.PUNT_SLEEP, startUpdate);
			Q.addEventListener(Punt.PUNT_SLEEP, startUpdate);
			
			P.addEventListener(Punt.PUNT_STOP, stopUpdate);
			Q.addEventListener(Punt.PUNT_STOP, stopUpdate);
			
			update(null);
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
			var hulpLijn:Lijn = LijnOperaties.lijnDoorTweePunten(P,Q);
			l.setLijn(hulpLijn.a, hulpLijn.b, hulpLijn.c);
			l.tekenLijn();
			
			aBox.box.text = String(GetalOperaties.afronding(l.a,0));
			bBox.box.text = String(GetalOperaties.afronding(l.b,0));
			cBox.box.text = String(GetalOperaties.afronding(l.c,0));

			
		}
		
	}

}
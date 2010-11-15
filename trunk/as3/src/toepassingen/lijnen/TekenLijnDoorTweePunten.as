package toepassingen.lijnen 
{
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Lijn;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.LijnOperatie;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TekenLijnDoorTweePunten extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var l:Lijn;
		
		public var aBox:OutputBox;
		public var bBox:OutputBox;
		public var cBox:OutputBox;
		
		public function TekenLijnDoorTweePunten() 
		{
			aBox = new OutputBox(0, 0, 'a');
			bBox = new OutputBox(140, 0, 'b');
			cBox = new OutputBox(280, 0, 'c');
			
			addChild(aBox);
			addChild(bBox);
			addChild(cBox);
			
			
			P = new Punt(100, -100);
			Q = new Punt( -20, 160);
			l = LijnOperatie.lijnDoorTweePunten(P, Q);
			
			P.tekenPunt(10,0xff0000);
			Q.tekenPunt(10,0x0000ff);
			l.tekenLijn();
			
			P.sleepPunt();
			Q.sleepPunt();
			
			rooster.addChild(l);
			rooster.addChild(P);
			rooster.addChild(Q);
			
			P.addEventListener(Punt.START_SLEEP, beginUpdate);
			Q.addEventListener(Punt.START_SLEEP, beginUpdate);
			
			P.addEventListener(Punt.STOP_SLEEP, stopUpdate);
			Q.addEventListener(Punt.STOP_SLEEP, stopUpdate);
			
			update(null);
		}
		
		private function beginUpdate(e:Event):void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function stopUpdate(e:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			var m:Lijn = LijnOperatie.lijnDoorTweePunten(P, Q);
			l.setLijn(m.a, m.b, m.c);
			l.tekenLijn();
			aBox.box.text = String(GetalOperaties.afronding(l.a,0));
			bBox.box.text = String(GetalOperaties.afronding(l.b,0));
			cBox.box.text = String(GetalOperaties.afronding(l.c,0));
		}
		
	}

}
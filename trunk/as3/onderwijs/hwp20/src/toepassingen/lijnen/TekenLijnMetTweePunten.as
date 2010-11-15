package toepassingen.lijnen 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.assets.Rooster;
	import wiskunde.assets.Basis;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.LijnOperaties;
	import wiskunde.objecten.Lijn
	import wiskunde.assets.OutputBox;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TekenLijnMetTweePunten extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var l:Lijn;
		public var a:OutputBox;
		public var b:OutputBox;
		public var c:OutputBox;

		
		public function TekenLijnMetTweePunten() 
		{
			P = new Punt(100, 100);
			Q = new Punt(200, 200);
			P.tekenPunt(10,0xffff00);
			Q.tekenPunt(10, 0x00ff00);

			
			l = new Lijn(NaN,NaN,NaN);
			LijnOperaties.lijnDoorTweePunten(l, P, Q);
			l.tekenLijn();
			rooster.addChild(l);
			
			rooster.addChild(P);
			rooster.addChild(Q);
			
			P.sleepPunt();
			Q.sleepPunt();
			
			P.addEventListener(MouseEvent.MOUSE_DOWN, startUpdate);
			Q.addEventListener(MouseEvent.MOUSE_DOWN, startUpdate);
			
			P.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			Q.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			
			a = new OutputBox(540, 0, 'a');
			b = new OutputBox(680, 0, 'b');
			c = new OutputBox(820, 0, 'c');
			
			addChild(a);
			addChild(b);
			addChild(c);
			
			update(null);
			//plaats de grafiek bovenaan in de display lijsts
			//setChildIndex(rooster,numChildren-1);
		}
		
		private function startUpdate(e:MouseEvent):void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function stopUpdate(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			LijnOperaties.lijnDoorTweePunten(l, P, Q);
			l.tekenLijn();
			
			a.box.text = String(GetalOperaties.afronding(l.a,0));
			b.box.text = String(GetalOperaties.afronding(l.b,0));
			c.box.text = String(GetalOperaties.afronding(l.c, 0));		
		}
		
	}

}
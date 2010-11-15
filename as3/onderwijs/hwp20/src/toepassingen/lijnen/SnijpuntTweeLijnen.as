package toepassingen.lijnen 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.assets.Basis;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.LijnOperaties;
	import wiskunde.objecten.Lijn
	import wiskunde.assets.OutputBox;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.LogischeOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class SnijpuntTweeLijnen extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var R:Punt;
		public var S:Punt;
		public var snijpunt:Punt
		public var l:Lijn;
		public var m:Lijn;
		public var xb:OutputBox;
		public var yb:OutputBox;

		
		public function SnijpuntTweeLijnen() 
		{	
			P = new Punt(100, 100);
			Q = new Punt(-200, -200);
			R = new Punt(-100, 200);
			S = new Punt( 200, -200);

			
			P.tekenPunt(10,0xffff00);
			Q.tekenPunt(10, 0x00ff00);
			R.tekenPunt(10, 0xff0000);
			S.tekenPunt(10, 0x0000ff);

			
			l = new Lijn(NaN,NaN,NaN);
			LijnOperaties.lijnDoorTweePunten(l, P, Q);
			l.tekenLijn();
			rooster.addChild(l);
			
			m = new Lijn(NaN, NaN, NaN);
			l.kleur = 0x0000ff;
			LijnOperaties.lijnDoorTweePunten(m, R, S);
			m.tekenLijn();
			rooster.addChild(m);
			
			rooster.addChild(P);
			rooster.addChild(Q);
			rooster.addChild(R);
			rooster.addChild(S);
			
			P.sleepPunt();
			Q.sleepPunt();
			R.sleepPunt();
			S.sleepPunt();
			
			snijpunt = new Punt(0, 0);
			LijnOperaties.snijpunt(snijpunt, l, m);
			snijpunt.tekenPunt(5, 0xffffff);
			rooster.addChild(snijpunt);
			
			
			P.addEventListener(MouseEvent.MOUSE_DOWN, startUpdate);
			Q.addEventListener(MouseEvent.MOUSE_DOWN, startUpdate);
			R.addEventListener(MouseEvent.MOUSE_DOWN, startUpdate);
			S.addEventListener(MouseEvent.MOUSE_DOWN, startUpdate);
			
			P.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			Q.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			R.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			S.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			
			xb = new OutputBox(680, 0, 'snijpunt.x');
			yb = new OutputBox(820, 0, 'snijpunt.y');
			
			
			addChild(xb);
			addChild(yb);
			
			update(null);
			
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
			
			LijnOperaties.lijnDoorTweePunten(m, R, S);
			m.tekenLijn();
			
			LijnOperaties.snijpunt(snijpunt, l, m);
			
			if (LogischeOperaties.of(Math.abs(snijpunt.x) < 9999,Math.abs(snijpunt.y)<9999) )
			{
				xb.box.text = String(GetalOperaties.afronding(snijpunt.x, 0));
				yb.box.text = String(GetalOperaties.afronding(snijpunt.y, 0));	
			}
			else
			{
				xb.box.text = "∞";
				yb.box.text = "∞";
			}
			
					
		}
		
	}

}
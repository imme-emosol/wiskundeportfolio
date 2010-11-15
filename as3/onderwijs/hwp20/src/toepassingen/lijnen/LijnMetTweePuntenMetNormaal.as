package toepassingen.lijnen 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.assets.Basis;
	import wiskunde.objecten.Punt;
	import wiskunde.objecten.WVector;
	import wiskunde.operaties.VectorOperaties;
	import wiskunde.objecten.Lijn
	import wiskunde.assets.OutputBox;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class LijnMetTweePuntenMetNormaal extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var v:WVector;
		public var normaal:WVector;
		public var l:Lijn;
		public var a:OutputBox;
		public var b:OutputBox;
		public var c:OutputBox;

		
		public function LijnMetTweePuntenMetNormaal() 
		{
			P = new Punt(-100, -100);
			Q = new Punt(100, 100);
			P.tekenPunt(10,0xffff00);
			Q.tekenPunt(10, 0x00ff00);
		
			v = new WVector(Q.x - P.x, Q.y - P.y);
			normaal = VectorOperaties.normaliseren(v);
			normaal.teken(100, 0x0000ff);
			rooster.addChild(normaal);
			v.teken(1, 0x0000ff);
			v.x = normaal.x = P.x;
			v.y = normaal.y = P.y;
			rooster.addChild(v);
			
			l = new Lijn(normaal.dx, normaal.dy, NaN);
			l.berekenC(P);
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
			v.setVector(Q.x - P.x, Q.y - P.y);
			var tmp:WVector = VectorOperaties.normaliseren(v);
			normaal.setVector(tmp.dx, tmp.dy);
			v.x = normaal.x = P.x;
			v.y = normaal.y = P.y;
			l.setLijn(normaal.dx, normaal.dy, NaN);
			l.berekenC(P);
			l.tekenLijn();
			
			a.box.text = String(GetalOperaties.afronding(l.a,3));
			b.box.text = String(GetalOperaties.afronding(l.b,3));
			c.box.text = String(GetalOperaties.afronding(l.c, 1));			
		}
		
	}

}
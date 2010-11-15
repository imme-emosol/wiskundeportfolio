package toepassingen.lijnen  
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.assets.Basis;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Punt;
	import wiskunde.objecten.Lijn;
	import wiskunde.operaties.LijnOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class LoodlijnOpLijnDoorPunt extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var punt:Punt;
		
		public var P_:Punt;
		public var Q_:Punt;
		public var punt_:Punt
		public var l:Lijn;
		public var loodLijn:Lijn;
		
		public var laBox:OutputBox;
		public var lbBox:OutputBox;
		public var lcBox:OutputBox;
		
		public var loodlijnABox:OutputBox;
		public var loodlijnBBox:OutputBox;
		public var loodlijnCBox:OutputBox;
		
		
		public function LoodlijnOpLijnDoorPunt() 
		{
			
			P = new Punt(100, 100);
			Q = new Punt (-100, -100); 
			
			P.tekenPunt(10, 0x0000ff);
			Q.tekenPunt(10, 0x0000ff);
			P.sleepPunt();
			Q.sleepPunt();

			l = new Lijn( -1, 1, 0);
			LijnOperaties.lijnDoorTweePunten(l, P, Q);
			l.tekenLijn();
			l.kleur = 0x0000ff;
			rooster.addChild(l);
			
			punt = new Punt(200, 100);
			punt.tekenPunt(10, 0xff0000);
			punt.sleepPunt();	

			loodLijn= new Lijn(NaN,NaN,NaN);
			LijnOperaties.loodlijn(punt, l, loodLijn);
			loodLijn.tekenLijn();
			rooster.addChild(loodLijn);

			laBox = new OutputBox(540, 0, 'lijn a');
			lbBox = new OutputBox(680, 0, 'lijn b');
			lcBox = new OutputBox(820, 0, 'lijn c');
			
			loodlijnABox = new OutputBox(0,540, "loodlijn a");
			loodlijnBBox = new OutputBox(140,540, "loodlijn b");
			loodlijnCBox = new OutputBox(280,540, "loodlijn c");
			loodlijnABox.box.text = String(loodLijn.a);
			loodlijnBBox.box.text = String(loodLijn.b);
			loodlijnCBox.box.text = String(loodLijn.c);
			
			addChild(laBox);
			addChild(lbBox);
			addChild(lcBox);
			
			addChild(loodlijnABox);
			addChild(loodlijnBBox);
			addChild(loodlijnCBox);
			
			
			rooster.addChild(P);
			rooster.addChild(Q);
			rooster.addChild(punt);
			
			P.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			Q.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			punt.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);

			P.addEventListener(MouseEvent.MOUSE_UP,stopUpdate);
			Q.addEventListener(MouseEvent.MOUSE_UP,stopUpdate);
			punt.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			
			update(null);
		}
		
		private function updateLijn(e:Event):void
		{
			l.setLijn(Number(laBox.box.text), Number(lbBox.box.text), Number(lcBox.box.text));
			l.tekenLijn();
			update(null);
			//loodlijnABox.box.text = String(loodLijn.a);
			//loodlijnBBox.box.text = String(loodLijn.b);
			//loodlijnCBox.box.text = String(Math.round(loodLijn.c));

		}
		
		private function beginUpdate(e:MouseEvent):void
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
			
			LijnOperaties.loodlijn(punt, l, loodLijn);
			loodLijn.tekenLijn();
			loodlijnABox.box.text = String(Math.round(loodLijn.a));
			loodlijnBBox.box.text = String(Math.round(loodLijn.b));
			loodlijnCBox.box.text = String(Math.round(loodLijn.c));
			
			laBox.box.text = String(Math.round(l.a));
			lbBox.box.text = String(Math.round(l.b));
			lcBox.box.text = String(Math.round(l.c));
		}
			
	}

}
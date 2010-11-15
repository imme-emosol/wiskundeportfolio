package toepassingen.punten 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.assets.Basis;
	import wiskunde.assets.OutputBox;
	import wiskunde.assets.VerhoudingBox;
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.LijnStuk;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.BreukOperaties;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.PuntOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class tekenLijnstuk extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var R:Punt;
		public var S:Punt;
		
		public var LS:LijnStuk;
		public var DX:LijnStuk;
		public var DY:LijnStuk;
		public var DX1:LijnStuk;
		public var DY1:LijnStuk;
		
		public var dxBox:OutputBox;
		public var dyBox:OutputBox;
		public var dsBox:OutputBox;
		public var hoekBox:OutputBox;
		
		public var bvBox:VerhoudingBox;
		public var bv:Breuk;
		
		
		public function tekenLijnstuk() 
		{
			dxBox = new OutputBox(860, 0, 100, 'dx')
			dyBox = new OutputBox(860, 80, 100, 'dy')
			dsBox = new OutputBox(860, 160, 100, 'ds')
			hoekBox = new OutputBox(860, 240, 100, 'hoek (graden)')
			bvBox = new VerhoudingBox(820,530,"aspect ratio",20,0x0092bc);
			
			addChild(dxBox);
			addChild(dyBox);
			addChild(dsBox);
			addChild(hoekBox);
			addChild(bvBox);
			
			P = new Punt(100, 100);
			Q = new Punt( -100, -100);
			R = new Punt(P.x, Q.y);
			S = new Punt(Q.x, P.y);
			
			P.tekenPunt(10,0x0000ff);
			Q.tekenPunt(10, 0xffff00);
			R.tekenPunt(2, 0xffffff);
			S.tekenPunt(2, 0xffffff);
			
			
			P.sleepPunt();
			Q.sleepPunt();
			

			
			LS = new LijnStuk(P, Q);
			LS.lijnKleur = 0x006600;
			LS.lijnDikte = 5;
			LS.tekenLijnStuk();
			rooster.addChild(LS);
			
			DY = new LijnStuk(P, R);
			DX = new LijnStuk(Q, R);
			DY.lijnDikte = 2;
			DX.lijnDikte = 2;
			DY.lijnKleur = 0x0000ff;
			DX.lijnKleur = 0xff0000;
			DY.tekenLijnStuk();
			DX.tekenLijnStuk();
			
			DY1 = new LijnStuk(P, S);
			DX1 = new LijnStuk(Q, S);
			DY1.lijnDikte = 2;
			DX1.lijnDikte = 2;
			DY1.lijnKleur = 0xff0000;
			DX1.lijnKleur = 0x0000ff;
			DY1.tekenLijnStuk();
			DX1.tekenLijnStuk();
			
			
			rooster.addChild(DX);
			rooster.addChild(DY);
			rooster.addChild(DX1);
			rooster.addChild(DY1);
			
			rooster.addChild(P);
			rooster.addChild(Q);
			rooster.addChild(R);
			rooster.addChild(S);
			
			P.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			Q.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			
			P.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			Q.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			update(null);
			
		}
		
		public function beginUpdate(e:MouseEvent):void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function stopUpdate(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void
		{
			R.setPunt(P.x, Q.y);
			S.setPunt(Q.x, P.y);
			LS.tekenLijnStuk();
			DX.tekenLijnStuk();
			DY.tekenLijnStuk();
			DY1.tekenLijnStuk();
			DX1.tekenLijnStuk();
			
			dxBox.setWaarde(Math.round(PuntOperaties.dx(P,Q)));
			dyBox.setWaarde(Math.round(PuntOperaties.dy(P,Q)));
			dsBox.setWaarde(Math.round(PuntOperaties.ds(P,Q)));
			hoekBox.setWaarde(GetalOperaties.afronding(PuntOperaties.hoek(P, Q).graden,1));
			
			bv = new Breuk(Math.round(PuntOperaties.dx(P,Q)), Math.round(PuntOperaties.dy(P,Q)));
			bv = BreukOperaties.vereenvoudigen(bv);
			bvBox.setVerhouding(bv.teller, bv.noemer);
		}
		
	}

}
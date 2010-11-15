package toepassingen.lijnen
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.assets.Basis;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Punt;
	import wiskunde.objecten.WMatrix;
	import wiskunde.objecten.WVector;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.objecten.Lijn
	import wiskunde.operaties.LijnOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class HessiaanseNormaalVormLijn extends Basis
	{
		public var l:Lijn;
		public var aBox:OutputBox;
		public var bBox:OutputBox;
		public var cBox:OutputBox;
		public var rBox:OutputBox;
		public var P:Punt;
		public var hessiaan:Array;
		public var n:WVector;
		public var r:Number;
		public var nMatrix:WMatrix;
		
		public function HessiaanseNormaalVormLijn() 
		{
			aBox = new OutputBox(540, 0, 'a ');
			bBox = new OutputBox(680, 0, 'b');
			cBox = new OutputBox(820, 0, 'c');
			rBox = new OutputBox(0, 540, 'r');
			nMatrix = new WMatrix(2,1);
			nMatrix.x = 200;
			nMatrix.y = 540;
			addChild(nMatrix);
			
			addChild(aBox);
			addChild(bBox);
			addChild(cBox);
			addChild(rBox);
			
			P = new Punt(100, 100);
			P.tekenPunt(10, 0xffff00);
			P.sleepPunt();
			
			
			hessiaan = LijnOperaties.hessiaanseNormaalVorm(P);
			n = hessiaan[0];
			r = hessiaan[1];

			nMatrix.setWaarde(1,1, GetalOperaties.afronding(n.dx,3));
			nMatrix.setWaarde(2,1, GetalOperaties.afronding(n.dy,3));
	
		
			n.teken(100, 0x000000);
			rooster.addChild(n);
			
			l = new Lijn(n.dx,n.dy,r)
			l.tekenLijn();
			rooster.addChild(l);
			l.setLijn(1, 2, 3);
		
			
			rooster.addChild(P);
			
			P.addEventListener(MouseEvent.MOUSE_DOWN, startSlepen);
			P.addEventListener(MouseEvent.MOUSE_UP, stopSlepen);
			
			update(null);
			
		}
		
		
		public function startSlepen(e:MouseEvent):void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function stopSlepen(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		
		public function update(e:Event):void
		{
			hessiaan = LijnOperaties.hessiaanseNormaalVorm(P);
			var tmp:WVector = hessiaan[0];
			n.setVector(tmp.dx, tmp.dy);
			r = hessiaan[1];
			l.setLijn(n.dx, n.dy, r);
			aBox.box.text = String(GetalOperaties.afronding(l.a,3));
			bBox.box.text = String(GetalOperaties.afronding(l.b,3));
			cBox.box.text = String(GetalOperaties.afronding(l.c, 0));
			rBox.box.text = String(GetalOperaties.afronding(r, 0));
			
			nMatrix.setWaarde(1,1, GetalOperaties.afronding(n.dx,3));
			nMatrix.setWaarde(2, 1, GetalOperaties.afronding(n.dy, 3));
		}
		
	}

}
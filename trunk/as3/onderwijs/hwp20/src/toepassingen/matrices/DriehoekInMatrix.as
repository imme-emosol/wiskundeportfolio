package toepassingen.matrices 
{
	import wiskunde.assets.Basis;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.objecten.Driehoek;
	import wiskunde.objecten.Lijn;
	import wiskunde.objecten.Punt;
	import wiskunde.objecten.WMatrix;
	import wiskunde.operaties.LijnOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class DriehoekInMatrix extends Basis
	{
		public var m:WMatrix;
		public var pq:Lijn;
		public var qr:Lijn;
		public var rp:Lijn;
		public var PQR:Driehoek;
		public var P:Punt;
		public var Q:Punt;
		public var R:Punt;
		

		public function DriehoekInMatrix() 
		{

			
			P = new Punt(-200, 200);
			R = new Punt(-100, -250);
			Q = new Punt(250, -200);
			
			P.tekenPunt(10, 0xff0000);
			Q.tekenPunt(10, 0x00ff00);
			R.tekenPunt(10, 0x0000ff);
			
			P.sleepPunt();
			Q.sleepPunt();
			R.sleepPunt();
			
			PQR = new Driehoek(P, Q, R);
			PQR.tekenDriehoek();
			rooster.addChild(PQR);
			
			m = new WMatrix(3, 3);
			
			m.tekenKader();
			
			pq = new Lijn();
			qr = new Lijn();
			rp = new Lijn();
			LijnOperaties.lijnDoorTweePunten(pq, P, Q);
			LijnOperaties.lijnDoorTweePunten(qr, Q, R);
			LijnOperaties.lijnDoorTweePunten(rp, R, P);

			
			//LijnOperaties.normeren(pq);
			//LijnOperaties.normeren(qr);
			//LijnOperaties.normeren(rp);
			
			pq.tekenLijn();
			qr.tekenLijn();
			rp.tekenLijn();
			pq.alpha = qr.alpha = rp.alpha = 0.4;
			
			rooster.addChild(pq);
			rooster.addChild(qr);
			rooster.addChild(rp);
			
			addChild(m);
			
			m.x = 660;
			m.y = 20;
			m.voerRijIn(1, new Array(pq.a, pq.b, pq.c),3);
			m.voerRijIn(2, new Array(qr.a, qr.b, qr.c),3);
			m.voerRijIn(3, new Array(rp.a, rp.b, rp.c),3);
			
			
			rooster.addChild(P);
			rooster.addChild(Q);
			rooster.addChild(R);
			
			P.addEventListener(MouseEvent.MOUSE_DOWN,beginUpdate);
			Q.addEventListener(MouseEvent.MOUSE_DOWN,beginUpdate);
			R.addEventListener(MouseEvent.MOUSE_DOWN,beginUpdate);
			
			P.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			Q.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			R.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			stage.addEventListener(WMatrix.MATRIX_UPDATE, updateMatrix);
			var g:Array = m.geefKolom(1);
			//trace(g.toString());
		}
		
		private function updateMatrix(e:Event):void
		{
			trace(m.matrix[0]);
			pq.setLijn(m.matrix[0][0], m.matrix[0][1], m.matrix[0][2]);
			qr.setLijn(m.matrix[1][0], m.matrix[1][1], m.matrix[1][2]);
			rp.setLijn(m.matrix[2][0], m.matrix[2][1], m.matrix[2][2]);
			
			LijnOperaties.snijpunt(P, pq, rp);
			LijnOperaties.snijpunt(Q, pq, qr);
			LijnOperaties.snijpunt(R, rp, qr);
		
			PQR.setDriehoek(P,Q,R);
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
			
			LijnOperaties.lijnDoorTweePunten(pq, P, Q);
			//LijnOperaties.normeren(pq);
			pq.tekenLijn();
			
			LijnOperaties.lijnDoorTweePunten(qr, Q, R);
			//LijnOperaties.normeren(qr);
			qr.tekenLijn();
			
			LijnOperaties.lijnDoorTweePunten(rp, R, P);
			//LijnOperaties.normeren(rp);
			rp.tekenLijn();
			
			PQR.setDriehoek(P, Q, R);
			
			m.voerRijIn(1, new Array(pq.a, pq.b, pq.c),0);
			m.voerRijIn(2, new Array(qr.a, qr.b, qr.c),0);
			m.voerRijIn(3, new Array(rp.a, rp.b, rp.c),0);
		}
		

		
	}

}
package toepassingen.matrices 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.assets.Basis;
	import wiskunde.objecten.Driehoek;
	import wiskunde.objecten.Punt;
	import wiskunde.objecten.WMatrix;
	import wiskunde.operaties.MatrixOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class DriehoekMetTransformatieMatrix extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var R:Punt;
		public var PQR:Driehoek;
		
		public var p:Punt;
		public var q:Punt;
		public var r:Punt;
		public var pqr:Driehoek;
		
		public var matrix:WMatrix;
		public var vector_p:WMatrix;
		public var vector_q:WMatrix;
		public var vector_r:WMatrix;
		
		public var transf_p:WMatrix;
		public var transf_q:WMatrix;
		public var transf_r:WMatrix;
		
		public function DriehoekMetTransformatieMatrix() 
		{
			matrix = new WMatrix(3, 3);
			matrix.voerRijIn(1, new Array(2, 0, 0));
			matrix.voerRijIn(2, new Array(0, 2, 0));
			matrix.voerRijIn(3, new Array(0, 0, 1));
			matrix.tekenKader();
			matrix.x = 20;
			matrix.y = 30;
			addChild(matrix);
			

			
			P = new Punt(100, 100);
			Q= new Punt(-60, 100);
			R = new Punt(100, -60);
			
			vector_p = new WMatrix(3, 1);
			vector_p.setWaarde(1, 1, P.x);
			vector_p.setWaarde(2, 1, P.y);
			vector_p.setWaarde(3, 1, 1);
			
			vector_q = new WMatrix(3, 1);
			vector_q.setWaarde(1, 1, Q.x);
			vector_q.setWaarde(2, 1, Q.y);
			vector_q.setWaarde(3, 1, 1);
			
			vector_r = new WMatrix(3, 1);
			vector_r.setWaarde(1, 1, R.x);
			vector_r.setWaarde(2, 1, R.y);
			vector_r.setWaarde(3, 1, 1);
			
			transf_p = MatrixOperaties.product(matrix, vector_p);
			transf_q = MatrixOperaties.product(matrix, vector_q);
			transf_r = MatrixOperaties.product(matrix, vector_r);
			
			P.tekenPunt(10, 0xff0000);
			Q.tekenPunt(10, 0x00ff00);
			R.tekenPunt(10, 0x0000ff);
			
			P.sleepPunt();
			Q.sleepPunt();
			R.sleepPunt();
			
			PQR = new Driehoek(P, Q, R);
			PQR.tekenDriehoek();
			rooster.addChild(PQR);
			

			
			trace(transf_p.matrix[0][0], transf_p.matrix[1][0]);
			p = new Punt(transf_p.matrix[0][0],transf_p.matrix[1][0]);
			q = new Punt(transf_q.matrix[0][0],transf_q.matrix[1][0]);
			r = new Punt(transf_r.matrix[0][0],transf_r.matrix[1][0]);
			
			p.tekenPunt(5, 0xff0000);
			q.tekenPunt(5, 0x00ff00);
			r.tekenPunt(5, 0x0000ff);
			
			p.alpha = 0.4;
			q.alpha = 0.4;
			r.alpha = 0.4;
			
			
			pqr = new Driehoek(p, q, r);
			pqr.alpha = 0.4;
			pqr.tekenDriehoek(0xff0000);
			rooster.addChild(pqr);
			
			rooster.addChild(p);
			rooster.addChild(q);
			rooster.addChild(r);
			
			rooster.addChild(P);
			rooster.addChild(Q);
			rooster.addChild(R);
			
			P.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			Q.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			R.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			
			P.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			Q.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			R.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			stage.addEventListener(WMatrix.MATRIX_UPDATE, update);
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
			PQR.setDriehoek(P, Q, R);
						vector_p = new WMatrix(3, 1);
			vector_p.setWaarde(1, 1, P.x);
			vector_p.setWaarde(2, 1, P.y);
			vector_p.setWaarde(3, 1, 1);
			
			vector_q = new WMatrix(3, 1);
			vector_q.setWaarde(1, 1, Q.x);
			vector_q.setWaarde(2, 1, Q.y);
			vector_q.setWaarde(3, 1, 1);
			
			vector_r = new WMatrix(3, 1);
			vector_r.setWaarde(1, 1, R.x);
			vector_r.setWaarde(2, 1, R.y);
			vector_r.setWaarde(3, 1, 1);
			
			transf_p = MatrixOperaties.product(matrix, vector_p);
			transf_q = MatrixOperaties.product(matrix, vector_q);
			transf_r = MatrixOperaties.product(matrix, vector_r);
			
			p.setPunt(transf_p.matrix[0][0],transf_p.matrix[1][0]);
			q.setPunt(transf_q.matrix[0][0],transf_q.matrix[1][0]);
			r.setPunt(transf_r.matrix[0][0], transf_r.matrix[1][0]);
			
			pqr.setDriehoek(p, q, r);
			pqr.tekenDriehoek(0xff0000);
			
		}
	}

}
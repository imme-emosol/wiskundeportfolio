package toepassingen.vectoren  
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.assets.Basis;
	import wiskunde.objecten.Punt;
	import wiskunde.objecten.Lijn;
	import wiskunde.objecten.WVector;
	import wiskunde.operaties.LijnOperaties;
	import wiskunde.operaties.VectorOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class VecorOntbindenOpLijn extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var R:Punt;
		
		public var l:Lijn;
	
		public var v:WVector;

		public var v_ew:WVector;
		public var v_lr:WVector;
		
		public var arr:Array;
		
		public function VecorOntbindenOpLijn() 
		{
			
			arr = new Array();
			
			P = new Punt(200, 200);
			Q = new Punt (-200, -200); 
			
			P.tekenPunt(10, 0xff0000);
			Q.tekenPunt(10, 0xff0000);
			P.sleepPunt();
			Q.sleepPunt();

			l = new Lijn();
			LijnOperaties.lijnDoorTweePunten(l, Q, P);
			l.kleur = 0x000000;
			l.tekenLijn();

			rooster.addChild(l);
			
			R = new Punt(300, -200);
			R.tekenPunt(10, 0x0000ff);
			R.sleepPunt();
			

			v = new WVector(NaN, NaN);
			VectorOperaties.maakVectorVanTweePunten(P, R, v);
			v.x = P.x;
			v.y = P.y;
			v.teken(1, 0x0000ff);
			rooster.addChild(v);
			
			arr = VectorOperaties.ontbindenOpLijn(l, v);
			
			v_ew = new WVector(arr[0], arr[1]);
			v_lr = new WVector(arr[2], arr[3]);
			
			v_ew.teken(1, 0xff0000);
			v_lr.teken(1, 0xff0000);
			
			v_ew.x = v_lr.x = P.x;
			v_ew.y = v_lr.y = P.y;
			
			rooster.addChild(v_ew);
			rooster.addChild(v_lr);
			
			
			rooster.addChild(P);
			rooster.addChild(Q);
			rooster.addChild(R);
			
			P.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			Q.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			R.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);

			P.addEventListener(MouseEvent.MOUSE_UP,stopUpdate);
			Q.addEventListener(MouseEvent.MOUSE_UP,stopUpdate);
			R.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			
			//update(null);
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

			v.setVector(NaN, NaN);
			VectorOperaties.maakVectorVanTweePunten(P, R, v);
			v.x = P.x;
			v.y = P.y;
			v.teken(1, 0x0000ff);
			
			arr = VectorOperaties.ontbindenOpLijn(l, v);
			v_ew.setVector(arr[0], arr[1]);
			v_lr.setVector(arr[2], arr[3]);
			v_ew.teken(1, 0xff0000);
			v_ew.teken(1, 0xff0000);
			v_ew.x = v_lr.x = P.x;
			v_ew.y = v_lr.y = P.y;
		}
			
	}

}
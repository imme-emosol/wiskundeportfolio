package toepassingen.punten 
{
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.PuntOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class AfstandPunten extends Basis
	{
		public var P:Punt;
		public var Q:Punt;

		public var afstand:Number;
		public var dx:Number;
		public var dy:Number;
		
		public var afstandBox:OutputBox;
		public var dxBox:OutputBox;
		public var dyBox:OutputBox;
		
		
		public function AfstandPunten() 
		{
			P = new Punt(100, 100);
			P.tekenPunt(10, 0xff0000);
			P.sleepPunt();
			rooster.addChild(P);
			
			Q = new Punt( -200, -100);
			Q.tekenPunt(10, 0x0000ff);
			Q.sleepPunt();
			rooster.addChild(Q);
			
			dxBox = new OutputBox (10, 10, "dx"); 
			dyBox = new OutputBox(160, 10, "dy");
			afstandBox = new OutputBox(310, 10, "afstand");
			
			addChild(dxBox);
			addChild(dyBox);
			addChild(afstandBox);
			
			P.addEventListener(Punt.PUNT_SLEEP, startUpdate);
			Q.addEventListener(Punt.PUNT_SLEEP, startUpdate);
			
			P.addEventListener(Punt.PUNT_STOP, stopUpdate);
			Q.addEventListener(Punt.PUNT_STOP, stopUpdate);
			update(null);
		}
		
		private function startUpdate(e:Event):void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function stopUpdate(e:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			dx = PuntOperaties.dx(P, Q);
			dy = PuntOperaties.dy(P, Q);
			afstand = GetalOperaties.pythagoras(dx, dy);
			
			dxBox.box.text = String(dx);
			dyBox.box.text = String(dy);
			afstandBox.box.text = String(GetalOperaties.afronding(afstand,1));
		}
		
	}

}
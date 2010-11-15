package toepassingen.punten 
{
	import wiskunde.assets.Basis;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class PuntTekenen extends Basis
	{
		public var P:Punt
		public var xCoordinaat:OutputBox;
		public var yCoordinaat:OutputBox;
		
		public function PuntTekenen() 
		{
			//setRooster(20, 0, 20, 0);
			
			xCoordinaat = new OutputBox(680, 0, 'x-coordinaat');
			yCoordinaat = new OutputBox(820, 0, 'y-coordinaat');
			
			addChild(xCoordinaat);
			addChild(yCoordinaat);
			
			P = new Punt(0, 0);
			P.tekenPunt(20, 0x0092BC , 0x000000);
			P.sleepPunt();
			rooster.addChild(P);
			P.addEventListener(MouseEvent.MOUSE_DOWN, startUpdate);
			P.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
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
			xCoordinaat.box.text = String(Math.round(P.x));		
			yCoordinaat.box.text = String(Math.round(P.y));		
		}
		
	}

}
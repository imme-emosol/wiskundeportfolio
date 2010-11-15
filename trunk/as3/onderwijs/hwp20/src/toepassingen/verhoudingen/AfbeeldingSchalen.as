package toepassingen.verhoudingen 
{
	import wiskunde.assets.Afbeelding
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import wiskunde.assets.Basis;
	import wiskunde.objecten.functies.LineaireFunctie;
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class AfbeeldingSchalen extends Basis
	{
		public var afb:Afbeelding;
		public var P:Punt;
		public var rc:Number;
		public var lf:LineaireFunctie;
		
		public function AfbeeldingSchalen() 
		{
			setRooster(0,0,0.4,20,20);
			afb = new Afbeelding(true);
			var url:String = "http://photo40.nl/fotos/bedrijf/conceptuele-fotografie-talent-wiskundige-formule-0745.jpg";
			afb.importeerAfbeelding(url);
			afb.addEventListener(Afbeelding.AFBEELDING_GELADEN, geladen);
			
		}
		
		private function geladen(e:Event):void
		{
			
			rc = afb.AR.noemer / afb.AR.teller;
			lf = new LineaireFunctie(rc, 0);
			rooster.addChild(lf.teken(0,960));
		
			afb.x =0;
			afb.y = 0;
			afb.alpha = 0.8;
			
			P = new Punt(afb.x + afb.width, afb.y + afb.height);
			P.tekenPunt(10, 0xff0000);
			

			rooster.addChild(afb);
			rooster.addChild(P);
			
			P.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			addEventListener(MouseEvent.MOUSE_UP, stopUpdate)
		}
		
		private function beginUpdate(e:Event):void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function stopUpdate(e:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			rc = afb.AR.noemer / afb.AR.teller;
			P.x = rooster.mouseX;
			P.y = rc * P.x;
			afb.width = P.x;
			afb.height = P.y;
		}
		
		
	}

}
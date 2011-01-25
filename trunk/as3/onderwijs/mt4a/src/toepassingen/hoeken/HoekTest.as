package toepassingen.hoeken 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Hoek;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class HoekTest extends Sprite
	{
		public var hoek:Hoek;
		public var ibGraden:InputBox;
		public var ibRadialen:InputBox;
		public var ibOmwentelingen:OutputBox;
		
		public function HoekTest() 
		{
			ibGraden = new InputBox(50, 50, "graden", 0);
			ibRadialen = new InputBox(250, 50, "radialen", 0);
			ibOmwentelingen = new OutputBox(450, 50, "omwentelingen");
			
			hoek = new Hoek(1,false);
			trace(hoek.graden, hoek.radialen, hoek.omwentelingen);
			
			hoek.graden = 1000;
			trace(hoek.graden, hoek.radialen, hoek.omwentelingen);
			
			addChild(ibGraden);
			addChild(ibRadialen);
			addChild(ibOmwentelingen);
			
			ibGraden.box.addEventListener(Event.CHANGE, updateRad);
			ibRadialen.box.addEventListener(Event.CHANGE, updateGrad);
			
		}
		
		private function updateRad(e:Event):void
		{
			hoek.graden = Number(ibGraden.box.text);
			ibRadialen.box.text = String(GetalOperaties.afronding(hoek.radialen,4));
			ibOmwentelingen.box.text = String(GetalOperaties.afronding(hoek.omwentelingen,4));
		}
		
		private function updateGrad(e:Event):void
		{
			hoek.radialen = Number(ibRadialen.box.text);
			ibGraden.box.text = String(GetalOperaties.afronding(hoek.graden, 1));
			ibOmwentelingen.box.text = String(GetalOperaties.afronding(hoek.omwentelingen,4));
		}
		
	}

}
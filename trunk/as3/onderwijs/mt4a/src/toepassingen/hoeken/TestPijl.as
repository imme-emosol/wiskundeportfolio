package toepassingen.hoeken 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Pijl;
	import wiskunde.assets.Pijl2;
	import wiskunde.objecten.Hoek;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.VerhoudingOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestPijl extends Sprite
	{
		public var pijl:Pijl2;
		public var hoek:Hoek;
		public var tijd:Date;
		
		public function TestPijl() 
		{
			
			
			pijl = new Pijl2(200);
			pijl.x = 480;
			pijl.y = 300;
			addChild(pijl);
			hoek = new Hoek(2);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			tijd = new Date();
			var seconden:Verhouding = new Verhouding(tijd.getSeconds(), 60);
			var sGraden:Verhouding = new Verhouding(VerhoudingOperaties.schaalDeeltal(seconden, 360), 360);
			trace(seconden.deeltal, sGraden.deeltal);
			pijl.rotation = sGraden.deeltal;
		}
		
	}

}
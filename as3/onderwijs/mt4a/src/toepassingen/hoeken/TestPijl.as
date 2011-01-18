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
		public var sPijl:Pijl2;
		public var mPijl:Pijl2;
		public var uPijl:Pijl2
		public var hoek:Hoek;
		public var tijd:Date;
		
		public function TestPijl() 
		{
			
			
			sPijl= new Pijl2(300);
			sPijl.x = 480;
			sPijl.y = 300;
				
			mPijl= new Pijl2(250,0x0000ff);
			mPijl.x = 480;
			mPijl.y = 300;

			uPijl= new Pijl2(200,0xff0000);
			uPijl.x = 480;
			uPijl.y = 300;
			
			
			addChild(sPijl);
			addChild(mPijl);
			addChild(uPijl);

			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			tijd = new Date();
			var seconden:Verhouding = new Verhouding(tijd.getSeconds(), 60);
			var sGraden:Verhouding = VerhoudingOperaties.schaalDeeltal(seconden, 360);
			sPijl.rotation = sGraden.deeltal;

			var minuten:Verhouding = new Verhouding(tijd.getMinutes(), 60);
			var mGraden:Verhouding = VerhoudingOperaties.schaalDeeltal(minuten, 360);
			mPijl.rotation = mGraden.deeltal;

			var uren:Verhouding =VerhoudingOperaties.optellen(new Verhouding(tijd.getHours(), 12),new Verhouding(tijd.getMinutes(), 720));
			var uGraden:Verhouding = VerhoudingOperaties.schaalDeeltal(uren, 360);
			uPijl.rotation = uGraden.deeltal;
			
			}
		
	}

}
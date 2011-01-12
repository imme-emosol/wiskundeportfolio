package toepassingen.hoeken 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Pijl;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class AnalogeKlok extends Sprite
	{
		public var tijd:Date;
		public var secondenWijzer:Pijl;
		
		public function AnalogeKlok() 
		{
			secondenWijzer = new Pijl();
			secondenWijzer.x = 480;
			secondenWijzer.y = 300;
			
			secondenWijzer.tekenPijl(300, 0x000000);
			addChild(secondenWijzer);
			
			secondenWijzer.rotation = 0;
			//addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			tijd = new Date();
			trace(tijd.seconds);
			secondenWijzer.rotation = 360*tijd.getSeconds()/60;
		}
		
	}

}
package toepassingen.hoeken 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.assets.Pijl;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class AnalogeKlok extends Basis
	{
		public var tijd:Date;
		public var secondenWijzer:Pijl;
		public var minutenWijzer:Pijl;
		public var urenWijzer:Pijl;
		
		public function AnalogeKlok()
		{
			rooster.alpha = 0.4;
			this.graphics.lineStyle(1);
			this.graphics.beginFill(0xffff00, 0.3);
			this.graphics.drawCircle(480, 300, 300);
			this.graphics.endFill();
			
			secondenWijzer = new Pijl();
			secondenWijzer.x = 480;
			secondenWijzer.y = 300;
			
			minutenWijzer= new Pijl();
			minutenWijzer.x = 480;
			minutenWijzer.y = 300;
			
			urenWijzer= new Pijl();
			urenWijzer.x = 480;
			urenWijzer.y = 300;
			
			
			secondenWijzer.tekenPijl(300, 0x000000);
			minutenWijzer.tekenPijl(250, 0x0000ff);
			urenWijzer.tekenPijl(200, 0xff0000);

			addChild(secondenWijzer);
			addChild(minutenWijzer);
			addChild(urenWijzer);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			tijd = new Date();
			secondenWijzer.rotation = 360*tijd.getSeconds()/60;
			minutenWijzer.rotation = 360*tijd.getMinutes()/60;
			urenWijzer.rotation = 360*(tijd.getHours()/12 + tijd.getMinutes()/720);
		}
		
	}

}
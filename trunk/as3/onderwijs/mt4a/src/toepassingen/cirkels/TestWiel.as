package toepassingen.cirkels 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Wiel;
	import wiskunde.objecten.Hoek;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestWiel extends Sprite
	{
		public var wiel:Wiel;
		public var v:Number;
		public var hoek:Hoek;
		
		public function TestWiel() 
		{
			v = 10;
			hoek = new Hoek(2);
			wiel = new Wiel(50);
			wiel.x = 480;
			wiel.y = 600 - wiel.r;
			
			addChild(wiel);
			
			this.addEventListener(Event.ENTER_FRAME, update);
			
			this.graphics.lineStyle(1);
			this.graphics.beginFill(0xeeeeee);
			this.graphics.drawRect(0, 0, 960, 600);
			this.graphics.endFill();
		}
		
		private function update(e:Event):void
		{
			hoek.radialen = v/wiel.r;
			wiel.x += v;
			wiel.draaiWiel(hoek);
			
			if (wiel.x > 960 - wiel.r || wiel.x < wiel.r)
			{
				v = -v;
			}
		}
		
	}

}
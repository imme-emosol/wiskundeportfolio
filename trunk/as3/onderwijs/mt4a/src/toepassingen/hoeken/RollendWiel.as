package toepassingen.hoeken  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.OutputBox;
	import wiskunde.assets.Wiel;
	import wiskunde.objecten.Hoek;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class RollendWiel extends Sprite
	{
		public var a:Wiel;
		public var hoek:Hoek;
		public var v:Number;
		
		public function RollendWiel() 
		{
			this.graphics.lineStyle(2);
			this.graphics.beginFill(0xeeeeee);
			this.graphics.drawRect(0, 0, 960, 600);
			this.graphics.endFill();
			
			a = new Wiel(200);
			a.x = 300;
			a.y = 600-a.r;
			addChild(a);
			
			v = 8;
			
			hoek = new Hoek(1,false);
			hoek.omwenteling = 0.5;
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			
			a.x += v;
			hoek.rad= v/a.r;
			a.draaiWiel(hoek);
			if (a.x > 960 - a.r || a.x < a.r)
			{
				v = - v;
			}
			
		}
		
	}

}
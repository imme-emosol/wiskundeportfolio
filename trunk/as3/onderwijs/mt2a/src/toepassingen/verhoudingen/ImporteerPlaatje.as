package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Afbeelding;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class ImporteerPlaatje extends Sprite
	{
		public var p:Afbeelding;
		public var q:Afbeelding;
		
		public function ImporteerPlaatje() 
		{
			p = new Afbeelding("http://0.gravatar.com/avatar/c7553dcda27c4308522eb33ed705728b?s=48&d=identicon&r=G");
			
			
			p.addEventListener(Afbeelding.PLAATJE_GELADEN, update);
		}
		
		private function update(e:Event):void
		{
			q = new Afbeelding("http://userserve-ak.last.fm/serve/34s/11410203.gif");
			q.addEventListener(Afbeelding.PLAATJE_GELADEN, update2);
			
		}
		
		private function update2(e:Event):void
		{
			var hoogte:Number = p.hoogte * q.hoogte;
			trace('hoogte' + hoogte);
			
			addChild(p);
			p.height= hoogte;
			
			addChild(q);
			q.height= hoogte;
			
		}
		
	}

}
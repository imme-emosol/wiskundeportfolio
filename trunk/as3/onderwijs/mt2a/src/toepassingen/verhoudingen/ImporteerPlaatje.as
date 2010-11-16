package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import wiskunde.assets.Afbeelding;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class ImporteerPlaatje extends Sprite
	{
		
		public function ImporteerPlaatje() 
		{
			var p:Afbeelding = new Afbeelding("http://0.gravatar.com/avatar/c7553dcda27c4308522eb33ed705728b?s=48&d=identicon&r=G");
			addChild(p);
			
			
			var q:Afbeelding = new Afbeelding("http://userserve-ak.last.fm/serve/34s/11410203.gif");
			addChild(q);
		}
		
	}

}
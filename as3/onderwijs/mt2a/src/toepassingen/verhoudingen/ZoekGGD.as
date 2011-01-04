package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class ZoekGGD extends Sprite
	{
		public var a:Number;
		public var b:Number;
		
		public function ZoekGGD() 
		{
			a = 1280;
			b = 600;
			var ggd:Number = GetalOperaties.ggd(a, b);
			trace("ggd:", ggd);
			
		}
		
	}

}
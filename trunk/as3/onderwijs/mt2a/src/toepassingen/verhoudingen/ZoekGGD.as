package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Breuk;
	import wiskunde.operaties.BreukOperaties;
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
			var c:Breuk = new Breuk(18.56, 1392);
			trace(GetalOperaties.ggd(c.teller, c.noemer));
			var d: Breuk = BreukOperaties.vereenvoudig(c);
			trace(d.teller, d.noemer);
			
		}
		
	}

}
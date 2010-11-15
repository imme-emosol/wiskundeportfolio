package  
{
	import flash.display.Sprite;
	import wiskunde.assets.OutputBox;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Troep extends Sprite
	{
		
		public function Troep() 
		{
			var a:Number = 4;
			var opb:OutputBox = new OutputBox(0,0,String(GetalOperaties.kwadraat(a)))
			addChild(opb);
		}
		
	}

}
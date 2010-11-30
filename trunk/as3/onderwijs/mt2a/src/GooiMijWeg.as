package  
{
	import flash.display.Sprite;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class GooiMijWeg extends Sprite
	{
		
		public function GooiMijWeg() 
		{
			//var a:Verhouding = GetalOperaties.getalAdBreuk(1.36543);
			//trace(a.deeltal, a.deler);
			var test:String = GetalOperaties.staartDeling(21, 17, 100);
			trace(test);
			trace(GetalOperaties.vindRepetend(test));

		}
		
	}

}
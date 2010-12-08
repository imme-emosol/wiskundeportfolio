package toepassingen.getallen 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class GetalNaarVerhouding extends Sprite
	{
		public var a:Number = 0.34233;
		public var breuk:Verhouding;

		public function GetalNaarVerhouding() 
		{
			breuk = GetalOperaties.getalNaarVerhouding(a);
			trace(breuk.deeltal, breuk.deler);

			
			
			
		}
		
	}

}
package  
{
	import flash.display.Sprite;
	import wiskunde.assets.OutputBox;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class test extends Sprite
	{
		
		public function test() 
		{
			var a:Number = 123.324234;
			var box:OutputBox = new OutputBox(0, 0, 'hoi');
			addChild(box);
			box.box.text = String(GetalOperaties.afronding(a,-2));
			
		}
		
	}

}
package toepassing.tekst 
{
	import flash.display.Sprite;
	import wiskunde.assets.OutputBox;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestBox extends Sprite
	{
		public var box:OutputBox;
		public var box1:OutputBox;
		
		public function TestBox() 
		{
			box = new OutputBox("dit is box1");
			addChild(box);
			
			box1 = new OutputBox("ik ben een andere box");
			box1.x = 200;
			addChild( box1);
		}
		
	}

}
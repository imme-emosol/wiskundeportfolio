package toepassing.tekst 
{
	import flash.display.Sprite;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestBox extends Sprite
	{
		public var box:OutputBox;
		public var box1:OutputBox;
		public var box2:InputBox;
		
		public function TestBox() 
		{
			box = new OutputBox("dit is box1");
			box.setNumber = 200;
			addChild(box);
			
			box1 = new OutputBox("ik ben een andere box");
			box1.x = 200;
			box1.setNumber = 12345566;
			addChild( box1);
			
			box2 = new InputBox("inputbox");
			box2.y = 200;
			addChild(box2);
			
		
		}
		
	}

}
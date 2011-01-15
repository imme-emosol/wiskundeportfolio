package toepassingen.getallen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class CalculatorPythagors extends Sprite
	{
		public var aBox:InputBox;
		public var bBox:InputBox;
		public var cBox:OutputBox;
		
		public function CalculatorPythagors() 
		{
			aBox = new InputBox(10, 10, "a", 4);
			bBox = new InputBox(200, 10, "b", 8)
			cBox = new OutputBox( 400, 10, "c");
			
			addChild(aBox);
			addChild(bBox);
			addChild(cBox);
			
			aBox.box.addEventListener(Event.CHANGE, update);
			bBox.box.addEventListener(Event.CHANGE, update);
			update(null);
		}
		
		private function update(e:Event):void
		{
			var a:Number = Number(aBox.box.text);
			var b:Number = Number(bBox.box.text);
			var c:Number = GetalOperaties.pythagoras(a, b);
			cBox.box.text = String(GetalOperaties.afronding(c,-1));
			
		}
		
	}

}
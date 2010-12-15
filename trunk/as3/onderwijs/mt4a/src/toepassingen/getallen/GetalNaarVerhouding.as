package toepassingen.getallen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
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
		
		public var inputA:InputBox;
		public var outputDeeltal:OutputBox;
		public var outputDeler:OutputBox;

		public function GetalNaarVerhouding() 
		{
			inputA = new InputBox(0, 0, 'getal', a);
			
			outputDeeltal = new OutputBox(160, 0, 'deeltal');
			outputDeler = new OutputBox(160, 60, 'deler');
			
			addChild(inputA);
			addChild(outputDeeltal);
			addChild(outputDeler);			
			
			inputA.addEventListener(InputBox.TEXT_VERANDERD, update);
			update(null);
		}
		
		private function update(e:Event):void
		{
			a = Number(inputA.box.text);
			breuk = GetalOperaties.getalNaarVerhouding(a);
			outputDeeltal.box.text = String(breuk.deeltal);
			outputDeler.box.text = String(breuk.deler);
			trace(breuk.deeltal / breuk.deler);
		}
		
	}

}
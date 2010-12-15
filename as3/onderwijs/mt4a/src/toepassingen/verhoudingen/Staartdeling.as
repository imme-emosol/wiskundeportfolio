package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import wiskunde.assets.InputBox;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Staartdeling extends Sprite
	{
		public var inputDeeltal:InputBox;
		public var inputDeler:InputBox;
		public var inputDecimalen:InputBox;
		
		public var deeltal:Number;
		public var deler:Number;
		public var decimalen:int;
		public var quotient:String;
		
		public var outputQuotient:TextField;
		public var outputRepetend:TextField;
		
		public function Staartdeling() 
		{
			deeltal = 372;
			deler = 11;
			decimalen = 2000;
			
			inputDeeltal = new InputBox(0, 0, 'deeltal', deeltal);
			inputDeler = new InputBox(0, 60, 'deler', deler);
			inputDecimalen = new InputBox(200, 30, 'decimalen', decimalen);
			
			outputQuotient = new TextField();
			
			outputQuotient.width = 800;
			outputQuotient.height = 300;
			outputQuotient.border = true;
			outputQuotient.y = 130;
			outputQuotient.wordWrap = true;
			
			outputRepetend = new TextField();
			outputRepetend.width = 800;
			outputRepetend.height = 80;
			outputRepetend.border = true;
			outputRepetend.y = 440;
			outputRepetend.wordWrap = true;
			
			addChild(inputDeeltal);
			addChild(inputDeler);
			addChild(inputDecimalen);
			
			addChild(outputQuotient);
			addChild(outputRepetend);
			
			inputDeeltal.addEventListener(InputBox.TEXT_VERANDERD, update);
			inputDeler.addEventListener(InputBox.TEXT_VERANDERD, update);
			inputDecimalen.addEventListener(InputBox.TEXT_VERANDERD, update);
			
			update(null);
		}
		
		private function update(e:Event):void
		{
			deeltal = Number(inputDeeltal.box.text);
			deler = Number(inputDeler.box.text);
			decimalen = int(inputDecimalen.box.text);
			quotient = GetalOperaties.staartdeling(deeltal, deler, decimalen);
			outputQuotient.text = quotient;
			
			outputRepetend.text = GetalOperaties.vindRepetend(quotient);
			
		}
		
		
	}

}
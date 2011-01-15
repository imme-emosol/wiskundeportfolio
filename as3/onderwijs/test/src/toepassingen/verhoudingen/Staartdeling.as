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
		
		public function Staartdeling() 
		{
			deeltal = 372;
			deler = 11;
			decimalen = 2000;
			
			inputDeeltal = new InputBox(45, 0, 'deeltal', deeltal);
			inputDeler = new InputBox(45, 60, 'deler', deler);
			inputDecimalen = new InputBox(750, 0, 'decimalen', decimalen);
			
			outputQuotient = new TextField();
			
			outputQuotient.width = 900;
			outputQuotient.height = 450;
			outputQuotient.border = true;
			outputQuotient.x = 45 / 2;
			outputQuotient.y = 130;
			outputQuotient.wordWrap = true;
			
			addChild(inputDeeltal);
			addChild(inputDeler);
			addChild(inputDecimalen);
			
			addChild(outputQuotient);
			
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
			
		}
		
		
	}

}
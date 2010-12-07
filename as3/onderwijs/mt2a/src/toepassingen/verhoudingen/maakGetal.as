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
	public class maakGetal extends Sprite
	{
		public var bDeeltal:InputBox;
		public var bDeler:InputBox;
		public var bDecimalen:InputBox;
		
		public var deeltal:Number;
		public var deler:Number;
		public var decimalen:int;
		
		public var quotient:String;
		public var repetend:String;
		
		public var tQuotient:TextField;
		public var tRepetend:TextField;
		
		public function maakGetal() 
		{
			deeltal = 42;
			deler = 11;
			decimalen = 200;
			
			
			bDeeltal = new InputBox(0, 0, "deeltal", deeltal);
			bDeler = new InputBox(180, 0, "deler", deler);
			bDecimalen = new InputBox(360, 0, "decimalen", decimalen);
			
			tQuotient = new TextField();
			tQuotient.width = 800;
			tQuotient.height = 300;
			tQuotient.y = 100;
			tQuotient.wordWrap = true;
			tQuotient.border = true;
			
			tRepetend = new TextField();
			tRepetend.width = 800;
			tRepetend.height = 50;
			tRepetend.border = true;
			tRepetend.y = 450;
			tRepetend.wordWrap = true;
			
			addChild(bDeeltal);
			addChild(bDeler);
			addChild(bDecimalen);
			addChild(tQuotient);
			addChild(tRepetend);
			
			bDeeltal.box.addEventListener(Event.CHANGE, update);
			bDeler.box.addEventListener(Event.CHANGE, update);
			bDecimalen.box.addEventListener(Event.CHANGE, update);
			
			update(null);
		}
		
		private function update(e:Event):void
		{
			deeltal = Number(bDeeltal.box.text);
			deler = Number(bDeler.box.text);
			decimalen = Number(bDecimalen.box.text);
			quotient = GetalOperaties.staartDeling(deeltal, deler, decimalen);
			tQuotient.text = quotient;
			
			if (repetend != "")
			{
				repetend = GetalOperaties.vindRepetend(quotient);
				tRepetend.text = repetend;
			}
			
		}
		
	}

}
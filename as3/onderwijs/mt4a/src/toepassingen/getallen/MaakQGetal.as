package toepassingen.getallen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.QGetal;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class MaakQGetal extends Sprite
	{
		public var breuk:Breuk;
		public var q:QGetal;
		
		public var ibTeller:InputBox;
		public var ibNoemer:InputBox;
		
		public var obOutput:TextField;
		public var formaat:TextFormat;
		
		public function MaakQGetal() 
		{
			ibTeller = new InputBox(0, 0, 'teller', 1);
			ibNoemer = new InputBox(0, 60, 'noemer', 321);
			obOutput = new TextField();
			formaat = new TextFormat();
			formaat.font = "Courier new";
			
			obOutput.border = true;
			obOutput.width = 600;
			obOutput.height = 600;
			obOutput.x = 160;
			obOutput.y = 0;
			
			//obOutput.text = "dit is een test";
			obOutput.wordWrap = true;
			

			
			
			addChild(ibTeller);
			addChild(ibNoemer);
			addChild(obOutput);
			
			ibNoemer.addEventListener(InputBox.TEXT_VERANDERD, update);
			ibTeller.addEventListener(InputBox.TEXT_VERANDERD, update);
			
			update(null);
		}
		
		private function update(e:Event):void
		{
			var temp:String
			breuk = new Breuk(Number(ibTeller.box.text), Number(ibNoemer.box.text));
			q = GetalOperaties.breukNaarQGetal(breuk);
			
			temp = "berekening: " + String(breuk.teller / breuk.noemer);
			temp += "\n";
			temp += 'entier:' + q.entier;
			temp += "\n";
			temp += 'decimaal:' + q.decimaal;
			temp += "\n";
			temp += 'repetend:' + q.repetend;
			obOutput.text = temp;
		}
		
	}

}
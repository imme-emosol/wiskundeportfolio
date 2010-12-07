package toepassingen.verhoudingen 
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
		public var getal:Number;
		public var verhouding:Verhouding;
		public var bGetal:InputBox;
		public var bDeeltal:OutputBox;
		public var bDeler:OutputBox;
		
		
		public function GetalNaarVerhouding() 
		{
			getal = 0.3432;
			bGetal = new InputBox(0, 0, "getal", getal);
			bDeeltal = new OutputBox(180, 0, "deeltal");
			bDeler = new OutputBox(180, 30, "deler");
			
			
			addChild(bGetal);
			addChild(bDeeltal);
			addChild(bDeler);
			
			bGetal.box.addEventListener(Event.CHANGE, update);
			update(null);
		}
		
		private function update(e:Event):void
		{
			getal = Number(bGetal.box.text);
			verhouding = GetalOperaties.getalAdBreuk(getal);
			bDeeltal.box.text = String(verhouding.deeltal);
			bDeler.box.text = String(verhouding.deler);
		}
	}

}
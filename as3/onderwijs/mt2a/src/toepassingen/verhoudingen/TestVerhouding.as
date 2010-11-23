package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.VerhoudingsOperatie;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestVerhouding extends Sprite
	{
		public var a:Verhouding;
		public var b:Verhouding;
		
		public var ab:InputBox;
		public var ao:InputBox;
		public var bb:InputBox;
		public var bo:InputBox;
		
		public function TestVerhouding() 
		{
			ab = new InputBox(0, 0, 'a deeltal', 4);
			ao = new InputBox(0, 60, 'a deler', 4);
			bb = new InputBox(180, 0, 'b deeltal', 4);
			bo = new InputBox(180, 60, 'b deler', 4);
			
			a = new Verhouding(4, 3);
			b = VerhoudingsOperatie.schaalDeeltal(a, 600);
			
			addChild(ab);
			addChild(ao);
			addChild(bb);
			addChild(bo);
			
			ab.box.addEventListener(Event.CHANGE, updateB);
			ao.box.addEventListener(Event.CHANGE, updateB);
		}
		
		private function updateB(e:Event):void
		{
			a = new Verhouding(Number(ab.box.text), Number(ao.box.text));
			b = VerhoudingsOperatie.schaalDeler(a, Number(bb.box.text));
			bo.box.text = String(GetalOperaties.afronding(b.deler,3))
		}
		
	}

}
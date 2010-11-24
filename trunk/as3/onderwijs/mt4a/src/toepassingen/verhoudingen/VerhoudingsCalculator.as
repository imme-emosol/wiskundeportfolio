package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.VerhoudingOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class VerhoudingsCalculator extends Sprite
	{
		public var a:Verhouding;
		public var b:Verhouding;
		
		public var ab:InputBox;
		public var ao:InputBox;
		public var bb:InputBox;
		public var bo:InputBox;
		
		public function VerhoudingsCalculator() 
		{
			ab = new InputBox(0, 0, 'deeltal a', 4);
			ao = new InputBox(0, 60, 'deler a', 3);
			bb = new InputBox(160, 0, 'deeltal b', 4);
			bo = new InputBox(160, 60, 'deler b', 3);
			
			addChild(ab)
			addChild(ao)
			addChild(bb)
			addChild(bo)
			
			ab.addEventListener(InputBox.TEXT_VERANDERD, update);
			ao.addEventListener(InputBox.TEXT_VERANDERD, update);
			bb.addEventListener(InputBox.TEXT_VERANDERD, update);
			
			bo.addEventListener(InputBox.TEXT_VERANDERD, update1);
		}
		
		private function update(e:Event):void
		{
			var deeltal:Number = Number(bb.box.text);
			a = new Verhouding(Number(ab.box.text), Number(ao.box.text));
			b = new Verhouding(Number(bb.box.text), VerhoudingOperaties.schaalDeler(a, deeltal));
			bo.box.text = String(GetalOperaties.afronding(b.deler,3));
		}
		
		private function update1(e:Event):void
		{
			var deler:Number = Number(bo.box.text);
			a = new Verhouding(Number(ab.box.text), Number(ao.box.text));
			b = new Verhouding(VerhoudingOperaties.schaalDeeltal(a, deler),Number(bb.box.text));
			bb.box.text = String(GetalOperaties.afronding(b.deeltal,3));
			//trace(b.deeltal, b.deel);
		}
	}

}
package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TextEvent;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
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
		public var nb:InputBox;
		public var no:OutputBox;
		
		public function VerhoudingsCalculator() 
		{
			ab = new InputBox(50, 50, 'teller', 4);
			ao = new InputBox(50, 110, 'noemer', 3);
			bb = new InputBox(350, 250, 'deeltal', 4);
			bo = new InputBox(350, 310, 'deler', 3);
			nb = new InputBox(350, 50, "vergrotings Factor",1);
			no = new OutputBox(350, 110, "");
			
			ab.width = 250;
			ao.width = 250;
			bb.width = 250;
			bo.width = 250;
			nb.width = 400;
			no.width = 400;
			
			ab.box.tabIndex = 1;
			ao.box.tabIndex = 2;
			bb.box.tabIndex = 3;
			bo.box.tabIndex = 4;
			nb.box.tabIndex = 5;
			
			addChild(ab);
			addChild(ao);
			addChild(bb);
			addChild(bo);
			addChild(nb);
			addChild(no);
			
			ab.addEventListener(InputBox.TEXT_VERANDERD, update);
			ao.addEventListener(InputBox.TEXT_VERANDERD, update);
			bo.addEventListener(InputBox.TEXT_VERANDERD, update);
			
			bb.addEventListener(InputBox.TEXT_VERANDERD, update1);
			
			nb.addEventListener(InputBox.TEXT_VERANDERD, update2);
			
			update(null);
		}
		
		private function update(e:Event):void
		{
			var deler:Number = Number(bo.box.text);
			var deeltal:Number = Number(bb.box.text);
			
			a = new Verhouding(Number(ab.box.text), Number(ao.box.text));
			b = new Verhouding(VerhoudingOperaties.schaalDeeltal(a, deler),deler);
			bb.box.text = String(GetalOperaties.afronding(b.deeltal, 3));
			nb.box.text = String(b.deeltal / a.deeltal);
			no.box.text = String(b.deeltal / a.deeltal);
		}
		
		private function update1(e:Event):void
		{
			var deeltal:Number = Number(bb.box.text);
			var deler:Number = Number(bo.box.text);
			
			a = new Verhouding(Number(ab.box.text), Number(ao.box.text));
			b = new Verhouding(deeltal, VerhoudingOperaties.schaalDeler(a, deeltal));
			bo.box.text = String(GetalOperaties.afronding(b.deler,3));
			nb.box.text = String(b.deeltal / a.deeltal);
			no.box.text = String(b.deeltal / a.deeltal);
		}
		
		private function update2(e:Event):void
		{
			var vf:Number = Number(nb.box.text);
			var deeltal:Number = Number(ab.box.text);
			var deler:Number = Number(ao.box.text);
			
			bb.box.text = String(GetalOperaties.afronding(vf * deeltal,4));
			bo.box.text = String(GetalOperaties.afronding(vf * deler, 4));
			no.box.text = String(vf);
		}
	}

}
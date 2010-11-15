package calculators
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import wiskunde.objecten.Verhouding
	import wiskunde.operaties.VerhoudingOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class verhoudingenOptellen extends Sprite
	{
		public var calc:form_breukenOptellen = new form_breukenOptellen();
		public var v1:Verhouding;
		public var v2:Verhouding;
		public var va:Verhouding;
		
		public function verhoudingenOptellen() 
		{
			addChild(calc);
			calc.b1.text = "1";
			calc.h1.text = "3";
			
			calc.b2.text = "1";
			calc.h2.text = "3";
			
			calc.ha.text = "2";
			calc.ba.text = "3"
			
			calc.b1.addEventListener(MouseEvent.CLICK, select);
			calc.b2.addEventListener(MouseEvent.CLICK, select);
			calc.h1.addEventListener(MouseEvent.CLICK, select);
			calc.h2.addEventListener(MouseEvent.CLICK, select);
			calc.ha.addEventListener(MouseEvent.CLICK, select);
			calc.ba.addEventListener(MouseEvent.CLICK, select);
			
			calc.b1.addEventListener(Event.CHANGE, update);
			calc.h1.addEventListener(Event.CHANGE, update);
			calc.b2.addEventListener(Event.CHANGE, update);
			calc.h2.addEventListener(Event.CHANGE, update);
			calc.ha.addEventListener(Event.CHANGE, update);
			calc.ba.addEventListener(Event.CHANGE, update);
		}
		
		private function select(e:MouseEvent):void
		{
			var sel:TextField = TextField(e.target);
			sel.setSelection(0, 100);
		}
		
		private function update(e:Event):void
		{
			v1 = new Verhouding(Number(calc.b1.text), Number(calc.h1.text));
			v2 = new Verhouding(Number(calc.b2.text), Number(calc.h2.text));
			va = new Verhouding(Number(calc.ba.text), Number(calc.ha.text));
			
			if (e.target == calc.b1 || e.target == calc.h1 || e.target == calc.b2 || e.target == calc.h2)
			{
				va=VerhoudingOperaties.optellen(v1,v2);
				calc.ba.text = String(va.deeltal);
				calc.ha.text = String(va.deler);
			}
			if (e.target == calc.ba || e.target == calc.ha)
			{
				v2= VerhoudingOperaties.aftrekken(va,v1);
				calc.b2.text = String(v2.deeltal);
				calc.h2.text = String(v2.deler);
			}
		}
	}
}
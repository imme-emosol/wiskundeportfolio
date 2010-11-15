package calculators
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import wiskunde.objecten.Breuk;
	import flash.text.TextField;
	import wiskunde.operaties.BreukOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class breukVereenvoudigen extends Sprite
	{
		public var a:Breuk;
		public var b:Breuk;
		public var calc:form_breukVereenvoudigen = new form_breukVereenvoudigen();
		
		public function breukVereenvoudigen() 
		{
			addChild(calc);
			calc.b1.text = "4";
			calc.h1.text = "3";
			
			calc.ggd.selectable = false;
			calc.b2.selectable = false;
			calc.h2.selectable = false;
			
			calc.ggd.tabEnabled = false;
			calc.b2.tabEnabled = false;
			calc.h2.tabEnabled = false;
			
			
			calc.b2.text = "4";
			calc.h2.text = "3";
			calc.ggd.text = "1";
			
			calc.b1.addEventListener(MouseEvent.CLICK, select);
			calc.h1.addEventListener(MouseEvent.CLICK, select);
			
			
			calc.b1.addEventListener(Event.CHANGE, update);
			calc.h1.addEventListener(Event.CHANGE, update);
		}
		
		private function select(e:MouseEvent):void
		{
			var sel:TextField = TextField(e.target);
			sel.setSelection(0, 100);
		}

		private function update(e:Event):void
		{
			a = new Breuk(Number(calc.b1.text), Number(calc.h1.text));
			b = BreukOperaties.vereenvoudigen(a);
			calc.b2.text = String(b.teller);
			calc.h2.text = String(b.noemer);
			calc.ggd.text = String(a.ggd);
		}
	}
}
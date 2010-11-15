package calculators
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import wiskunde.objecten.Breuk;
	import flash.text.TextField;
	import wiskunde.operaties.BreukOperaties;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class getallenOptellen extends Sprite
	{
		public var a:Number;
		public var b:Number;
		public var c:Number;
		public var calc:form_getallenOptellen = new form_getallenOptellen();
		
		public function getallenOptellen() 
		{
			addChild(calc);
			calc.a.text = "1";
			calc.b.text = "2";
			calc.c.text = "3";
			
			calc.a.addEventListener(MouseEvent.CLICK, select);
			calc.b.addEventListener(MouseEvent.CLICK, select);
			calc.c.addEventListener(MouseEvent.CLICK, select);
			
			
			calc.a.addEventListener(Event.CHANGE, update);
			calc.b.addEventListener(Event.CHANGE, update);
			calc.c.addEventListener(Event.CHANGE, update);
		}
		
		private function select(e:MouseEvent):void
		{
			var sel:TextField = TextField(e.target);
			sel.setSelection(0, 100);
		}

		private function update(e:Event):void
		{
			a = Number(calc.a.text);
			b = Number(calc.b.text);
			c = Number(calc.c.text);
			
			if (e.target == calc.a || e.target == calc.b)
			{
				c = GetalOperaties.optellen(a, b);
				calc.c.text = String(c);
			}
			
			if (e.target == calc.c)
			{
				b = GetalOperaties.aftrekken(c,a);
				calc.b.text = String(b);
			}
		}
	}
}
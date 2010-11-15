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
	public class getalAfronden extends Sprite
	{
		public var a:Number;
		public var b:Number;
		public var c:Number;
		public var calc:form_getalAfronden = new form_getalAfronden();
		
		public function getalAfronden() 
		{
			addChild(calc);
			calc.a.text = "1234.56789";
			calc.b.text = "1";
			calc.c.text = "1";
			
			calc.c.selectable = false;
			calc.c.tabEnabled = false;
			
			calc.a.addEventListener(MouseEvent.CLICK, select);
			calc.b.addEventListener(MouseEvent.CLICK, select);
			
			
			calc.a.addEventListener(Event.CHANGE, update);
			calc.b.addEventListener(Event.CHANGE, update);
			
			update(null);
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
			
			c = GetalOperaties.afronden(a, b);	
			calc.c.text = String(c);
		}
	}
}
package calculators
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import wiskunde.objecten.Lijn;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class lijnFunctievoorschrift extends Sprite
	{
		public var calc:form_lijn_functievoorschrift = new form_lijn_functievoorschrift();
		public var l:Lijn;

		
		public function lijnFunctievoorschrift() 
		{
			addChild(calc);
			calc.a.text = "1";
			calc.b.text = "3";
			calc.c.text = "1";
			
			calc.xi.text = "NaN";
			calc.yi.text = "NaN";

			calc.a.addEventListener(MouseEvent.CLICK, select);
			calc.b.addEventListener(MouseEvent.CLICK, select);
			calc.c.addEventListener(MouseEvent.CLICK, select);			
			calc.xi.addEventListener(MouseEvent.CLICK, select);
			calc.yi.addEventListener(MouseEvent.CLICK, select);
			
			calc.a.addEventListener(Event.CHANGE, update);
			calc.b.addEventListener(Event.CHANGE, update);
			calc.c.addEventListener(Event.CHANGE, update);
			calc.xi.addEventListener(Event.CHANGE, update);
			calc.yi.addEventListener(Event.CHANGE, update);
		}
		
		private function select(e:MouseEvent):void
		{
			var sel:TextField = TextField(e.target);
			sel.setSelection(0, 100);
		}
		
		private function update(e:Event):void
		{
			var a:Number = Number(calc.a.text);
			var b:Number = Number(calc.b.text);
			var c:Number = Number(calc.c.text);

			var xi:Number = Number(calc.xi.text);
			var yi:Number = Number(calc.yi.text);
			
			
			l = new Lijn(a, b, c);

			

			if (e.target == calc.yi)
			{
				xi = GetalOperaties.afronden(l.berekenX(yi), 3); 
				calc.xi.text = String(xi);
			}
			else
			{
				yi = GetalOperaties.afronden(l.berekenY(xi), 3); 
				calc.yi.text = String(yi);
			}


		}
	}
}
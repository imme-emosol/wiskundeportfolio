package calculators
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import wiskunde.objecten.Breuk;
	import flash.text.TextField;
	import wiskunde.objecten.WVector;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.VectorOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class VectorOrthogonaliseren extends Sprite
	{
		public var u:WVector;
		public var v:WVector;
		public var calc:form_vectorOrthogonaliseren = new form_vectorOrthogonaliseren();
		
		public function VectorOrthogonaliseren() 
		{
			addChild(calc);
			calc.vx.text = "4";
			calc.vy.text = "3";
			
			//calc.ex.selectable = false;
			//calc.ey.selectable = false;
			//calc.ex.tabEnabled= false;
			//calc.ey.tabEnabled= false;
			
			calc.vx.addEventListener(MouseEvent.CLICK, select);
			calc.vy.addEventListener(MouseEvent.CLICK, select);	
			
			calc.vx.addEventListener(Event.CHANGE, update);
			calc.vy.addEventListener(Event.CHANGE, update);
			update(null);
		}
		
		private function select(e:MouseEvent):void
		{
			var sel:TextField = TextField(e.target);
			sel.setSelection(0, 100);
		}

		private function update(e:Event):void
		{
			u  = new WVector(Number(calc.vx.text), Number(calc.vy.text));
			
			if (u.r != 0)
			{
				v = VectorOperaties.orthogonaliseren(u);
				calc.ex.text = String(v.dx);
				calc.ey.text = String(v.dy);
			}
			else
			{
				calc.ex.text = String(NaN);
				calc.ey.text = String(NaN);
			}
		}
	}
}
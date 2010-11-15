package calculators
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import wiskunde.objecten.Breuk;
	import flash.text.TextField;
	import wiskunde.objecten.Hoek;
	import wiskunde.objecten.WVector;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.VectorOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class VectorCoordinaten extends Sprite
	{
		public var v:WVector;
		public var calc:form_vectorCoordinaten = new form_vectorCoordinaten();
		
		public function VectorCoordinaten() 
		{
			addChild(calc);
			calc.dx.text = "4";
			calc.dy.text = "3";
			calc.r1.text = "1";
			calc.r2.text = "1";
			calc.h1.text = "0.644";
			calc.h2.text = "0.644";
			calc.hg.text = "36.9";
			
			calc.h2.selectable = calc.r2.selectable = false;
			calc.h2.tabEnabled= calc.r2.tabEnabled= false;
			
			calc.dx.addEventListener(MouseEvent.CLICK, select);
			calc.dy.addEventListener(MouseEvent.CLICK, select);
			calc.r1.addEventListener(MouseEvent.CLICK, select);
			calc.h1.addEventListener(MouseEvent.CLICK, select);
			calc.hg.addEventListener(MouseEvent.CLICK, select);
			
			calc.dx.addEventListener(Event.CHANGE, update);
			calc.dy.addEventListener(Event.CHANGE, update);
			calc.r1.addEventListener(Event.CHANGE, update);
			//calc.r2.addEventListener(Event.CHANGE, update);
			calc.h1.addEventListener(Event.CHANGE, update);
			//calc.h2.addEventListener(Event.CHANGE, update);
			calc.hg.addEventListener(Event.CHANGE, update);

			//update(null);
		}
		
		private function select(e:MouseEvent):void
		{
			var sel:TextField = TextField(e.target);
			sel.setSelection(0, 100);
		}

		private function update(e:Event):void
		{
			var hoek:Hoek;
			
			
			if (e.target == calc.dx || e.target == calc.dy)
			{
				//als dx of dy worden ingevoerd
				v  = new WVector(Number(calc.dx.text), Number(calc.dy.text));
				calc.r1.text = calc.r2.text = String(GetalOperaties.afronden(v.r,1));
				calc.h1.text = calc.h2.text = String(GetalOperaties.afronden(v.hoek.rad,3));
				calc.hg.text = String(GetalOperaties.afronden(v.hoek.graden,1))
			}
			else
			{
				if (e.target == calc.hg)
				{
					//als de hoek in graden wordt ingevoerd
					hoek = new Hoek(Number(calc.hg.text));
					
					v = new WVector(Number(calc.r1.text), hoek.rad, "p");
					calc.dx.text = String(GetalOperaties.afronden(v.dx,1));
					calc.dy.text = String(GetalOperaties.afronden(v.dy,1));
					calc.h1.text = calc.h2.text = String(GetalOperaties.afronden(v.hoek.rad,3)); 
					
				}
				else
				{
					//als de straal en hoek in radialen worden ingevoerd
					hoek = new Hoek(Number(calc.h1.text),"r");
					v = new WVector(Number(calc.r1.text), hoek.rad, "p");
					calc.dx.text = String(GetalOperaties.afronden(v.dx,1));
					calc.dy.text = String(GetalOperaties.afronden(v.dy,1));
					calc.h2.text = calc.h1.text; 
					calc.r2.text = calc.r1.text; 
					calc.hg.text = String(GetalOperaties.afronden(v.hoek.graden,1)); 
				}
		
			}			
			
		}
	}
}
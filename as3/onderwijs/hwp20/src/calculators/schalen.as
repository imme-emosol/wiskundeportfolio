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
	public class schalen extends Sprite
	{
		public var calc:form_schalen = new form_schalen();
		public var v1:Verhouding;
		public var v2:Verhouding;
		public var vergroting:Number;
		
		public function schalen() 
		{
			addChild(calc);
			calc.b1.text = "4";
			calc.h1.text = "3";
			
			calc.b2.text = "b";
			calc.h2.text = "h";
			calc.orientatie.selectable = false;
			calc.orientatie.text = "landschap";
			
			calc.b1.addEventListener(MouseEvent.CLICK, select);
			calc.b2.addEventListener(MouseEvent.CLICK, select);
			calc.h1.addEventListener(MouseEvent.CLICK, select);
			calc.h2.addEventListener(MouseEvent.CLICK, select);
			
			calc.b1.addEventListener(Event.CHANGE, update);
			calc.h1.addEventListener(Event.CHANGE, update);
			calc.b2.addEventListener(Event.CHANGE, update);
			calc.h2.addEventListener(Event.CHANGE, update);
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

			//2 mogelijkheden: 1 onbekende of geen onbekende
			//in alle andere gevallen moet er niets gebeuren
			
			//tel het aantal onbekenden
			var temp:Number = 0;
			var doel:TextField;
			
			if (isNaN(v1.deler))
			{
				temp++;
				doel = calc.h1;
			}
			
			if (isNaN(v1.deeltal))
			{
				temp++;
				doel = calc.b1;
			}

			if (isNaN(v2.deler))
			{
				temp++;
				doel = calc.h2;
			}

			if (isNaN(v2.deeltal))
			{
				temp++;
				doel = calc.b2;
			}

			
			//als er geen onbkenden zijn, schaal afhankelijk van invoer
			if (temp == 0)
			{
				if (e.target == calc.b1 || e.target == calc.h1)
				{
					v2 = VerhoudingOperaties.schalen(v1,v2);
					calc.b2.text = String(v2.deeltal);	
					calc.h2.text = String(v2.deler);
				}

				if (e.target == calc.b2)
				{
					v2=VerhoudingOperaties.schalen(v1,v2,"deler");
					calc.h2.text = String(v2.deler);	
				}
				
				if (e.target == calc.h2)
				{
					v2=VerhoudingOperaties.schalen(v1,v2,"deeltal");
					calc.b2.text = String(v2.deeltal);
				}
			}
			
			if (temp == 1)
			{
				if (doel == calc.b1 || doel == calc.h1)
				{
					v1 = VerhoudingOperaties.schalen(v2,v1);
					calc.b1.text = String(v1.deeltal);
					calc.h1.text = String(v1.deler);
				}
				if (doel == calc.b2 || doel == calc.h2)
				{
					v2=VerhoudingOperaties.schalen(v1,v2);
					calc.b2.text = String(v2.deeltal);
					calc.h2.text = String(v2.deler);
				}
			}
			
			calc.vergroting.text = String(Math.round(100*v2.deler / v1.deler)) + " %";
			
			if (v1.value < 1)
			{
				calc.orientatie.text = "portret";
			}

			if (v1.value > 1)
			{
				calc.orientatie.text = "landschap";
			}

			if (v1.value == 1)
			{
				calc.orientatie.text = "vierkant";
			}
		}
	}
}
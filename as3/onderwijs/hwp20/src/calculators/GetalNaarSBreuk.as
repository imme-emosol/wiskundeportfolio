package calculators
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import wiskunde.objecten.Breuk;
	import flash.text.TextField;
	import wiskunde.objecten.SBreuk;
	import wiskunde.operaties.BreukOperaties;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.VerhoudingOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class GetalNaarSBreuk extends Sprite
	{
		public var a:Number;
		public var sb:SBreuk;
		public var entier:Number;
		public var teller:Number;
		public var noemer:Number;
		public var b:Breuk;
		public var calc:form_getalNaarSBreuk = new form_getalNaarSBreuk();
		
		public function GetalNaarSBreuk() 
		{
			addChild(calc);
			calc.entier.text = "1";
			calc.decimaal.text = "12";
			calc.repetend.text = "8";
			
			calc.entier.addEventListener(MouseEvent.CLICK, select);
			calc.decimaal.addEventListener(MouseEvent.CLICK, select);
			calc.repetend.addEventListener(MouseEvent.CLICK, select);

			calc.entier.addEventListener(Event.CHANGE,update);
			calc.decimaal.addEventListener(Event.CHANGE,update);
			calc.repetend.addEventListener(Event.CHANGE, update);
			
			update(null);

		}
		
		private function select(e:MouseEvent):void
		{
			var sel:TextField = TextField(e.target);
			sel.setSelection(0, 100);
		}

		private function update(e:Event):void
		{
			var entier:Number = Number(calc.entier.text);
			var decimaal:Number = Number(calc.decimaal.text);
			var repetend:Number = Number(calc.repetend.text);
			
			var dteller:Number;
			var dnoemer:Number;
			var rteller:Number = Number(calc.repetend.text);
			var rnoemer:Number;
			var entier1:Number;
			var teller:Number;
			var noemer:Number;
			var ordeDecimaal:Number;
			var ordeRepetend:Number;
			var decBreuk:Breuk;
			var repBreuk:Breuk;
			
			calc.entier2.text = calc.entier1.text = calc.entier.text;
			ordeDecimaal = Math.pow(10, GetalOperaties.lengte(decimaal));
			ordeRepetend = Math.pow(10, GetalOperaties.lengte(repetend));
			decimaal = Number(calc.decimaal.text);
			calc.dteller.text = String(decimaal);
			calc.dnoemer.text = String(ordeDecimaal);
			calc.rteller.text = String(rteller);
			
			
			decBreuk = new Breuk(decimaal, ordeDecimaal);
			
			
			if (repetend == 0)
			{
				if (isNaN(decimaal))
				{
					calc.dteller.text = "0";
					calc.dnoemer.text = "1";
					calc.teller.text = "0";
					calc.noemer.text = "1";

				}
				else
				{
					decBreuk= BreukOperaties.vereenvoudigen(decBreuk);
					calc.teller.text = String(decBreuk.teller);
					calc.noemer.text = String(decBreuk.noemer);
					
					calc.rteller.text = "0";
					calc.rnoemer.text = "1";
					
					decBreuk= BreukOperaties.vereenvoudigen(decBreuk);
					calc.teller.text = String(decBreuk.teller);
					calc.noemer.text = String(decBreuk.noemer);
				}
				
				calc.rteller.text = "0";
				calc.rnoemer.text = "1";
			}
			else
			{
				if (isNaN(decimaal))
				{
					calc.dteller.text = "0";
					calc.dnoemer.text = "1";
					ordeDecimaal = 0;
					ordeRepetend--
					calc.rnoemer.text = String(ordeRepetend);
					repBreuk = new Breuk(repetend, ordeRepetend);
					repBreuk = BreukOperaties.vereenvoudigen(repBreuk);
					if (repBreuk.waarde < 1)
					{
						calc.teller.text = String(repBreuk.teller);
						calc.noemer.text = String(repBreuk.noemer);
					}
					else
					{
						if (entier == Math.abs(entier))
						{
							calc.entier2.text = String(entier + 1);
						}
						else
						{
							calc.entier2.text = String(entier - 1);
						}
						
						calc.teller.text = "0";
						calc.noemer.text = "1";
						
					}
					
				}
				else
				{
					ordeRepetend = (ordeRepetend-1)* (ordeDecimaal);
					calc.rnoemer.text = String(ordeRepetend);
					decBreuk = new Breuk(decimaal, ordeDecimaal);
					repBreuk = new Breuk(repetend, ordeRepetend);
					repBreuk =BreukOperaties.optellen(decBreuk, repBreuk);
					repBreuk = BreukOperaties.vereenvoudigen(repBreuk);
					calc.teller.text = String(repBreuk.teller);
					calc.noemer.text = String(repBreuk.noemer);
				}
				
				
			}
			
			calc.waarde.text = String(Number(calc.teller.text) / Number(calc.noemer.text) + Number(calc.entier2.text));
		}
		
	}
}
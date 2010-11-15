package calculators
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import wiskunde.operaties.GetalOperaties
	import wiskunde.objecten.verzamelingen.Delers
	import wiskunde.operaties.VerzamelingOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class PriemDelers extends Sprite
	{
		public var a:Number;
		public var calc:form_priemdelers = new form_priemdelers();
		
		public function PriemDelers() 
		{
			addChild(calc);
			calc.a.text = "768";
			calc.delers.text = "";
			calc.aantal.text = "";
			calc.delers.backgroundColor = 0xeeeeff;
			
			a = Number(calc.a.text);
			
			calc.delers.selectable = false;
			calc.aantal.selectable = false;
			
			calc.delers.tabEnabled = false;
			calc.aantaltabEnabled = false;
			
			calc.a.addEventListener(MouseEvent.CLICK, select);
			calc.a.addEventListener(Event.CHANGE, update);
			
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
			var arr:Array = VerzamelingOperaties.priemDelers(a);
			//trace(arr.toString());
			calc.delers.text = arr.toString();
			calc.aantal.text = String(arr.length);
		}
	}

}
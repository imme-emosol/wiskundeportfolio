package calculators
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import wiskunde.operaties.GetalOperaties
	import wiskunde.verzamelingen.Delers;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class GetalDelers extends Sprite
	{
		public var a:Number;
		public var calc:form_delers = new form_delers();
		
		public function GetalDelers() 
		{
			addChild(calc);
			calc.a.text = "4";
			calc.delers.text = "1,2,4";
			calc.aantal.text = "2";
			
			calc.delers.selectable = false;
			calc.aantal.selectable = false;
			
			calc.delers.tabEnabled = false;
			calc.aantaltabEnabled = false;
			
			calc.a.addEventListener(MouseEvent.CLICK, select);
			
			
			calc.a.addEventListener(Event.CHANGE, update);
		}
		
		private function select(e:MouseEvent):void
		{
			var sel:TextField = TextField(e.target);
			sel.setSelection(0, 100);
		}

		private function update(e:Event):void
		{
			var delers:Array= new Delers(Number(calc.a.text)).delers;
			calc.delers.text = delers.toString();
			calc.aantal.text = String(delers.length);
		}
	}

}
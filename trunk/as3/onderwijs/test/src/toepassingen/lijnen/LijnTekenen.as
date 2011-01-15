package toepassingen.lijnen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Lijn;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class LijnTekenen extends Basis
	{
		public var l:Lijn;
		public var a:Number;
		public var b: Number;
		public var c:Number;
		
		public var aBox:InputBox;
		public var bBox:InputBox;
		public var cBox:InputBox;
		
		
		public function LijnTekenen() 
		{
			a = 1;
			b = 2;
			c = 3;
			
			aBox = new InputBox(0, 0, 'a', a);
			bBox = new InputBox(140,0, 'b', b);
			cBox = new InputBox(280,0, 'c', c);
			
			addChild(aBox);
			addChild(bBox);
			addChild(cBox);
			
			l = new Lijn( a, b, c);
			l.tekenLijn();
			rooster.addChild(l);
			
			aBox.box.addEventListener(Event.CHANGE, update);
			bBox.box.addEventListener(Event.CHANGE, update);
			cBox.box.addEventListener(Event.CHANGE, update);
		}
		
		private function update(e:Event):void
		{
			a = Number(aBox.box.text);
			b = Number(bBox.box.text);
			c = Number(cBox.box.text);
			l.setLijn(a, b, c);
			l.tekenLijn(); 
		}
		
	}

}
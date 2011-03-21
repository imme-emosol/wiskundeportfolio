package wiskunde.form 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Getal;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class GetallenAftrekken extends Sprite
	{
		public var a:Getal;
		public var b:Getal;
		public var c:Getal;
		
		public var aBox:InputBox;
		public var bBox:InputBox;
		public var cBox:OutputBox;
		
		public function GetallenAftrekken() 
		{
			aBox = new InputBox("a");
			bBox = new InputBox("b");
			cBox = new OutputBox("c");
			
			bBox.x = 200;
			cBox.x = 400;
			
			addChild(aBox);
			addChild(bBox);
			addChild(cBox);
			
			a = new Getal(3);
			
			aBox.box.text = String(a.waarde);
			
			b = new Getal(4);
			
			bBox.box.text = String(b.waarde);
			
			
			c = a.trekAf(b);
			
			cBox.box.text = String(c.waarde);
			
			aBox.box.addEventListener(Event.CHANGE, update);
			bBox.box.addEventListener(Event.CHANGE, update);
			
		}
		
		private function update(e:Event):void
		{
			a.waarde = Number(aBox.box.text);
			b.waarde = Number(bBox.box.text);
			c = a.trekAf(b);
			cBox.box.text = String(c.waarde);
	
		}
		
	}

}
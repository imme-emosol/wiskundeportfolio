package toepassingen.Lijnen
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.assets.InputBox;
	import wiskunde.objecten.Lijn
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TekenLijn extends Basis
	{
		public var l:Lijn;
		public var a:InputBox;
		public var b:InputBox;
		public var c:InputBox;
		
		public function TekenLijn() 
		{	
			l = new Lijn(1,1,0);
			rooster.addChild(l);
			l.tekenLijn();
			
			a = new InputBox(540, 0, 'a',1);
			b = new InputBox(680, 0, 'b',1);
			c = new InputBox(820, 0, 'c',0);
			addChild(a);
			addChild(b);
			addChild(c);
			a.box.addEventListener(Event.CHANGE, update);
			b.box.addEventListener(Event.CHANGE, update);
			c.box.addEventListener(Event.CHANGE, update);
			
		}
		
		public function update(e:Event):void
		{
			l.setLijn(Number(a.box.text), Number(b.box.text),Number(c.box.text));
			l.tekenLijn();
		}
		
	}

}
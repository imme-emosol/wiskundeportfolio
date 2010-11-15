package toepassingen.functies 
{
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.assets.InputBox;
	import wiskunde.objecten.functies.KwadratischeFunctie;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TekenParabool extends Basis
	{
		public var aBox:InputBox;
		public var bBox:InputBox;
		public var cBox:InputBox;
		public var yschaalBox:InputBox;
		public var a:Number=1;
		public var b:Number=1;
		public var c:Number = 0;
		public var yschaal:Number = 0.01;
		public var f:KwadratischeFunctie;
		
		
		public function TekenParabool() 
		{
			aBox = new InputBox(0,540, 'a',a);
			bBox = new InputBox(140, 540, 'b',b);
			cBox = new InputBox(280,540, 'c', c);
			yschaalBox = new InputBox(820, 540, 'y-schaal', yschaal);
			
			addChild(aBox);
			addChild(bBox);
			addChild(cBox);
			addChild(yschaalBox);
			
			aBox.box.addEventListener(Event.CHANGE, update);
			bBox.box.addEventListener(Event.CHANGE, update);
			cBox.box.addEventListener(Event.CHANGE, update);
			yschaalBox.box.addEventListener(Event.CHANGE, update);
			
			update(null);
		}
		
		private function update(e:Event):void
		{
			a = Number(aBox.box.text);
			b = Number(bBox.box.text);
			c = Number(cBox.box.text);
			yschaal = Number(yschaalBox.box.text);
			
			while (rooster.numChildren > 0)
			{
				rooster.removeChildAt(0);
			}
			f = new KwadratischeFunctie(a, b, c);
			rooster.addChild(f.teken( -480, 480,yschaal));
		}
		
	}

}
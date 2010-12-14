package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.QGetal;
	import wiskunde.operaties.VerhoudingsOperatie;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class MaakQGetal extends Sprite
	{
		public var a:Breuk;
		public var q:QGetal;
		
		public var tbTeller:InputBox;
		public var tbNoemer:InputBox;
		
		public var tbEntier:OutputBox;
		public var tbDecimaal:OutputBox;
		public var tbRepetend:OutputBox;
		
		
		
		public function MaakQGetal() 
		{
			tbTeller = new InputBox(0, 0, 'teller', 9);
			tbNoemer = new InputBox(0, 60, 'noemer', 11);
			
			tbEntier = new OutputBox(200, 0, 'leeg');
			tbDecimaal = new OutputBox(200, 60, 'leeg');
			tbRepetend = new OutputBox(200, 360, 'leeg');
			
			tbEntier.box.width = 600;
			tbDecimaal.box.width = 600;
			tbRepetend.box.width = 600;

			tbEntier.box.height= 60;
			tbDecimaal.box.height= 300;
			tbRepetend.box.height = 300;
			
			tbEntier.box.wordWrap = true;
			tbDecimaal.box.wordWrap = true;
			tbRepetend.box.wordWrap = true;
			
			
			//trace(q.entier, q.decimaal, q.repetend);
			addChild(tbTeller);
			addChild(tbNoemer);
			
			addChild(tbEntier);
			addChild(tbDecimaal);
			addChild(tbRepetend);
			
			tbTeller.box.addEventListener(Event.CHANGE, update);
			tbNoemer.box.addEventListener(Event.CHANGE, update);
			
			update(null);
		}
		
		private function update(e:Event):void
		{
			a= new Breuk(Number(tbTeller.box.text), Number(tbNoemer.box.text));
			q = VerhoudingsOperatie.breukNaarQGetal(a);
			
			tbEntier.box.text = "entier:" + "\n" + q.entier;
			tbDecimaal.box.text = "decimaal: \n" + q.decimaal;
			tbRepetend.box.text = "repetend: \n" + q.repetend;
			
		}
		
	}

}
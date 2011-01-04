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
		public var tbOutput:OutputBox;
		public var tbDeling:OutputBox;
		
		
		public function MaakQGetal() 
		{
			tbTeller = new InputBox(0, 0, 'teller', 9);
			tbNoemer = new InputBox(0, 60, 'noemer', 11);
			
			
			tbOutput = new OutputBox(200, 60, '');
			tbOutput.box.width = 758;
			tbOutput.box.height = 539;
			tbOutput.box.wordWrap = true;
			tbOutput.box.border = true;
				
			tbDeling= new OutputBox(200, 0, '');
			tbDeling.box.width = 758;
			tbDeling.box.height = 60;
			tbDeling.box.wordWrap = true;
			tbDeling.box.border = true;
			
			//trace(q.entier, q.decimaal, q.repetend);
			addChild(tbTeller);
			addChild(tbNoemer);
			
			addChild(tbOutput);
			addChild(tbDeling);
			
			tbTeller.box.addEventListener(Event.CHANGE, update);
			tbNoemer.box.addEventListener(Event.CHANGE, update);
			
			update(null);
		}
		
		private function update(e:Event):void
		{
			a= new Breuk(Number(tbTeller.box.text), Number(tbNoemer.box.text));
			q = VerhoudingsOperatie.breukNaarQGetal(a);
			
			var output:String = "entier: (" + q.entier.length  + ")\n" + q.entier 
			output += "\n\ndecimaal: ("+ q.decimaal.length + ")\n" + q.decimaal 
			output += "\n\nrepetend: (" + q.repetend.length + ")\n" + q.repetend;
			tbOutput.box.text = output;
			tbDeling.box.text = String(a.teller / a.noemer);
		}
		
	}

}
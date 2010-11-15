package toepassingen.verhoudingen 
{
	import wiskunde.objecten.BeeldVerhouding
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	import wiskunde.assets.Bit;
	import wiskunde.assets.RoosterBV;
	import wiskunde.assets.TextBox;
	import wiskunde.objecten.BeeldVerhouding;
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.Formaat;
	import wiskunde.objecten.functies.KwadratischReciprokeFunctie;
	import wiskunde.objecten.functies.ReciprokeFunctie;
	import wiskunde.objecten.functies.Functie;
	import wiskunde.objecten.Getal;
	import wiskunde.objecten.Punt;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import wiskunde.operaties.BreukOperaties;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class AfbeeldingAnalyseren extends Sprite
	{
		
		public var oppervlak:Functie;
		public var grafiek:Sprite;
		public var rechthoek:Sprite;
		public var b:Number;
		public var h:Number;
		public var verhouding:Number;
		public var format:TextFormat;
		public var opp:Number
		public var pointer:Punt;
		public var tb:TextBox;
		public var url:String = "http://wiki.wiskundeportfolio.nl/logo/wisportfolio_logo.png"
		public var lader:Loader;
		public var aanvraag:URLRequest;
		public var afbeelding:Sprite;
		public var bit:Bit;
		public var formaat:Formaat;
		public var breuk:Breuk;
		public var infoBox:TextBox;
		public var info:String = "info";
		
		public function AfbeeldingAnalyseren() 
		{
			
			var rooster:RoosterBV = new RoosterBV();
			rooster.alpha = 0.6;
			addChild(rooster);
			
			infoBox = new TextBox(590, 80, 200, 90, info,0x0092BC ,0xffffff);
			infoBox.box.selectable = false;
			infoBox.box.tabEnabled = false;
			addChild(infoBox);
			
			lader = new Loader();
			aanvraag = new URLRequest(url);
			lader.load(aanvraag);
			
			afbeelding = new Sprite();
			addChild(afbeelding);
			lader.contentLoaderInfo.addEventListener(Event.COMPLETE, geladen);
			
			formaat = new Formaat();
			
			tb = new TextBox(20, 10, 710, 50, url,0xffffff,0x0092BC);
			
			bit = new Bit(740, 10,50,50);
			bit.tekenBit();
			bit.setToestand(false);
			addChild(bit);
			
			opp = 400 * 400;
			format = new TextFormat();
			format.font = "Arial";
			format.size = 12;
			format.bold = true;
			format.color = 0x0092BC;
			
			
			
			oppervlak = new ReciprokeFunctie(0,opp,1,0);
			grafiek = oppervlak.teken(1, 800, 0xff0000);
			grafiek.y = 600;
			addChild(grafiek);
			
			
			var bv:Beeldverhouding = new Beeldverhouding();
			for (var i:uint = 0; i <  bv.tabel.length; i++)
			{
	
				
				var coordinaat:Number = Math.sqrt(bv.tabel[i][1] * 400 * 400);;
				var p:Punt = new Punt(coordinaat, 600 - oppervlak.bereken(coordinaat));
				var txt:TextField = new TextField();
				txt.defaultTextFormat = format;
				txt.autoSize = "left";
				txt.text = bv.tabel[i][0];
				
				txt.x = 10 + coordinaat;
				txt.y = 587 - oppervlak.bereken(coordinaat);
				
				p.tekenPunt(5, 0x000000);
				addChild(p);
				addChild(txt);
				
			}
			
			addChild(tb);
			
			bit.addEventListener(MouseEvent.CLICK, update);
			
			update(null);
		}
		
		private function geladen(e:Event):void
		{
			trace(lader.contentLoaderInfo.width);
			trace(lader.contentLoaderInfo.height);
			bit.setToestand(true);

			afbeelding.addChild(lader);
			formaat.setFormaat(afbeelding.height, afbeelding.width);
			
			var breuk:Breuk = new Breuk(lader.contentLoaderInfo.width, lader.contentLoaderInfo.height);
			
			breuk = BreukOperaties.vereenvoudigen(breuk);
			info = "formaat: " + lader.contentLoaderInfo.width + " x " + lader.contentLoaderInfo.height + "\n"
				+ "opp: " + GetalOperaties.afronden(lader.contentLoaderInfo.width*lader.contentLoaderInfo.height/1000,0) + " kpx \n"
				+ "BV: " + breuk.teller + " : " + breuk.noemer + "\n"  
				+ "AR: " + String(GetalOperaties.afronden(afbeelding.width / afbeelding.height, 2));
			
			infoBox.setBox(info);	
			
			var factor:Number = Math.sqrt(opp / formaat.oppervlakte);
			afbeelding.width = afbeelding.width * factor;
			afbeelding.height = afbeelding.height * factor;
			afbeelding.y = 600 - afbeelding.height;

		}
		
		private function update(e:MouseEvent):void
		{
			while (afbeelding.numChildren > 0)
			{
				afbeelding.removeChildAt(0);
			}
			aanvraag = new URLRequest(tb.box.text);
			lader.load(aanvraag);
			afbeelding.addChild(lader);
		}
		
		
	}

}
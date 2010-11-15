package toepassingen.verhoudingen
{
	import toepassingen.verhoudingen.Beeldverhoudingen;
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	import wiskunde.assets.OutputBox;
	import wiskunde.assets.Rooster;
	import wiskunde.assets.Bit
	import wiskunde.assets.VerhoudingBox;
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.functies.ReciprokeFunctie;
	import wiskunde.objecten.functies.Functie;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.BreukOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class GelijkeOppervlakte extends Sprite
	{
		[Embed(source = '../../../lib/Echinocactus_grusonii.jpg')]
		private var Plaatje:Class;
 
		public var oppervlak:Functie;
		public var grafiek:Sprite;
		public var marker:Punt;
		public var rechthoek:Sprite;
		public var b:Number;
		public var h:Number;
		public var verhouding:Number;
		public var box:OutputBox;
		public var format:TextFormat;
		public var opp:Number
		public var beeldverhouding:Breuk;
		public var verhoudingBox:VerhoudingBox;
 
		public function GelijkeOppervlakte() 
		{
			var plaatje:Bitmap = new Plaatje();
			plaatje.alpha = 0.2;
			addChild(plaatje);
 
			opp = 400*400;
			format = new TextFormat();
			format.font = "Arial";
			format.size = 12;
			format.bold = true;
			format.color = 0x000000;

 
			box = new OutputBox(600, 50,140, "AspectRatio");
			addChild(box);
			
			verhoudingBox = new VerhoudingBox(800, 50, "Beeldverhouding", 16);
			beeldverhouding = new Breuk(1, 1);
			verhoudingBox.setVerhouding(1, 1);
			addChild(verhoudingBox);
 
 
			oppervlak = new ReciprokeFunctie(opp,1,0);
			grafiek = oppervlak.teken(265, 960,1);
			grafiek.scaleY = -1;
			grafiek.x = 0;
			grafiek.y = 600;
			addChild(grafiek);
 
			var bv:Beeldverhoudingen = new Beeldverhoudingen();
			for (var i:uint = 0; i <  bv.tabel.length; i++)
			{
 
 
				var coordinaat:Number = Math.sqrt(bv.tabel[i][1] * 400 * 400);;
				var p:Punt = new Punt(coordinaat, 600 - oppervlak.bereken(coordinaat));
				var txt:TextField = new TextField();
				txt.defaultTextFormat = format;
				txt.autoSize = "left";
				txt.text = bv.tabel[i][0];
				addChild(txt);
				txt.x = 10 + coordinaat;
				txt.y = 587 - oppervlak.bereken(coordinaat);
 
				p.tekenPunt(5, 0xffffff);
				addChild(p);
			}
 
 
			rechthoek = new Sprite();
			addChild(rechthoek);
 
			var formaatPlaatje:Bitmap = new Plaatje();
			addChild(formaatPlaatje);
 
			formaatPlaatje.mask = rechthoek;
 
			marker = new Punt(400, 590);
			marker.buttonMode = true;
			marker.tekenPunt(10, 0x0092BC);
			addChild(marker);
 
 
 
			marker.addEventListener(MouseEvent.MOUSE_DOWN, startSleep);
			stage.addEventListener(MouseEvent.MOUSE_UP, stopSleep);
			marker.addEventListener(MouseEvent.MOUSE_UP, stopSleep);
 
			update(null);
		}
 
		private function startSleep(e:MouseEvent):void
		{
			var rect:Rectangle = new Rectangle(265, 590, 695, 0);
			marker.startDrag(false, rect);
			addEventListener(Event.ENTER_FRAME, update);
		}
 
		private function stopSleep(e:MouseEvent):void
		{
			marker.stopDrag();
			removeEventListener(Event.ENTER_FRAME, update);
		}
 
		private function update(e:Event):void
		{
			tekenRechthoek();
			verhouding = b / h;
			box.box.text = String(verhouding.toFixed(2));
			beeldverhouding = new Breuk(Math.round(b), Math.round(h));
			beeldverhouding = BreukOperaties.vereenvoudigen(beeldverhouding);
			verhoudingBox.setVerhouding(beeldverhouding.teller, beeldverhouding.noemer);
		}
 
		public function tekenRechthoek():void
		{
			var tmp:Graphics = rechthoek.graphics;
			b = marker.x;
			h = oppervlak.bereken(marker.x);
 
			tmp.clear();
			tmp.lineStyle(1, 0.4);
			tmp.beginFill(0xffff00,0.4);
			tmp.drawRect(0, 600, b, -h);
			tmp.endFill();
 
 
		}
 
	}
 
}

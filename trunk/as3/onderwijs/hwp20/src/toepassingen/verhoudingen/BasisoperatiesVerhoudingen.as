package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	import wiskunde.assets.Raster;
	import wiskunde.assets.TextBox;
	import wiskunde.assets.VerhoudingBox;
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.Getal;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.BreukOperaties;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.VerhoudingOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class BasisoperatiesVerhoudingen extends Sprite
	{
		private var a:Breuk;
		private var b:Breuk;
		
		private var va:Verhouding;
		private var vb:Verhouding;
		
		private var antwoord:Breuk;
		private var antwoord2:Breuk;
		
		public var optellenA:VerhoudingBox
		public var optellenSymb:TextBox;
		public var optellenB:VerhoudingBox
		public var optellenIs:TextBox;
		public var optellenAntwoord:VerhoudingBox;
		public var optellenIs2:TextBox;
		public var optellenAntwoord2:VerhoudingBox;
		
		public var aftrekkenA:VerhoudingBox
		public var aftrekkenSymb:TextBox;
		public var aftrekkenB:VerhoudingBox
		public var aftrekkenIs:TextBox;
		public var aftrekkenAntwoord:VerhoudingBox;
		public var aftrekkenIs2:TextBox;
		public var aftrekkenAntwoord2:VerhoudingBox;
		
		public var vermenigvuldigenA:VerhoudingBox
		public var vermenigvuldigenSymb:TextBox;
		public var vermenigvuldigenB:VerhoudingBox
		public var vermenigvuldigenIs:TextBox;
		public var vermenigvuldigenAntwoord:VerhoudingBox;
		public var vermenigvuldigenIs2:TextBox;
		public var vermenigvuldigenAntwoord2:VerhoudingBox;
		
				
		public var delenA:VerhoudingBox
		public var delenSymb:TextBox;
		public var delenB:VerhoudingBox
		public var delenIs:TextBox;
		public var delenAntwoord:VerhoudingBox;
		public var delenIs2:TextBox;
		public var delenAntwoord2:VerhoudingBox;
		
		public var vereenvoudigenA:VerhoudingBox;
		public var vereenvoudigenSymb:TextBox;
		public var vereenvoudigenAntwoord:VerhoudingBox;

		public var schalenA:VerhoudingBox;
		public var schalenSymb:TextBox;
		public var schalenAntwoord:VerhoudingBox;
		
		public var entierBox:InputBox;
		public var decimaalBox:InputBox;
		public var repetendBox:InputBox;
		public var getalIs:TextBox
		public var getalAntwoord:VerhoudingBox;
		public var getalAntwoord2:OutputBox;
	
		
		
		public function BasisoperatiesVerhoudingen() 
		{
			var r:Raster = new Raster(20, 0, 20, 0);
			r.alpha = 0.2;
			addChild(r);
			
			optellenA = new VerhoudingBox(20, 20, null, 22.5);
			optellenSymb = new TextBox(180, 30, 40, 40, "+", 30);
			optellenB = new VerhoudingBox(240, 20, null, 22.5);
			optellenIs = new TextBox(400, 30, 40, 40, "=", 30);
			optellenAntwoord = new VerhoudingBox(460, 20, null, 22.5,0xaaaaff);
			optellenIs2 = new TextBox(620, 30, 40, 40, "=", 30);
			optellenAntwoord2 = new VerhoudingBox(680, 20, null, 22.5,0xaaaaff);
			
			addChild(optellenA);
			addChild(optellenSymb);
			addChild(optellenB);
			addChild(optellenIs);
			addChild(optellenAntwoord);
			addChild(optellenIs2);
			addChild(optellenAntwoord2);
			
			optellenA.addEventListener(VerhoudingBox.TEXT_UPDATE, optellen);
			optellenB.addEventListener(VerhoudingBox.TEXT_UPDATE, optellen);
			optellen(null);
			
			aftrekkenA = new VerhoudingBox(20, 100, null, 22.5);
			aftrekkenSymb = new TextBox(180, 110, 40, 40, "-", 30);
			aftrekkenB = new VerhoudingBox(240, 100, null, 22.5);
			aftrekkenIs = new TextBox(400, 110, 40, 40, "=", 30);
			aftrekkenAntwoord = new VerhoudingBox(460, 100, null, 22.5,0xaaaaff);
			aftrekkenIs2 = new TextBox(620, 110, 40, 40, "=", 30);
			aftrekkenAntwoord2 = new VerhoudingBox(680, 100, null, 22.5,0xaaaaff);
			
			addChild(aftrekkenA);
			addChild(aftrekkenSymb);
			addChild(aftrekkenB);
			addChild(aftrekkenIs);
			addChild(aftrekkenAntwoord);
			addChild(aftrekkenIs2);
			addChild(aftrekkenAntwoord2);
			
			aftrekkenA.addEventListener(VerhoudingBox.TEXT_UPDATE, aftrekken);
			aftrekkenB.addEventListener(VerhoudingBox.TEXT_UPDATE, aftrekken);
			aftrekken(null);

			vermenigvuldigenA = new VerhoudingBox(20, 180, null, 22.5);
			vermenigvuldigenSymb = new TextBox(180, 190, 40, 40, "*", 30);
			vermenigvuldigenB = new VerhoudingBox(240, 180, null, 22.5);
			vermenigvuldigenIs = new TextBox(400, 190, 40, 40, "=", 30);
			vermenigvuldigenAntwoord = new VerhoudingBox(460, 180, null, 22.5,0xaaaaff);
			vermenigvuldigenIs2 = new TextBox(620, 190, 40, 40, "=", 30);
			vermenigvuldigenAntwoord2 = new VerhoudingBox(680, 180, null, 22.5,0xaaaaff);
			
			addChild(vermenigvuldigenA);
			addChild(vermenigvuldigenSymb);
			addChild(vermenigvuldigenB);
			addChild(vermenigvuldigenIs);
			addChild(vermenigvuldigenAntwoord);
			addChild(vermenigvuldigenIs2);
			addChild(vermenigvuldigenAntwoord2);
			
			vermenigvuldigenA.addEventListener(VerhoudingBox.TEXT_UPDATE, vermenigvuldigen);
			vermenigvuldigenB.addEventListener(VerhoudingBox.TEXT_UPDATE, vermenigvuldigen);

			delenA = new VerhoudingBox(20, 260, null, 22.5);
			delenSymb = new TextBox(180, 270, 40, 40, ":", 30);
			delenB = new VerhoudingBox(240, 260, null, 22.5);
			delenIs = new TextBox(400, 270, 40, 40, "=", 30);
			delenAntwoord = new VerhoudingBox(460, 260, null, 22.5,0xaaaaff);
			delenIs2 = new TextBox(620, 270, 40, 40, "=", 30);
			delenAntwoord2 = new VerhoudingBox(680, 260, null, 22.5, 0xaaaaff);
			delen(null);
			
			addChild(delenA);
			addChild(delenSymb);
			addChild(delenB);
			addChild(delenIs);
			addChild(delenAntwoord);
			addChild(delenIs2);
			addChild(delenAntwoord2);
			
			delenA.addEventListener(VerhoudingBox.TEXT_UPDATE, delen);
			delenB.addEventListener(VerhoudingBox.TEXT_UPDATE, delen);
			
			vereenvoudigenA = new VerhoudingBox(20, 340, null, 22.5);
			vereenvoudigenSymb = new TextBox(180, 350, 140, 40, "vereenvoudigen", 16);
			vereenvoudigenAntwoord = new VerhoudingBox(340, 340, null, 22.5, 0xaaaaff);
			
			
			addChild(vereenvoudigenA);
			addChild(vereenvoudigenSymb);
			addChild(vereenvoudigenAntwoord);
			
			vereenvoudigenA.addEventListener(VerhoudingBox.TEXT_UPDATE, vereenvoudigen);

			schalenA = new VerhoudingBox(20, 420, null, 22.5);
			schalenSymb = new TextBox(180, 430, 140, 40, "schalen", 16);
			schalenAntwoord = new VerhoudingBox(340, 420, null, 22.5);
			
			addChild(schalenA);
			addChild(schalenSymb);
			addChild(schalenAntwoord);
			
			
			schalenA.addEventListener(VerhoudingBox.TEXT_UPDATE, schalen);
			schalenAntwoord.addEventListener(VerhoudingBox.TEXT_UPDATE, schalen1);
			
			entierBox = new InputBox(20, 500, 'entier', 0,30);
			decimaalBox = new InputBox(180, 500, 'decimaal', 0, 30);
			repetendBox = new InputBox(340, 500, 'repetend', 0,30);
			getalIs = new TextBox(500, 510, 40, 40, "=", 30);
			getalAntwoord = new VerhoudingBox(560, 500, null, 22.5, 0xaaaaff);
			getalAntwoord2 = new OutputBox(720, 500, 220, "deling",0,22.5);
			
			addChild(entierBox);
			addChild(decimaalBox);
			addChild(repetendBox);
			addChild(getalIs);
			addChild(getalAntwoord);
			addChild(getalAntwoord2);
			
			entierBox.addEventListener(InputBox.TEXT_INVOER, getal);
			decimaalBox.addEventListener(InputBox.TEXT_INVOER, getal);
			repetendBox.addEventListener(InputBox.TEXT_INVOER, getal);

		}
		
		private function optellen(e:Event):void
		{
			a = new Breuk(optellenA.deeltal,optellenA.deler);
			b = new Breuk(optellenB.deeltal,optellenB.deler);
			
			antwoord = BreukOperaties.som(a, b)
			optellenAntwoord.setVerhouding(antwoord.teller, antwoord.noemer);
			
			antwoord2 = BreukOperaties.vereenvoudigen(antwoord);
			optellenAntwoord2.setVerhouding(antwoord2.teller, antwoord2.noemer);
			
		}
		
		private function aftrekken(e:Event):void
		{
			a = new Breuk(aftrekkenA.deeltal,aftrekkenA.deler);
			b = new Breuk(aftrekkenB.deeltal,aftrekkenB.deler);
			
			antwoord = BreukOperaties.verschil(a, b)
			aftrekkenAntwoord.setVerhouding(antwoord.teller, antwoord.noemer);
			
			antwoord2 = BreukOperaties.vereenvoudigen(antwoord);
			aftrekkenAntwoord2.setVerhouding(antwoord2.teller, antwoord2.noemer);
			
		}
		
		private function vermenigvuldigen(e:Event):void
		{
			a= new Breuk(vermenigvuldigenA.deeltal,vermenigvuldigenA.deler);
			b = new Breuk(vermenigvuldigenB.deeltal,vermenigvuldigenB.deler);
			
			antwoord = BreukOperaties.product(a, b)
			vermenigvuldigenAntwoord.setVerhouding(antwoord.teller, antwoord.noemer);
			
			antwoord2 = BreukOperaties.vereenvoudigen(antwoord);
			vermenigvuldigenAntwoord2.setVerhouding(antwoord2.teller, antwoord2.noemer);
			
		}
		
		private function delen(e:Event):void
		{
			a = new Breuk(delenA.deeltal,delenA.deler);
			b = new Breuk(delenB.deeltal,delenB.deler);
			
			antwoord = BreukOperaties.quotient(a, b)
			delenAntwoord.setVerhouding(antwoord.teller, antwoord.noemer);
			
			antwoord2 = BreukOperaties.vereenvoudigen(antwoord);
			delenAntwoord2.setVerhouding(antwoord2.teller, antwoord2.noemer);
			
		}
		
		private function vereenvoudigen(e:Event):void
		{
			a = new Breuk(vereenvoudigenA.deeltal, vereenvoudigenA.deler);
			antwoord = BreukOperaties.vereenvoudigen(a);
			vereenvoudigenAntwoord.setVerhouding(antwoord.teller, antwoord.noemer);
		}
		
		private function schalen(e:Event):void
		{
			va = new Verhouding(schalenA.deeltal, schalenA.deler);
			vb = new Verhouding(schalenAntwoord.deeltal, schalenAntwoord.deler);
			vb= VerhoudingOperaties.schalen(va, vb);
			schalenAntwoord.setVerhouding(vb.deeltal, vb.deler);
		}
		
		private function schalen1(e:Event):void
		{
			va = new Verhouding(schalenA.deeltal, schalenA.deler);
			vb = new Verhouding(schalenAntwoord.deeltal, schalenAntwoord.deler);
			if (schalenAntwoord.doel == "deler")
			{
				vb= VerhoudingOperaties.schalen(va, vb,"deeltal");
			}
			else
			{
				vb= VerhoudingOperaties.schalen(va, vb,"deler");
			}
			
			schalenAntwoord.setVerhouding(vb.deeltal, vb.deler);
		}
		
		private function getal(e:Event):void
		{
			var g:Getal = new Getal(Number(entierBox.waarde), Number(decimaalBox.waarde), Number(repetendBox.waarde));
			
			a = new Breuk(delenA.deeltal, delenA.deler);
			a = GetalOperaties.getalNaarBreuk(g);
			getalAntwoord.setVerhouding(a.teller, a.noemer);
			getalAntwoord2.setWaarde(a.teller / a.noemer);
		}
	}

}
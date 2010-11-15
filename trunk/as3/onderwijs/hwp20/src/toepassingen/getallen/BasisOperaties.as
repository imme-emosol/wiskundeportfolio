package toepassingen.getallen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	import wiskunde.assets.Raster;
	import wiskunde.assets.TextBox;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class BasisOperaties extends Sprite
	{
		public var optellenA:InputBox;
		public var optellenB:InputBox;
		public var optellenSymbool:TextBox;
		public var optellenIs:TextBox;
		public var optellenAntwoord:OutputBox;

		public var aftrekkenA:InputBox;
		public var aftrekkenB:InputBox;
		public var aftrekkenSymbool:TextBox;
		public var aftrekkenIs:TextBox;
		public var aftrekkenAntwoord:OutputBox;
		

		public var vermenigvuldigenA:InputBox;
		public var vermenigvuldigenB:InputBox;
		public var vermenigvuldigenSymbool:TextBox;
		public var vermenigvuldigenIs:TextBox;
		public var vermenigvuldigenAntwoord:OutputBox;		

		public var delenA:InputBox;
		public var delenB:InputBox;
		public var delenSymbool:TextBox;
		public var delenIs:TextBox;
		public var delenAntwoord:OutputBox;

		public var moduloA:InputBox;
		public var moduloB:InputBox;
		public var moduloSymbool:TextBox;
		public var moduloIs:TextBox;
		public var moduloAntwoord:OutputBox;
		
		public var afrondingA:InputBox;
		public var afrondingB:InputBox;
		public var afrondingSymbool:TextBox;
		public var afrondingIs:TextBox;
		public var afrondingAntwoord:OutputBox;		
	
				
		public var ggdA:InputBox;
		public var ggdB:InputBox;
		public var ggdSymbool:TextBox;
		public var ggdIs:TextBox;
		public var ggdAntwoord:OutputBox;		
		
		public function BasisOperaties() 
		{	
			optellenA = new InputBox(20, 20, null, 0, 30);
			optellenSymbool = new TextBox(180, 20, 40, 40, "+", 30);
			optellenB = new InputBox(240, 20, null, 0, 30);
			optellenIs = new TextBox(400, 20, 40, 40, "=", 30);
			optellenAntwoord = new OutputBox(460, 20, 400, null,0,30);
			
			addChild(optellenA);
			addChild(optellenSymbool);
			addChild(optellenB);
			addChild(optellenIs);
			addChild(optellenAntwoord);
			
			optellenA.addEventListener(InputBox.TEXT_INVOER, optellen);
			optellenB.addEventListener(InputBox.TEXT_INVOER, optellen);
			
			aftrekkenA = new InputBox(20, 100, null, 0, 30);
			aftrekkenSymbool = new TextBox(180, 100, 40, 40, "-", 30);
			aftrekkenB = new InputBox(240, 100, null, 0, 30);
			aftrekkenIs = new TextBox(400, 100, 40, 40, "=", 30);
			aftrekkenAntwoord = new OutputBox(460, 100, 400, null,0,30);
			
			addChild(aftrekkenA);
			addChild(aftrekkenSymbool);
			addChild(aftrekkenB);
			addChild(aftrekkenIs);
			addChild(aftrekkenAntwoord);
			
			aftrekkenA.addEventListener(InputBox.TEXT_INVOER, aftrekken);
			aftrekkenB.addEventListener(InputBox.TEXT_INVOER, aftrekken);
			
			vermenigvuldigenA = new InputBox(20, 180, null, 1, 30);
			vermenigvuldigenSymbool = new TextBox(180, 180, 40, 40, "*", 30);
			vermenigvuldigenB = new InputBox(240, 180, null, 1, 30);
			vermenigvuldigenIs = new TextBox(400, 180, 40, 40, "=", 30);
			vermenigvuldigenAntwoord = new OutputBox(460, 180, 400, null,1,30);
			
			addChild(vermenigvuldigenA);
			addChild(vermenigvuldigenSymbool);
			addChild(vermenigvuldigenB);
			addChild(vermenigvuldigenIs);
			addChild(vermenigvuldigenAntwoord);
			
			vermenigvuldigenA.addEventListener(InputBox.TEXT_INVOER, vermenigvuldigen);
			vermenigvuldigenB.addEventListener(InputBox.TEXT_INVOER, vermenigvuldigen);				

			delenA = new InputBox(20, 260, null, 1, 30);
			delenSymbool = new TextBox(180, 260, 40, 40, ":", 30);
			delenB = new InputBox(240, 260, null, 1, 30);
			delenIs = new TextBox(400, 260, 40, 40, "=", 30);
			delenAntwoord = new OutputBox(460, 260, 400, null,1,30);
			
			addChild(delenA);
			addChild(delenSymbool);
			addChild(delenB);
			addChild(delenIs);
			addChild(delenAntwoord);
			
			delenA.addEventListener(InputBox.TEXT_INVOER, delen);
			delenB.addEventListener(InputBox.TEXT_INVOER, delen);				

			moduloA = new InputBox(20, 340, null, 1, 30);
			moduloSymbool = new TextBox(180, 340, 40, 40, "%", 30);
			moduloB = new InputBox(240, 340, null, 1, 30);
			moduloIs = new TextBox(400, 340, 40, 40, "=", 30);
			moduloAntwoord = new OutputBox(460, 340, 400, null,0,30);
			
			addChild(moduloA);
			addChild(moduloSymbool);
			addChild(moduloB);
			addChild(moduloIs);
			addChild(moduloAntwoord);
			
			moduloA.addEventListener(InputBox.TEXT_INVOER, modulo);
			moduloB.addEventListener(InputBox.TEXT_INVOER, modulo);			

			afrondingSymbool = new TextBox(20, 420, 140, 40, "afronden", 30);
			afrondingA = new InputBox(180, 420, null, 1, 30);
			afrondingB = new InputBox(340, 420, null, 1, 30);
			afrondingIs = new TextBox(500, 420, 40, 40, "=", 30);
			afrondingAntwoord = new OutputBox(560, 420, 300, null,1,30);
			
			addChild(afrondingA);
			addChild(afrondingSymbool);
			addChild(afrondingB);
			addChild(afrondingIs);
			addChild(afrondingAntwoord);
			
			afrondingA.addEventListener(InputBox.TEXT_INVOER, afronding);
			afrondingB.addEventListener(InputBox.TEXT_INVOER, afronding);
			
			ggdSymbool = new TextBox(20, 500, 140, 40, "ggd", 30);
			ggdA = new InputBox(180, 500, null, 1, 30);
			ggdB = new InputBox(340, 500, null, 1, 30);
			ggdIs = new TextBox(500, 500, 40, 40, "=", 30);
			ggdAntwoord = new OutputBox(560, 500, 300, null,1,30);
			
			addChild(ggdA);
			addChild(ggdSymbool);
			addChild(ggdB);
			addChild(ggdIs);
			addChild(ggdAntwoord);
			
			ggdA.addEventListener(InputBox.TEXT_INVOER, ggd);
			ggdB.addEventListener(InputBox.TEXT_INVOER, ggd);			
			
			
			}
		
		private function optellen(e:Event):void
		{
			optellenAntwoord.setWaarde(GetalOperaties.som(optellenA.waarde, optellenB.waarde));
		}
		
		private function aftrekken(e:Event):void
		{
			aftrekkenAntwoord.setWaarde(GetalOperaties.verschil(aftrekkenA.waarde, aftrekkenB.waarde));
		}

		private function vermenigvuldigen(e:Event):void
		{
			vermenigvuldigenAntwoord.setWaarde(GetalOperaties.product(vermenigvuldigenA.waarde, vermenigvuldigenB.waarde));
		}
		
		private function delen(e:Event):void
		{
			delenAntwoord.setWaarde(GetalOperaties.quotient(delenA.waarde, delenB.waarde));
		}
		
		private function modulo(e:Event):void
		{
			moduloAntwoord.setWaarde(GetalOperaties.modulo(moduloA.waarde, moduloB.waarde));
		}
		
		private function afronding(e:Event):void
		{
			afrondingAntwoord.setWaarde(GetalOperaties.afronding(afrondingA.waarde, afrondingB.waarde));
		}
		
		private function ggd(e:Event):void
		{
			ggdAntwoord.setWaarde(GetalOperaties.ggd(ggdA.waarde, ggdB.waarde));
		}

		
	}

}
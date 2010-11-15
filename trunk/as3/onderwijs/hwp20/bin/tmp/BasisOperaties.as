package toepassingen.getallen 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	import wiskunde.assets.TextBox;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class BasisOperaties extends Sprite
	{
		private  var optellenA:InputBox;
		private  var optellenSymb:TextBox;
		private  var optellenB:InputBox;
		private  var optellenIs:TextBox;
		private  var optellenAntwoord:OutputBox;
		
		private  var aftrekkenA:InputBox;
		private  var aftrekkenSymb:TextBox;
		private  var aftrekkenB:InputBox;
		private  var aftrekkenIs:TextBox;
		private  var aftrekkenAntwoord:OutputBox;

		private  var vermenigvuldigenA:InputBox;
		private  var vermenigvuldigenSymb:TextBox;
		private  var vermenigvuldigenB:InputBox;
		private  var vermenigvuldigenIs:OutputBox;
		private  var vermenigvuldigenAntwoord:TextBox;
		
		private  var delenA:InputBox;
		private  var delenSymb:TextBox;
		private  var delenB:InputBox;
		private  var delenIs:TextBox;
		private  var delenAntwoord:OutputBox;
		
		private  var moduloA:InputBox;
		private  var moduloSymb:TextBox;
		private  var moduloB:InputBox;
		private  var moduloIs:OutputBox;
		private  var moduloAntwoord:TextBox		
		
		private  var afrondenA:InputBox;
		private  var afrondenSymb:TextBox;
		private  var afrondenB:InputBox;
		private  var afrondenIs:OutputBox;
		private  var afrondenAntwoord:TextBox;
		
		
		public function BasisOperaties() 
		{
			optellenA = new InputBox(20, 20);
			//optellenSymb = new OutputBox(180, 20, 40, null, "+");
			optellenSymb = new TextBox(180, 20, 40, 40, "+");
			optellenB = new InputBox(240, 20);
			//optellenIs= new OutputBox(400, 20, 40, null, "=");
			//optellenAntwoord= new OutputBox(460, 20, 400,null,"0");
			addChild(optellenA);
			addChild(optellenSymb);
			addChild(optellenB);
			addChild(optellenIs);
			addChild(optellenAntwoord);
			optellenA.addEventListener(InputBox.TEXT_INVOER, optellen);
			optellenB.addEventListener(InputBox.TEXT_INVOER, optellen);
			
			aftrekkenA = new InputBox(20, 80);
			//aftrekkenSymb = new OutputBox(180, 80, 40, null, "-");
			aftrekkenB = new InputBox(240, 80);
			//aftrekkenIs= new OutputBox(400, 80, 40, null, "=");
			aftrekkenAntwoord= new OutputBox(460, 80, 400,null,0);
			addChild(aftrekkenA);
			addChild(aftrekkenSymb);
			addChild(aftrekkenB);
			addChild(aftrekkenIs);
			addChild(aftrekkenAntwoord);
			aftrekkenA.addEventListener(InputBox.TEXT_INVOER, aftrekken);
			aftrekkenB.addEventListener(InputBox.TEXT_INVOER, aftrekken);
			
			
			vermenigvuldigenA = new InputBox(20, 140);
			//vermenigvuldigenSymb = new OutputBox(180, 140, 40, null, "*");
			vermenigvuldigenB = new InputBox(240, 140);
			//vermenigvuldigenIs= new OutputBox(400, 140, 40, null, "=");
			vermenigvuldigenAntwoord = new OutputBox(460, 150, 140, null, 0);
			//vermenigvuldigenAntwoord= new OutputBox(460, 140, 400,null,0);
			addChild(vermenigvuldigenA);
			addChild(vermenigvuldigenSymb);
			addChild(vermenigvuldigenB);
			addChild(vermenigvuldigenIs);
			addChild(vermenigvuldigenAntwoord);
			vermenigvuldigenA.addEventListener(InputBox.TEXT_INVOER, vermenigvuldigen);
			vermenigvuldigenB.addEventListener(InputBox.TEXT_INVOER, vermenigvuldigen);

			delenA = new InputBox(20, 200);
			//delenSymb = new OutputBox(180, 200, 40, null, ":");
			delenB = new InputBox(240, 200);
			//delenIs= new OutputBox(400, 200, 40, null, "=");
			delenAntwoord= new OutputBox(460, 200, 400,null,Infinity);
			addChild(delenA);
			addChild(delenSymb);
			addChild(delenB);
			addChild(delenIs);
			addChild(delenAntwoord);
			delenA.addEventListener(InputBox.TEXT_INVOER, delen);
			delenB.addEventListener(InputBox.TEXT_INVOER, delen);

			moduloA = new InputBox(20, 260);
			//moduloSymb = new OutputBox(180,260, 40, null, "%");
			moduloB = new InputBox(240, 260);
			//moduloIs= new OutputBox(400, 260, 40, null, "=");
			moduloAntwoord= new OutputBox(460, 260, 400,null,0);
			addChild(moduloA);
			addChild(moduloSymb);
			addChild(moduloB);
			addChild(moduloIs);
			addChild(moduloAntwoord);
			moduloA.addEventListener(InputBox.TEXT_INVOER, modulo);
			moduloB.addEventListener(InputBox.TEXT_INVOER, modulo);
			
			afrondenA = new InputBox(20,320);
			//afrondenSymb = new OutputBox(180, 320, 40, null, "[ ]");
			afrondenB = new InputBox(240, 320);
			//afrondenIs= new OutputBox(400, 320, 40, null, "=");
			afrondenAntwoord= new OutputBox(460, 320, 400,null,0);
			addChild(afrondenA);
			addChild(afrondenSymb);
			addChild(afrondenB);
			addChild(afrondenIs);
			addChild(afrondenAntwoord);
			afrondenA.addEventListener(InputBox.TEXT_INVOER, afronden);
			afrondenB.addEventListener(InputBox.TEXT_INVOER, afronden);			
			
			
			
		}
		
		private function optellen(e:Event):void
		{
			optellenAntwoord.setTekst(GetalOperaties.som(optellenA.waarde, optellenB.waarde));
		}
		
		private function aftrekken(e:Event):void
		{
			aftrekkenAntwoord.setTekst(GetalOperaties.verschil(aftrekkenA.waarde, aftrekkenB.waarde));
		}
		
		private function vermenigvuldigen(e:Event):void
		{
			vermenigvuldigenAntwoord.setTekst(GetalOperaties.product(vermenigvuldigenA.waarde, vermenigvuldigenB.waarde));
		}

		private function delen(e:Event):void
		{
			delenAntwoord.setTekst(GetalOperaties.quotient(delenA.waarde, delenB.waarde));
		}

		private function modulo(e:Event):void
		{
			moduloAntwoord.setTekst(GetalOperaties.modulo(moduloA.waarde, moduloB.waarde));
		}

		private function afronden(e:Event):void
		{
			afrondenAntwoord.setTekst(GetalOperaties.afronding(afrondenA.waarde, afrondenB.waarde));
		}

	}

}
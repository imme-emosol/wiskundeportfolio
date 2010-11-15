package toepassingen.functies 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import wiskunde.assets.Basis;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.functies.KwadratischeFunctie;
	import wiskunde.objecten.functies.LineaireFunctie;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.FunctieOperaties;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class LijnenVermenigvuldigen extends Basis
	{
		public var P:Punt;
		public var Q:Punt;
		public var R:Punt;
		public var S:Punt;
		
		public var f:LineaireFunctie;
		public var g:LineaireFunctie;
		
		public var grafiek_f:Sprite;
		public var grafiek_g:Sprite
		
		public var fg:KwadratischeFunctie;
		public var grafiek_fg:Sprite;
		
		public var fa:OutputBox;
		public var fb:OutputBox;
		public var ga:OutputBox;
		public var gb:OutputBox;
		public var fga:OutputBox;
		public var fgb:OutputBox;
		public var fgc:OutputBox;
		
		
		public function LijnenVermenigvuldigen() 
		{
			
			fa = new OutputBox(0, 0, 40, "f_a", 0, 30);
			P = new Punt(200, 200);
			P.tekenPunt(5, 0xff0000);
			P.sleepPunt();
			
			
			Q= new Punt(-200, -200);
			Q.tekenPunt(5, 0x0000ff);
			Q.sleepPunt();
			
			R = new Punt(-200, 200);
			R.tekenPunt(5, 0xffff00);
			R.sleepPunt();
			
			
			S= new Punt(200, -200);
			S.tekenPunt(5, 0x00ff00);
			S.sleepPunt();

			
			
			f = FunctieOperaties.linFunctieMetTweePunten(P, Q);
			grafiek_f = f.teken( -480, 480);
			grafiek_f.alpha = 0.2;
			rooster.addChild(grafiek_f);
			
			g = FunctieOperaties.linFunctieMetTweePunten(R, S);
			grafiek_g = g.teken( -480, 480, 1, 0x000000);
			grafiek_g.alpha = 0.2;
			rooster.addChild(grafiek_g);
			
			fg = FunctieOperaties.productLinFuncties(f, g);
			grafiek_fg = fg.teken( -480, 480,0.01,0xff0000);
			rooster.addChild(grafiek_fg);
			
			rooster.addChild(P);
			rooster.addChild(Q);
			rooster.addChild(R);
			rooster.addChild(S);
			
			fa = new OutputBox(0, 0, 140, "f_a", f.params[0], 30);
			addChild(fa);
			fb = new OutputBox(140, 0, 140, "f_b", f.params[1], 30);
			addChild(fb);
			

			ga = new OutputBox(680, 0, 140, "g_a", g.params[0], 30);
			addChild(ga);
			gb = new OutputBox(820, 0, 140, "g_b", g.params[1], 30);
			addChild(gb);
			
			fga = new OutputBox(0, 540, 140, "fg_a", fg.params[0], 30);
			addChild(fga);
			fgb = new OutputBox(140, 540, 140, "fg_b", fg.params[1], 30);
			addChild(fgb);

			fgc = new OutputBox(280, 540, 140, "fg_c", fg.params[1], 30);
			addChild(fgc);

			
			
			P.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			P.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			
			Q.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			Q.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);

			R.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			R.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			
			S.addEventListener(MouseEvent.MOUSE_DOWN, beginUpdate);
			S.addEventListener(MouseEvent.MOUSE_UP, stopUpdate);
			
			}
		
		private function beginUpdate(e:MouseEvent):void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function stopUpdate(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			rooster.removeChild(grafiek_f);
			f = FunctieOperaties.linFunctieMetTweePunten(P, Q);
			grafiek_f = f.teken( -480, 480, 1);
			grafiek_f.alpha = 0.2;
			rooster.addChild(grafiek_f)
			rooster.setChildIndex(grafiek_f,0);
			
			rooster.removeChild(grafiek_g);
			
			g = FunctieOperaties.linFunctieMetTweePunten(R, S);
			grafiek_g = g.teken( -480, 480, 1, 0x000000);
			grafiek_g.alpha = 0.2;
			rooster.addChild(grafiek_g);
			rooster.setChildIndex(grafiek_g,0);
			
			rooster.removeChild(grafiek_fg);
			fg = FunctieOperaties.productLinFuncties(f, g);
			grafiek_fg = fg.teken( -480, 480,0.01,0xff0000);
			rooster.addChild(grafiek_fg);
			rooster.setChildIndex(grafiek_fg, 0);
			
			fa.setWaarde(GetalOperaties.afronding(f.params[0],3));
			fb.setWaarde(GetalOperaties.afronding(f.params[1],1));
			ga.setWaarde(GetalOperaties.afronding(g.params[0],3));
			gb.setWaarde(GetalOperaties.afronding(g.params[1], 1));
			fga.setWaarde(GetalOperaties.afronding(fg.params[0], 3));
			fgb.setWaarde(GetalOperaties.afronding(fg.params[1], 1));
			fgc.setWaarde(GetalOperaties.afronding(fg.params[2], 0));
			
		}
		
	}

}
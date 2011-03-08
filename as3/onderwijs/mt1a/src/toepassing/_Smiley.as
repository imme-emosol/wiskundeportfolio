package toepassing 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Smiley extends Sprite
	{
		public var P:Punt;
		public var Q:Punt;
		public var R:Punt;
		public var S:Punt;
		public var T:Punt;
		public var U:Punt;
		
		
		public function Smiley() 
		{
			//P is de kop
			P = new Punt(960/2, 600/2);
			P.tekenPunt(300,0xffff00);
			addChild(P);
			
			//Q is het linker oog
			Q = new Punt(960/2-100, 200);
			Q.tekenPunt(30, 0x0000ff);
			Q.sleepPunt();
			addChild(Q);
			
			//R is het rechter oog
			R = new Punt(960/2+100, 200);
			R.tekenPunt(30, 0x0000ff);
			R.sleepPunt();
			addChild(R);
			
			//S is de linker mondhoek
			S = new Punt(960/2-200, 600/2+100);
			S.tekenPunt(10, 0xffff00);
			S.sleepPunt();
			addChild(S);
			
			//T is het controlepunt van de mond
			T = new Punt(960/2, 600/2+200);
			T.tekenPunt(10, 0xffff00);
			T.sleepPunt();
			addChild(T);
			
			//U is de rechter mondhoek
			U = new Punt(960/2+200, 600/2+100);
			U.tekenPunt(10, 0xffff00);
			U.sleepPunt();
			addChild(U);
			
			addEventListener(Event.EXIT_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			this.graphics.clear();
			this.graphics.lineStyle(10);
			this.graphics.moveTo(S.x, S.y);
			this.graphics.curveTo(T.x, T.y, U.x, U.y);
			
		}
	}

}
package  
{
	import wiskunde.assets.Basis;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.Lijn;
	import wiskunde.objecten.Punt;
	import wiskunde.operaties.LijnOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Temp extends Basis
	{
		private var p:Punt;
		private var q:Punt;
		private var box:OutputBox;
		private var l:Lijn;
		
		public function Temp() 
		{
			p = new Punt(100, 100);
			p.tekenPunt(10, 0x0000ff);
			rooster.addChild(p);
			p.sleepPunt();
			
			q = new Punt( -100, -100);
			q.tekenPunt(10, 0xff0000);
			q.sleepPunt();
			
			rooster.addChild(q);
			
			l = new Lijn(5, 5, 0);
			
			
			
			LijnOperaties.lijnDoorTweePunten(l, p, q);
			l.tekenLijn();
			rooster.addChild(l);
			box = new OutputBox(50,50,100,"box",500);
			addChild(box);
			
			
		}
		
	}

}
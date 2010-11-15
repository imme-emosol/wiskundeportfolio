package wiskunde.operaties 
{
	import toepassingen.punten.PuntTekenen;
	import wiskunde.objecten.functies.KwadratischeFunctie;
	import wiskunde.objecten.functies.LineaireFunctie;
	import wiskunde.objecten.Punt;
	/**
	 * operaties met Functies
	 * @author Jelle Sjollema
	 */
	public class FunctieOperaties
	{
		public static function linFunctieMetTweePunten(P:Punt, Q:Punt):LineaireFunctie
		{
			var f:LineaireFunctie;
			
			var rc:Number = PuntOperaties.dy(P, Q) / PuntOperaties.dx(P, Q);
			var b:Number = P.y - (rc * P.x);
			
			f = new LineaireFunctie(rc, b);
			return f;
		}
		
		public static function productLinFuncties(f:LineaireFunctie, g:LineaireFunctie):KwadratischeFunctie
		{
			var fa:Number = f.params[0];
			var ga:Number = g.params[0];
			var fb:Number = f.params[1];
			var gb:Number = g.params[1];
			
			var antwoord:KwadratischeFunctie = new KwadratischeFunctie(fa*ga, (gb*fa)+(fb*ga),fb*gb);
			return antwoord;
		}

		
		
		
	}

}
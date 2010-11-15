package wiskunde.operaties 
{
	import wiskunde.objecten.Punt;
	import wiskunde.objecten.Lijn;
	import wiskunde.objecten.WVector;
	/**
	 * Operaties met lijnen 
	 * @author Jelle Sjollema
	 */
	public class LijnOperaties
	{
		/**
		 * Geeft lijn l de parameters zodat de lijn door de punten P en Q loopt
		 * @param	l
		 * @param	P
		 * @param	Q
		 */
		public static function lijnDoorTweePunten(l:Lijn, P:Punt, Q:Punt):void
		{
			l.setLijn(P.y - Q.y, Q.x - P.x, NaN);
			l.berekenC(P);
		}
		
		/**
		 * Geeft het snijpunt van lijnen l en m
		 * @param	snijpunt
		 * @param	l
		 * @param	m
		 */
		public static function snijpunt(snijpunt:Punt, l:Lijn, m:Lijn):void
		{
			snijpunt.x = (m.b*l.c-m.c*l.b) / (l.a*m.b -m.a*l.b);
			snijpunt.y = (m.c*l.a-l.c*m.a) / (l.a*m.b-m.a*l.b);

		}

		/**
		 * zet loodlijn loodrecht op lijn l en door punt P
		 * @param	P
		 * @param	l
		 * @param	loodlijn
		 */
		public static function loodlijn(P:Punt, l:Lijn, loodlijn:Lijn):void
		{
			loodlijn.c = NaN;
			loodlijn.a = -l.b;
			loodlijn.b = l.a;
			loodlijn.berekenC(P);
		}
		
		/**
		 * Onderzoekt of punt P boven lijn l ligt.
		 * @param	l
		 * @param	P
		 * @return
		 */
		public static function isPuntBovenLijn(l:Lijn, P:Punt):Boolean
		{
			var antwoord:Boolean = false;
			if ((P.x * l.a) + (l.b * P.y) > l.c)
			{
				antwoord = true;
			}
			return antwoord;
		}
		
		/**
		 * Geeft lijn l de kleinst mogelijke waarden voor a en b
		 * @param	l
		 */
		public static function normeren(l:Lijn):void
		{
			var r:Number = GetalOperaties.pythagoras(l.a, l.b);
			l.a = l.a / r;
			l.b = l.b / r;
			l.c	= l.c / r;
		}
		
		/**
		 * Geeft lijn l de lijnvoorstelling door middel van de normaal op de lijn
		 * @param	l
		 * @param	P
		 * @param	normaal
		 */
		public static function maakLijnVanNorrmaal(l:Lijn, P:Punt, normaal:WVector):void
		{
			l.setLijn( normaal.dx, normaal.dy, NaN);
			l.berekenC(P);
		}
		
		/**
		 * Geeft een lijnvoorstelling in de vorm van een array met achtereenvolgens:
		 * een normaalvector op lijn l en de afstand tot de oorsprong
		 * @return
		 */
		public static function hessiaanseNormaalVorm(P:Punt):Array
		{
			var antwoord:Array = new Array();
			var O:Punt = new Punt(0, 0);
			var v:WVector = new WVector(NaN, NaN);
			
			VectorOperaties.maakVectorVanTweePunten(O,P,v);
			
			
			var i:WVector = VectorOperaties.normeren(v);
			antwoord.push(i);
			antwoord.push(v.r);
			
			return antwoord;
		}
		
	}

}
package wiskunde.operaties 
{
	import wiskunde.objecten.Punt;
	import wiskunde.objecten.Lijn;
	import wiskunde.objecten.WVector;
	/**
	 * Operaties met vectoren
	 * @author Jelle Sjollema
	 */
	public class VectorOperaties
	{
		/**
		 * maakt van vector v een eenheidsvector
		 * @param	v
		 * @return
		 */
		public static function normeren(v:WVector):WVector
		{
			var antwoord:WVector = new WVector(v.dx/v.r, v.dy/v.r);
			return antwoord;
		}
		
		
		/**
		 * Roteert vector v 9over een hoek van 90 graden
		 * @param	v
		 * @return
		 */
		public static function orthogonaliseren(v:WVector):WVector
		{
			var antwoord:WVector = new WVector( -v.dy, v.dx);
			return antwoord;
		}
		
		

		/**
		 * Roteert vector v over een hoek van -90 graden
		 * @param	v
		 * @return
		 */
		public static function orthogonaliserenInv(v:WVector):WVector
		{
			var antwoord:WVector = new WVector( v.dy, -v.dx);
			return antwoord;
		}
		
		/**
		 * Maakt van vector v een normaalvector
		 * @param	v
		 * @return
		 */
		public static function normaliseren(v:WVector):WVector
		{
			var antwoord:WVector = orthogonaliseren(normeren(v));
			return antwoord;
		}
		
		public static function vermenigvuldigenMetFactor(a:Number, v:WVector):void
		{
			v.setVector(v.dx * a, v.dy*a);
		}
		
		/**
		 * Geeft de vector v de kentallen van de vector tussen de punten P en Q
		 * @param	P
		 * @param	Q
		 * @param	v
		 */
		public static function maakVectorVanTweePunten(P:Punt, Q:Punt, v:WVector):void
		{
			v.setVector(Q.x - P.x, Q.y - P.y);
			v.x = P.x;
			v.y = P.y;
		}
		
		/**
		 * Bepaalt het inproduct tussen vectoren v en w
		 * @param	v
		 * @param	w
		 * @return
		 */
		static public function inproduct(v:WVector, w:WVector):Number
		{
			var antwoord:Number = (v.dx * w.dx) + (v.dy * w.dy);
			return antwoord;
		}
		
		/**
		 * Geeft in een Array de kentallen van de twee vectoren van de ontbinding van vector v op lijn l
		 * @param	l
		 * @param	v
		 * @return
		 */
		public static function ontbindenOpLijn(l:Lijn, v:WVector):Array
		{
			 var i:WVector;
			 var j:WVector = new WVector(l.a, l.b);
			
			 i = VectorOperaties.orthogonaliserenInv(j);
			 
			 i = normeren(i);
			 j = normeren(j);
			 
			 var ip:Number = inproduct(i, v);
			 var jp:Number = inproduct(j, v);
			 
			 vermenigvuldigenMetFactor(ip, i);
			 vermenigvuldigenMetFactor(jp, j);
			 
			var antwoord:Array = new Array();
			antwoord.push(i.dx);
			antwoord.push(i.dy);
			antwoord.push(j.dx);
			antwoord.push(j.dy);
			return antwoord;
		}

		
	}

}
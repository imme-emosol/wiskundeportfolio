package wiskunde.operaties 
{
	import wiskunde.objecten.WMatrix;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class MatrixOperaties
	{
		
		public function MatrixOperaties() 
		{
			
		}
		
		static public function product(M:WMatrix, N:WMatrix):WMatrix
		{
			var antwoord:WMatrix = new WMatrix(M.rijen, N.kolommen,false);;
			//antwoord 
			
			if (M.kolommen == N.rijen)
			{
				for (var i:int = 0; i <= antwoord.kolommen-1; i++)
				{
					for (var j:int =0; j <= antwoord.rijen-1; j++)
					{
						berekenWaarde(i, j);
					}
				}
				
			}
			else
			{
				//
			}
			
			return(antwoord);
			
			function berekenWaarde(i:int, j:int):void
			{
				
				var kolom:int = i + 1;
				var rij:int = j + 1;
				var waarde:Number = 0;
				
				var rijM:Array = M.geefRij(rij);
				//trace(rijM.toString());
				var kolomN:Array = N.geefKolom(kolom);
				//trace(kolomN.toString());
				
				for (var teller:int = 0; teller < rijM.length; teller++)
				{
					//trace(rijM[teller]);
					waarde += Number(rijM[teller]) * Number(kolomN[teller]);
				}
				antwoord.setWaarde(rij, kolom, waarde);				
			}
			
		}
		
	}

}
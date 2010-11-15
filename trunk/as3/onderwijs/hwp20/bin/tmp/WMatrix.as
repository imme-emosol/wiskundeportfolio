package wiskunde.objecten
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.sampler.NewObjectSample;
	import wiskunde.assets.MatrixBox;
	/**
	 * Legt data vast in de vorm van een Matrix
	 * @author Jelle Sjollema
	 */
	public class WMatrix extends Sprite
	{
		public var matrix:Array;
		public var rijen:int;
		public var kolommen:int;
		public static const MATRIX_UPDATE:String = "Matrix_Update";
		
		
		public function WMatrix(rijen:int, kolommen:int) 
		{
			this.rijen = rijen;
			this.kolommen = kolommen;
			this.matrix = new Array();
			

			for (var i:int = 1; i <= rijen; i++)
			{
				var vulArray:Array = new Array();
				for (var j:uint = 0; j < kolommen; j++)
				{
					vulArray[j] = 0;
				}
				voerRijIn(i, vulArray);
			}
			addEventListener(WMatrix.MATRIX_UPDATE, update);
			

		}
		
		public function update(e:Event):void
		{
			trace(matrix.toString());
		}
		
		public function voerRijIn(rij:int, waarden:Array):void
		{
			if (rij>0 && rij <= rijen&& waarden.length == kolommen)
			{
				matrix.splice(rij-1 ,1, waarden);
			}
			else
			{
				trace('dit mag niet');
			}
			dispatchEvent(new Event(WMatrix.MATRIX_UPDATE));
		}
		
		public function veranderWaarde(rij:int, kolom:int, waarde:Number):void
		{
			matrix[rij][kolom] = waarde;
			dispatchEvent(new Event(WMatrix.MATRIX_UPDATE));
		}
		
	}

}
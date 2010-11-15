package toepassingen.matrices 
{
	import flash.events.Event;
	import flash.geom.Matrix;
	import gonio.SinCos;
	import wiskunde.assets.Afbeelding;
	import wiskunde.assets.Basis;
	import wiskunde.objecten.WMatrix;
	import flash.display.BlendMode;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TransformatieMatrix extends Basis
	{
		public var afbeelding:Afbeelding;
		public var afbeeldingOorsprong:Afbeelding;
		public var matrix:Matrix;
		public var wmatrix:WMatrix;
		public var sincos:SinCos;
		
		public function TransformatieMatrix() 
		{
			setRooster(480, 300, 0.2, 20, 20);
			sincos = new SinCos();
			sincos.y = 530;
			addChild(sincos);
			wmatrix = new WMatrix(3, 3);
			wmatrix.voerRijIn(1, new Array(1, 0, 0));
			wmatrix.voerRijIn(2, new Array(0, 1, 0));
			wmatrix.voerRijIn(3, new Array(0, 0, 1));
			wmatrix.tekenKader();
			addChild(wmatrix);
			matrix = new Matrix();
			vulMatrix();
			
			var url:String = "http://wiki.wiskundeportfolio.nl/logo/wisportfolio_logo.png";
			afbeelding = new Afbeelding(true);
			afbeelding.importeerAfbeelding(url);
			afbeelding.addEventListener(Afbeelding.AFBEELDING_GELADEN, geladen);
			stage.addEventListener(WMatrix.MATRIX_UPDATE, update);
			
			afbeeldingOorsprong = new Afbeelding(true);
			afbeeldingOorsprong.importeerAfbeelding(url);
		}
		
		private function geladen(e:Event):void
		{
			rooster.addChild(afbeeldingOorsprong);
			rooster.addChild(afbeelding);
			
			afbeelding.alpha =0.6;
			afbeelding.blendMode = BlendMode.MULTIPLY
			
			
		}
		
		private function update(e:Event):void
		{
			vulMatrix();
			afbeelding.transform.matrix = matrix;
		}
		
		private function vulMatrix():void
		{
			matrix.a = wmatrix.geefWaarde(1, 1);
			matrix.b = wmatrix.geefWaarde(1, 2);
			matrix.tx = wmatrix.geefWaarde(1, 3);
			matrix.c = wmatrix.geefWaarde(2, 1);
			matrix.d = wmatrix.geefWaarde(2, 2);
			matrix.ty = wmatrix.geefWaarde(2, 3);
			
		}
		
	}

}
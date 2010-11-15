package toepassingen.matrices 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.objecten.WMatrix;
	import wiskunde.operaties.MatrixOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class MatricesVermenigvuldigen extends Sprite
	{
		public var M:WMatrix;
		public var Mrijen:Number;
		public var Mkolommen:Number
		public var MrijenBox:InputBox;
		public var MkolommenBox:InputBox;
		
		public var N:WMatrix; 
		public var Nrijen:Number;
		public var Nkolommen:Number
		public var NrijenBox:InputBox;
		public var NkolommenBox:InputBox;
		
		public var NM:WMatrix;
		
		public function MatricesVermenigvuldigen()
		{
			MkolommenBox = new InputBox(160, 10, 'M kolommen', 0);
			MrijenBox = new InputBox(10, 70, 'M rijen', 0);
			
			NkolommenBox = new InputBox(560, 10, 'N kolommen', 0);
			NrijenBox = new InputBox(420, 70, 'N rijen', 0);
			
			
			addChild(MrijenBox)
			addChild(MkolommenBox)
			addChild(NrijenBox)
			addChild(NkolommenBox)
			
			MkolommenBox.box.addEventListener(Event.CHANGE, TekenScherm);
			MrijenBox.box.addEventListener(Event.CHANGE, TekenScherm);
			NkolommenBox.box.addEventListener(Event.CHANGE, TekenScherm);
			NrijenBox.box.addEventListener(Event.CHANGE, TekenScherm);
		}
		
		public function TekenScherm(e:Event):void 
		{
			
			
			if (M)
			{
				removeChild(M);
			}
			if (N)
			{
				removeChild(N);
			}
			if (NM)
			{
				removeChild(NM);
			}
			
			Mrijen = Number(MrijenBox.box.text);
			Mkolommen= Number(MkolommenBox.box.text);
			Nrijen = Number(NrijenBox.box.text);
			Nkolommen= Number(NkolommenBox.box.text);
		
			if (Nrijen == Mkolommen && Mrijen >  0 && Mkolommen>0 && Nrijen > 0 && Nkolommen >0)
			{

				
				M = new WMatrix(Mrijen, Mkolommen);
				N = new WMatrix(Nrijen, Nkolommen);
				
				M.y = 400;
				addChild(M);
		
				N.x = 500;
				N.y = 200;
				addChild(N);
				
				NM = MatrixOperaties.product(M, N);
				NM.x = 500;
				NM.y = 400;

				addChild(NM);
				
				stage.addEventListener(WMatrix.MATRIX_UPDATE, update);
			}
			else
			{
				N = null;
				M = null;
				NM = null;
				
				//removeEventListener(WMatrix.MATRIX_UPDATE, update);
			}
			trace(N, M, NM);

			
		}
		
		private function update(e:Event):void
		{
			if (NM)
			{
				//NM = null;
				removeChild(NM);
			}
			
			NM = MatrixOperaties.product(M, N);
			addChild(NM);
			NM.x = 500;
			NM.y = 400;
		}
		
	}

}
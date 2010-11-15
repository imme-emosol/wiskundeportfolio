package wiskunde.assets 
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import wiskunde.objecten.WMatrix;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class MatrixBox extends Sprite
	{
		public var rijen:int;
		public var kolommen:int;
		public var invoer:Boolean;
		public var wmatrix:WMatrix;
		
		private var breedteBox:Number = 75;
		private var hoogteBox:Number = 35//25;
		private var xOffset:Number=30;
		private var yOffset:Number;
		
		private var kleur:uint = 0x0092BC;
		
		public function MatrixBox(wmatrix:WMatrix, rijen:int = 3, kolommen:int = 3, invoer:Boolean = false,  kleur:String = "-") 
		{
			this.wmatrix = wmatrix;
			this.kolommen = kolommen;
			this.rijen = rijen;
			this.yOffset = 2* rijen;
			this.hoogteBox = 35 -0.5 / rijen;
			this.invoer = invoer;
			
			if (kleur != "-")
			{
				this.kleur = uint(kleur);
			}
			
			for (var i:int = 0; i < rijen; i++)
			{
				for (var j:int = 0; j < kolommen; j++)
				{
					var box:TextField = maakTextBox(i,j);
					box.x = xOffset+breedteBox * j 
					box.y = yOffset + hoogteBox * i;
					box.name = "m" + i + j;
					addChild(box);
					box.addEventListener(Event.CHANGE, veranderWaarde);
				}
			
			}
			tekenHaakjes();
			voerWMatrixIn();
			addEventListener(WMatrix.MATRIX_UPDATE, matrix_update);
		}
		
		
		private function matrix_update(e:Event):void
		{
			trace('update');
			var tmp:TextField = TextField(getChildByName('m00'));
			tmp.text = "hi";
		}
		
		private function veranderWaarde(e:Event):void
		{
			
			var doel:TextField = TextField(e.target);
			var rij:int =int( doel.name.substr(1,1));
			var kolom:int = int( doel.name.substr(2, 1));
			var waarde:Number = Number(doel.text);
			doel.text = String(waarde);
			wmatrix.matrix[rij][kolom] = waarde;
		}
		
		private function maakTextBox(i:int, j:int):TextField
		{
			var format:TextFormat = new TextFormat();
			format.font = "Arial";
			format.align = "center";
			format.size = 18;
			format.color = kleur;
			format.bold = true;
			var textBox:TextField = new TextField();
			textBox.name = "_" + String(i) + String(j);
			textBox.defaultTextFormat = format;
			textBox.text = "m" + String(i+1) + String(j+1);
			textBox.width = breedteBox;
			textBox.height = hoogteBox;
			if (invoer)
			{
				textBox.type = TextFieldType.INPUT;
				textBox.addEventListener(MouseEvent.CLICK, select);
			}
			else
			{
				textBox.selectable = false;
				textBox.tabEnabled = false;
			}
			
			return textBox;
		}
		
		private function tekenHaakjes():void
		{
			var tekening:Graphics = this.graphics;
			tekening.lineStyle(3, kleur);
			var matrixbreedte:Number = breedteBox * kolommen;
			var matrixhoogte:Number = hoogteBox * rijen + yOffset;
			tekening.moveTo (xOffset, 0);
			tekening.curveTo(xOffset - 20, matrixhoogte / 2, xOffset, matrixhoogte+yOffset);
			tekening.moveTo ( xOffset+matrixbreedte, 0);
			tekening.curveTo(xOffset+matrixbreedte+20,matrixhoogte/2,xOffset + matrixbreedte,matrixhoogte+yOffset);
		}
		
		public function select(e:MouseEvent):void
		{
			var doel:TextField = TextField(e.target);
			doel.setSelection(0, 100);
		}
		
		public function voerWMatrixIn():void
		{
			for (var i:int = 0; i < rijen; i++)
			{
				for (var j:int = 0; j < kolommen; j++)
				{
					var naam:String = "m" + i + j;
					var veld:TextField = TextField(getChildByName(naam));
					veld.text = String(wmatrix.matrix[i][j]);
				}
			
			}
		}
		
		
	}

}
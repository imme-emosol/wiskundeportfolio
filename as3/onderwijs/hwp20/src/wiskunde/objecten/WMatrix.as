package wiskunde.objecten
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.sampler.NewObjectSample;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.events.MouseEvent;
	import flash.display.Graphics;
	import flash.display.Stage;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * Legt data vast in de vorm van een Matrix
	 * @author Jelle Sjollema
	 */
	public class WMatrix extends Sprite
	{
		public var matrix:Array;
		public var rijen:int;
		public var kolommen:int;
		private var form:Sprite;
		private var kader:Sprite;
		public static const MATRIX_UPDATE:String = "Matrix_Update";
		
		private var box:TextField;
		private var breedteBox:Number = 75;
		private var hoogteBox:Number = 35//25;
		private var xOffset:Number=30;
		private var yOffset:Number;
		
		private var format:TextFormat;
		private var kleur:uint = 0x0092BC;
		private var invoer:Boolean;
		public var init:Boolean = true;
		
		public var textVelden:Array;
		
		
		public function WMatrix(rijen:int, kolommen:int, invoer:Boolean = true) 
		{
			this.kader = new Sprite();
			addChild(kader);
			this.form = new Sprite();
			this.rijen = rijen;
			this.kolommen = kolommen;
			this.matrix = new Array();
			this.invoer = invoer;
			
			tekenForm();

			for (var i:int = 1; i <= rijen; i++)
			{
				var vulArray:Array = new Array();
				for (var j:uint = 0; j < kolommen; j++)
				{
					vulArray[j] = 0;
				}
				voerRijIn(i, vulArray);
			}
			
			

		}
		
		private function update(e:Event):void
		{
			//trace(matrix.toString());
		}
		
		public function voerRijIn(rij:int, waarden:Array, afronding:int = 0):void
		{
			if (rij>0 && rij <= rijen&& waarden.length == kolommen)
			{
				matrix.splice(rij - 1 , 1, waarden);
				for (var i:int = 0; i < kolommen; i++ )
				{
					var str:String = "m" + String(rij-1) + i;
					var doel:TextField = TextField(form.getChildByName(str));
					doel.text =String(GetalOperaties.afronding(Number(waarden[i]),afronding));

				}
			}
			else
			{
				//trace('dit mag niet');
			}
			if (!init)
			{
				stage.dispatchEvent(new Event(WMatrix.MATRIX_UPDATE));
			}
			
		}
		
		public function setWaarde(rij:int, kolom:int, waarde:Number):void
		{
			matrix[rij-1][kolom-1] = waarde;
			var doel:String = "m" + String(rij - 1) + String(kolom - 1);
			var box:TextField = TextField(form.getChildByName(doel));
			box.text = String(waarde);
		}
		
		public function geefWaarde(rij:int, kolom:int):Number
		{
			return(matrix[rij-1][kolom-1]);
			
		}

		private function veranderWaarde(rij:int, kolom:int, waarde:Number):void
		{
			matrix[rij][kolom] = waarde;
			
			stage.dispatchEvent(new Event(WMatrix.MATRIX_UPDATE));
		}
		
		private function tekenForm():void
		{
			addChild(form);
			
			this.yOffset = 2* rijen;
			this.hoogteBox = 35 -0.5 / rijen;
			tekenHaakjes();
			
			textVelden = new Array();
			for (var i:int = 0; i < rijen; i++)
			{
				for (var j:int = 0; j < kolommen; j++)
				{
					var box:TextField = maakTextBox(i,j);
					box.x = xOffset+breedteBox * j 
					box.y = yOffset + hoogteBox * i;
					box.name = "m" + i + j;
					form.addChild(box);
					textVelden.push(box);
				}
			}
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
			//textBox.text = "m" + String(i+1) + String(j+1);
			textBox.width = breedteBox;
			textBox.height = hoogteBox;
			if (invoer)
			{
				textBox.type = TextFieldType.INPUT;
				textBox.addEventListener(MouseEvent.CLICK, select);
				textBox.addEventListener(Event.CHANGE, veranderText);
			}
			else
			{
				textBox.selectable = false;
				textBox.tabEnabled = false;
			}
			
			return textBox;
		}
		
		private function select(e:MouseEvent):void
		{
			var doel:TextField = TextField(e.target);
			doel.setSelection(0, 100);
		}
		
		private function veranderText(e:Event):void
		{
			var doel:TextField = TextField(e.target);
			var doelRij:int = int(doel.name.substr(1, 1));
			var doelKolom:int = int(doel.name.substr(2, 1));			
			var doelWaarde:Number = Number(doel.text);
			
			veranderWaarde(doelRij, doelKolom, doelWaarde);
			//trace(doel.text);
			if (true
				&& doel.text.charAt(0) != "-"
				&& doel.text.charAt(doel.text.length - 1) != "."
				&& doel.text.charAt(doel.text.length - 1) != "0"
			)
			{
				
				doel.text = String(doelWaarde);
			}
			else
			{
				//trace('wat is hier aan de hand');
			}
			
		}
		
		private function tekenHaakjes():void
		{
			var tekening:Graphics = form.graphics;
			tekening.lineStyle(3, kleur);
			var matrixbreedte:Number = breedteBox * kolommen;
			var matrixhoogte:Number = hoogteBox * rijen + yOffset;
			tekening.moveTo (xOffset, 0);
			tekening.curveTo(xOffset - 20, matrixhoogte / 2, xOffset, matrixhoogte+yOffset);
			tekening.moveTo ( xOffset+matrixbreedte, 0);
			tekening.curveTo(xOffset+matrixbreedte+20,matrixhoogte/2,xOffset + matrixbreedte,matrixhoogte+yOffset);
		}
		
		public function tekenKader():void
		{
			var tekenening:Graphics = kader.graphics;
			tekenening.lineStyle(1, 0x0092BC,0.4);
			tekenening.beginFill(0xeeeeff, 0.4);
			tekenening.drawRoundRect( 0, -10, form.width+40, form.height+20,20,20);
		}
		
		public function geefRij(rij:int):Array
		{
			var exp:Array = new Array();
			for (var i:int = 0; i < this.kolommen; i++)
			{
				exp.push(matrix[rij - 1][i]);
			}
			trace('rij', rij,':' ,exp.toString());
			return exp;
			
		}
		
		public function geefKolom(kolom:int):Array
		{
			var exp:Array = new Array();
			for (var i:int = 0; i < this.rijen; i++)
			{
				exp.push(matrix[i][kolom - 1]);
			}
			trace('kolom',kolom ,' :',exp.toString());
			return exp;
			
		}
	}

}
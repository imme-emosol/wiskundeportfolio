package wiskunde.assets
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	/**
	 * Wordt gebruikt om output weer te geven
	 * Zie <a href="http://wiki.wiskundeportfolio.nl/index.php/Inputbox_actionscript">asset Outputbox</a>
	 * @author Jelle Sjollema
	 */
	public class OutputBox extends Sprite
	{
		private var label:TextField;
		public var box:TextField;
		private var format:TextFormat;
		public var tekstGrootte:Number;
		public var waarde:Number;
		public var breedte:Number
		public var labelTekst:String;
		
		public function OutputBox(x:Number=0, y:Number=0, breedte:Number =140, labelText:String=null,waarde:Number= 0, tekstGrootte:Number = 36) 
		{
			this.x = x;
			this.y = y;
			this.breedte = breedte;
			this.labelTekst = labelText; 
			this.tekstGrootte = tekstGrootte;
			this.waarde = waarde;
			
			
			format = new TextFormat();
			format.color = 0xFFFFFF;
			format.align = "center";
			format.font = "Arial";
			format.bold = true;
			
			if (labelText != null)
			{
				label = new TextField();
				label.defaultTextFormat = format;
				label.width = breedte;
				label.height = 20;
				label.text = labelText;
				label.background = true;
				label.backgroundColor = 0x0092BC;
				label.border = true;
				label.selectable = false;
				addChild(label)
			}
			
			
			format.color = 0xFFFFFF;
			format.size = tekstGrootte;
			box = new TextField();
			box.defaultTextFormat = format;
			if (labelText == null)
			{
				box.y = 0
			}
			else
			{
				box.y = 20;
			}
			box.width = breedte;
			box.height = 40;
			box.tabEnabled = false;
			box.border = true;
			box.background = true;
			box.backgroundColor = 0x0092BC ;
			this.box.text = String(waarde);
			addChild(box);
		}
		
		public function update(waarde:Number):void
		{
			this.waarde = waarde;
			box.text = String(waarde);
			
		}
		
		public function setWaarde(waarde:Number):void
		{
			this.box.text = String(waarde)
		}
		
	}

}
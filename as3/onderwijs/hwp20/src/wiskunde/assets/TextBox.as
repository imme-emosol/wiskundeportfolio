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
	 * Wordt gebruikt om tekst in of/en uit te voeren. 
	 * Zie: <a href="http://wiki.wiskundeportfolio.nl/index.php/Inputbox_actionscript">asset InputBox</a>
	 * @author Jelle Sjollema
	 */
	public class TextBox extends Sprite
	{
		public var box:TextField;
		private var format:TextFormat;
		public var hoogte:Number;
		public var breedte:Number;
		public var tekst:String;
		public var tekstGrootte:Number;
		
		public function TextBox(x:Number, y:Number,breedte:Number, hoogte:Number, tekst:String, tekstGrootte:Number=12, kleur:uint=0x0092BC,tekstkleur:uint=0xffffff) 
		{
			this.x = x;
			this.y = y;
			this.breedte = breedte;
			this.hoogte = hoogte;
			this.tekst = tekst;
			this.tekstGrootte = tekstGrootte;
			
			format = new TextFormat();
			format.align = "center";
			format.font = "Arial";
			format.bold = true;
			format.color = tekstkleur;
			format.size = tekstGrootte;
			box = new TextField();
			box.wordWrap = true;
			box.defaultTextFormat = format;
			box.width = breedte;
			box.height = hoogte;
			box.type = TextFieldType.INPUT;
			box.border = true;
			box.background = true;
			box.backgroundColor = kleur;
			box.text = String(tekst);
			box.tabEnabled = false;
			addChild(box);
			
			box.addEventListener(Event.CHANGE, update);
			box.addEventListener(MouseEvent.DOUBLE_CLICK, select);
		}
		
		public function update(e:Event):void
		{
			this.tekst = box.text;
		}
		
		
		public function select(e:MouseEvent):void
		{
			
			box.setSelection(0, box.text.length);
		}
		
		public function setBox(waarde:String):void
		{
			this.tekst = tekst;
			this.box.text = tekst;
		}
		
	}

}
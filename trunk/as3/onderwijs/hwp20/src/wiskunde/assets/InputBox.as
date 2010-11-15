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
	 * Wordt gebruikt om data in te voeren. 
	 * Zie: <a href="http://wiki.wiskundeportfolio.nl/index.php/Inputbox_actionscript">asset InputBox</a>
	 * @author Jelle Sjollema
	 */
	public class InputBox extends Sprite
	{
		private var label:TextField;
		public var box:TextField;
		private var format:TextFormat;
		public var waarde:Number;
		public var tekstGrootte:Number;
		public static const TEXT_INVOER:String = "text_invoer";
		
		
		public function InputBox(x:Number = 0, y:Number=0, labelText:String=null, waarde:Number = 0,tekstGrootte:Number = 36) 
		{
			box = new TextField();
			
			this.tekstGrootte = tekstGrootte;
			this.x = x;
			this.y = y;
			this.waarde = waarde;
			
			format = new TextFormat();
			format.color = 0xffffff;
			format.align = "center";
			format.font = "Arial";
			format.bold = true;
			
			
			if (labelText != null)
			{
				label = new TextField();
				label.defaultTextFormat = format;
				label.width = 140;
				label.height = 20;
				label.text = labelText;
				label.background = true;
				label.backgroundColor = 0x0092BC ;
				label.border = true;
				label.selectable = false;
				addChild(label)
				
			}

			
			format.color = 0x000000;
			format.size = tekstGrootte;
			
			
			box.defaultTextFormat = format;
			if (labelText == null)
			{
				box.y = 0;
			}
			else
			{
				box.y = 20;
			}
			
			box.width = 140;
			//box.height = 40;
			box.height =  (4 * tekstGrootte / 3);
			box.type = TextFieldType.INPUT;
			box.border = true;
			box.background = true;
			box.backgroundColor = 0xffffff;
			box.text = String(waarde);
			addChild(box);
			
			box.addEventListener(Event.CHANGE, update);
			box.addEventListener(MouseEvent.CLICK, select);
		}
		
		public function update(e:Event):void
		{
			this.waarde = Number(box.text);
			this.dispatchEvent(new Event(InputBox.TEXT_INVOER, true));
		}
		
		public function setWaarde(a:Number):void
		{
			this.waarde = a;
			box.text = String(a);
		}
		
		public function select(e:MouseEvent):void
		{
			
			box.setSelection(0, 100);
		}
		
	}

}
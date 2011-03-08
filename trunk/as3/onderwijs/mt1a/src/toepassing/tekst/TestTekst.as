package toepassing.tekst 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestTekst extends Sprite
	{
		public var mijnTextField:TextField;
		
		public var mijnFormaat:TextFormat;
		
		[Embed(source='Mom«t___.ttf',fontFamily="jelle")]
		private var jelleFont:Class;
		
		public function TestTekst() 
		{
			//var jelle:Font = new jelleFont();
			mijnFormaat = new TextFormat();
			mijnFormaat.font = "jelle";
			//mijnFormaat.font = "Wingdings";
			//mijnFormaat.size = 30;
			mijnFormaat.align = "center";
			
			mijnTextField = new TextField();
			
			
			
			mijnTextField.defaultTextFormat = mijnFormaat;
			
			mijnTextField.embedFonts = true;
			mijnTextField.width = 300;
			mijnTextField.border = true;
			mijnTextField.x = 200;
			mijnTextField.y = 300;
			
			mijnTextField.text = "Niets zo charmant \nals een tegeltje aan de wand";
			
			addChild(mijnTextField);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			var datum:Date = new Date();
			mijnTextField.text = String(datum.toDateString() + "\n" +  datum.toLocaleTimeString());
		}
		
	}

}
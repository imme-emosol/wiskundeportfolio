package training 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestText extends Sprite
	{
		public var mijnTextField:TextField;
		public var formaat:TextFormat;
		[Embed(source = '../../lib/FB_NYAN_.TTF', fontFamily = "jelle")]
		private var jelleFont:Class;
		
		
		
		public function TestText() 
		{
			formaat = new TextFormat();
			formaat.size = 60;
			formaat.color = 0xff0000;
			formaat.letterSpacing = 10;
			formaat.font = "jelle";
			
			
			
			
			mijnTextField = new TextField();
			mijnTextField.defaultTextFormat = formaat;
			mijnTextField.type = TextFieldType.INPUT;
			mijnTextField.text = "goodbye world";
			mijnTextField.autoSize = "left";
			mijnTextField.embedFonts = true;

			addChild(mijnTextField);
			
		}
		
	}

}
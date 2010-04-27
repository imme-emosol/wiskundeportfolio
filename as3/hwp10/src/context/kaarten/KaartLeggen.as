package context.kaarten 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class KaartLeggen extends Sprite
	{
		[Embed(source = 'VoorbeeldKaart.png')]
		private var Plaatje:Class;
		
		private var kaart:Bitmap;
		private var speelveld:Sprite;
		
		
		public function KaartLeggen() 
		{
			speelveld = new Sprite();
			tekenSpeelveld();
			addChild(speelveld);
			kaart = new Plaatje();
			speelveld.addChild(kaart);
			
		}
		
		private function tekenSpeelveld():void
		{
			speelveld.graphics.lineStyle(2);
			speelveld.graphics.beginFill(0x191977);
			speelveld.graphics.drawRoundRect(0, 0, 800, 600, 15, 20);
			speelveld.graphics.endFill();
		}
		
	}

}
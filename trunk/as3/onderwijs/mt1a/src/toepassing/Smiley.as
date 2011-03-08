package toepassing 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.objecten.Punt;
	import flash.display.BlendMode;
	
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Smiley extends Sprite
	{
		public var gezicht:Punt;
		public var lichtje:Punt;
		public var lichtje1:Punt;
		public var linkerOog:Punt;
		public var rechterOog:Punt;
		
		public var mondLinks:Punt;
		public var mondRechts:Punt;
		public var mondMidden:Punt;
		
		
		public function Smiley() 
		{
			
			gezicht = new Punt(480, 300);
			gezicht.tekenPunt(300,0xffff00);
			addChild(gezicht);
			gezicht.blendMode = BlendMode.DIFFERENCE;
			
			lichtje = new Punt(5, -5);
			lichtje.tekenPunt(20, 0xffffff);
			lichtje.alpha = 0.5;
			lichtje1 = lichtje;
			
			linkerOog = new Punt( -100, -100);
			linkerOog.tekenPunt(30, 0x0000ff);
			linkerOog.sleepPunt();
			gezicht.addChild(linkerOog);
			
			rechterOog = new Punt(100, -100);
			rechterOog.tekenPunt(30, 0x0000ff);
			rechterOog.sleepPunt();
			gezicht.addChild(rechterOog);

			rechterOog.addChild(lichtje);	
			linkerOog.addChild(lichtje1);
			
			mondLinks = new Punt(350, 400);
			mondLinks.tekenPunt(10, 0x000000);
			mondLinks.sleepPunt();
			addChild(mondLinks);
			

			mondRechts= new Punt(630, 400);
			mondRechts.tekenPunt(10, 0x000000);
			mondRechts.sleepPunt();
			addChild(mondRechts);

			mondMidden= new Punt(480, 450);
			mondMidden.tekenPunt(10, 0x000000);
			mondMidden.sleepPunt();
			addChild(mondMidden);
			tekenMond();
			
			addEventListener(Event.EXIT_FRAME, speelAf);
		}
		
		private function tekenMond():void
		{
			this.graphics.clear();
			this.graphics.lineStyle(5);
			this.graphics.moveTo(mondLinks.x, mondLinks.y);
			this.graphics.curveTo(mondMidden.x, mondMidden.y, mondRechts.x, mondRechts.y);
		}
		
		private function speelAf(e:Event):void
		{
			tekenMond();
		}
		
	}

}
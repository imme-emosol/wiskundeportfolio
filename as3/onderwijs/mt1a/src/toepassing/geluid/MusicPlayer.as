package toepassing.geluid 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class MusicPlayer extends Sprite
	{
		public var geluid:Sound;
		public var req:URLRequest;
		public var kanaal:SoundChannel;
		public var stopKnop:Sprite;
		
		public function MusicPlayer() 
		{
			stopKnop = new Sprite();
			maakStopKnop();
			geluid = new Sound();
			kanaal = new SoundChannel();
			req = new URLRequest("../src/toepassing/geluid/theSystem.mp3");
			geluid.load(req);
			kanaal = geluid.play();
			stopKnop.addEventListener(MouseEvent.CLICK, stopGeluid);
		}
		
		private function stopGeluid(e:MouseEvent):void
		{
			kanaal.stop();
		}
		
		private function maakStopKnop():void
		{
			stopKnop.graphics.beginFill(0x191977);
			stopKnop.graphics.drawRect(0, 0, 100, 100);
			stopKnop.graphics.endFill();
			addChild(stopKnop);
		}
		
	}

}
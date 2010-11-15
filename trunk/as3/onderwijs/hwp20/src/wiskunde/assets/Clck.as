package wiskunde.assets
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Bit;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.LogischeOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Clck extends Sprite
	{
		public var b:Bit;
		public var freq:Number;
		public var toestand:Boolean;
		
		private var frameRate:Number;
		private var t:Number = 0;
		public static const CLCK_UPDATE:String = "clck_update";
		
		public function Clck(hoogte:Number=20, freq:Number = 5, label:String=null,toestand:Boolean = false) 
		{	
			setFrequentie(freq);
			b = new Bit(0, 0, hoogte, hoogte, 0, label);
			this.toestand = toestand;
			b.setToestand(toestand);
			addChild(b);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			t += 1 / stage.frameRate;
			
			if (t > 1/freq )
			{
				b.setToestand(LogischeOperaties.niet(b.toestand));
				this.toestand = b.toestand;
				t = 0;
				this.dispatchEvent(new Event(CLCK_UPDATE, true));
			}
		}
		
		public function setFrequentie(freq:Number=5):void
		{
			this.freq = freq;
		}
		
	}

}
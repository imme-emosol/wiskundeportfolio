package wiskunde.assets 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.objecten.Verhouding;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class VerhoudingBox extends Sprite
	{
		private var delerBox:InputBox;
		private var deeltalBox:InputBox;

		public var label:String = null
		public var deeltal:Number =1;
		public var deler:Number = 1;
		public var waarde:Verhouding;
		public var doel:String;
		
		public static const TEXT_UPDATE:String = "Text_update";
		
		public function VerhoudingBox(x:Number = 0,y:Number = 0, label:String = null, tekstGrootte:Number = 36, aKleur:uint=0xffffff) 
		{
			this.x = x;
			this.y = y;
			deeltalBox = new InputBox(0, 0, label, deeltal, tekstGrootte);
			deeltalBox.name = "deeltal";
			waarde = new Verhouding(deeltal, deler);
			if (label != null)
			{
				delerBox = new InputBox(0, deeltalBox.height , null, deler,tekstGrootte);
			}
			else
			{
				delerBox = new InputBox(0, deeltalBox.height, null, deler,tekstGrootte);
			}
			
			deeltalBox.box.background = true;
			deeltalBox.box.backgroundColor = aKleur;
			
			delerBox.box.background = true;
			delerBox.box.backgroundColor = aKleur;
			delerBox.name = "deler";
			addChild(deeltalBox);
			addChild(delerBox);
			
			delerBox.addEventListener(InputBox.TEXT_INVOER, update);
			deeltalBox.addEventListener(InputBox.TEXT_INVOER, update);
			
		}
		
		public function update(e:Event):void
		{
			doel = String(e.target.name);
			this.deeltal = Number(deeltalBox.box.text);
			this.deler = Number(delerBox.box.text);
			this.waarde = new Verhouding(deeltal, deler);
			this.dispatchEvent(new Event(TEXT_UPDATE, true));
		}
		
		public function setVerhouding(deeltal:Number, deler:Number):void
		{
			this.deeltal = deeltal;
			this.deler = deler;
			this.waarde = new Verhouding(deeltal, deler);
			deeltalBox.box.text = String(deeltal);
			delerBox.box.text = String(deler);
			
		}
		
	}

}
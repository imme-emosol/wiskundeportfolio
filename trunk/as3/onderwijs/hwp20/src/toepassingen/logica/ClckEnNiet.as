package toepassingen.logica
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.Basis;
	import wiskunde.assets.Bit;
	import wiskunde.assets.Clck;
	import wiskunde.operaties.LogischeOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class ClckEnNiet extends Sprite
	{
		public var c1:Clck
		public var c2:Clck
		public var c3:Clck;
		public var c4:Clck;
		
		public var b1:Bit;
		public var b2:Bit;
		public var b3:Bit;
		public var b4:Bit;
		
		public function ClckEnNiet() 
		{
			c1 = new Clck(50, 0.5, "c1");
			c1.x = 10;
			c1.y = 10;
			c2 = new Clck(50, 1,"c2");
			c2.x = 65;
			c2.y = 10;
			c3 = new Clck(50, 2,"c3");
			c3.x = 120;
			c3.y = 10;
			c4 = new Clck(50, 4,"c4");
			c4.x = 175;
			c4.y = 10;
			
			b1 = new Bit(10,87, 50, 50, 0, '! c1');
			b1.tekenBit();
			b1.setToestand(LogischeOperaties.niet(c1.toestand));
			
			b2 = new Bit(65, 87, 50, 50, 0, '! c2');
			b2.tekenBit();
			b2.setToestand(LogischeOperaties.niet(c2.toestand));
			
			b3 = new Bit(120,87, 50, 50, 0, '! c3');
			b3.tekenBit();
			b3.setToestand(LogischeOperaties.niet(c3.toestand));

			b4 = new Bit(175,87, 50, 50, 0, '! c4');
			b4.tekenBit();
			b4.setToestand(LogischeOperaties.niet(c4.toestand));
			
			addChild(c1);
			addChild(c2);
			addChild(c3);
			addChild(c4);
			addChild(b1);
			addChild(b2);
			addChild(b3);
			addChild(b4);
			c4.addEventListener(Clck.CLCK_UPDATE, update);
			
		}
		
		private function update(e:Event):void
		{
			b1.setToestand(LogischeOperaties.niet(c1.toestand));
			b2.setToestand(LogischeOperaties.niet(c2.toestand));
			b3.setToestand(LogischeOperaties.niet(c3.toestand));
			b4.setToestand(LogischeOperaties.niet(c4.toestand));
			//trace(c1.toestand);
		}
		
	}

}
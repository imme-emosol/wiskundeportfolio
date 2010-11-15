package gonio 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.OutputBox;
	import wiskunde.assets.Raster;
	import wiskunde.objecten.Hoek;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class SinCos extends Sprite
	{
		public var hoek:Hoek;
		public var hoekBox:InputBox;
		public var sin:OutputBox;
		public var cos:OutputBox;
			
		public function SinCos() 
		{	
			hoek = new Hoek(0);
			hoekBox = new InputBox(10, 10, "hoek", hoek.graden, 30);
			addChild(hoekBox);
			
			sin = new OutputBox(160, 10, 140, "sinus", Math.sin(hoek.rad));
			addChild(sin);
			cos  = new OutputBox(310, 10, 140, "cosinus", Math.cos(hoek.rad));
			addChild(cos);
			
			hoekBox.addEventListener(InputBox.TEXT_INVOER, update);
		}
		
		private function update(e:Event):void
		{
			hoek = new Hoek(hoekBox.waarde);
			sin.setWaarde(GetalOperaties.afronding(Math.sin(hoek.rad),3));
			cos.setWaarde(GetalOperaties.afronding(Math.cos(hoek.rad),3));
		}
		
	}

}
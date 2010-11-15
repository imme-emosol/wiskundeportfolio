package toepassingen.eenheden 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import wiskunde.assets.InputBox;
	import wiskunde.assets.Raster;
	import wiskunde.operaties.EenheidsOperaties;
	import wiskunde.operaties.GetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class grafischeEenheden extends Sprite
	{
		public var pixels:Number;
		public var punten:Number;
		public var ems:Number;
		public var percent:Number;
		
		public var pixelBox:InputBox;
		public var puntenBox:InputBox;
		public var emsBox:InputBox;
		public var percentBox:InputBox;
		
		
		public function grafischeEenheden() 
		{
			var raster:Raster = new Raster(20,0,20,0);
			raster.alpha = 0.4;
			addChild(raster);
			
			pixelBox = new InputBox(20, 20, 'pixels', 16, 45);
			addChild(pixelBox);
			
			puntenBox = new InputBox(200, 20, 'punten', 12, 45);
			addChild(puntenBox);
			
			emsBox = new InputBox(380, 20, 'ems', 1, 45);
			addChild(emsBox);
			
			percentBox = new InputBox(560, 20, 'percent', 100, 45);
			addChild(percentBox);

			pixelBox.addEventListener(InputBox.TEXT_INVOER, pixelInvoer);
			puntenBox.addEventListener(InputBox.TEXT_INVOER, puntInvoer);
			emsBox.addEventListener(InputBox.TEXT_INVOER, emsInvoer);
			percentBox.addEventListener(InputBox.TEXT_INVOER, percentInvoer);
		}
		
		public function pixelInvoer(e:Event):void
		{
			pixels = pixelBox.waarde;
			emsBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.pixelsNaarEms(pixels), 3));
			puntenBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.pixelsNaarPunten(pixels), 3));
			percentBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.pixelsNaarPercent(pixels), 0));
		}
		
		public function puntInvoer(e:Event):void
		{
			punten = puntenBox.waarde;
			pixelBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.puntenNaarPixels(punten), 3));
			emsBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.puntenNaarEms(punten), 3));
			percentBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.puntenNaarPercent(punten), 0));
		}
		
		public function emsInvoer(e:Event):void
		{
			ems = emsBox.waarde;
			pixelBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.emsNaarPixels(ems), 3));
			puntenBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.emsNaarPunten(ems), 3));
			percentBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.emsNaarPercent(ems), 0));
			
		}
		
		public function percentInvoer(e:Event):void
		{
			var percent:Number = percentBox.waarde;
			pixelBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.percentNaarPixels(percent), 3));
			puntenBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.percentNaarPunten(percent), 3));
			emsBox.setWaarde(GetalOperaties.afronding(EenheidsOperaties.percentNaarEms(percent), 3));

			
		}
		
	}

}
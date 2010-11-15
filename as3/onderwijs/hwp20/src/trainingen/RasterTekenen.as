package trainingen 
{
	import flash.display.Sprite;
	import wiskunde.assets.Raster;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class RasterTekenen extends Sprite
	{
		
		public function RasterTekenen() 
		{
			var raster:Raster = new Raster(20,20);
			addChild(raster);
			
		}
		
	}

}
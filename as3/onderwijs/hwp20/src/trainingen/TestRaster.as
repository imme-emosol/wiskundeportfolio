package trainingen 
{
	import flash.display.Sprite;
	import wiskunde.assets.Raster;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestRaster extends Sprite
	{
		
		public function TestRaster() 
		{
			var raster:Raster = new Raster(10, 0, 10, 0, 100, 100);
			addChild(raster);
		}
		
	}

}
package toepassingen.lijnen 
{
	import flash.display.Sprite;
	import wiskunde.assets.Pijl;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class DraaiPijl extends Sprite
	{
		public var pijl:Pijl;
		
		public function DraaiPijl() 
		{
			pijl = new Pijl();
			pijl.x = 200;
			pijl.y = 200;
			pijl.tekenPijl(100, 0xff00ff);
			addChild(pijl);
			
		}
		
	}

}
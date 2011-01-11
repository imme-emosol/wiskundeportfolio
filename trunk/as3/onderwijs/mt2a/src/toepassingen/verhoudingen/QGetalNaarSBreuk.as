package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import wiskunde.objecten.QGetal;
	import wiskunde.objecten.SBreuk;
	import wiskunde.operaties.QGetalOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class QGetalNaarSBreuk extends Sprite
	{
		public var q:QGetal;
		public var sb:SBreuk;
		
		public function QGetalNaarSBreuk() 
		{
			trace(QGetalOperaties.construeerRepetend("1234", 20));
			
		}
		
	}

}
package  
{
	import flash.display.Sprite;
	import wiskunde.assets.OutputBox;
	import wiskunde.objecten.QGetal;
	import wiskunde.objecten.SBreuk;
	import wiskunde.operaties.GetalOperaties;
	import wiskunde.operaties.QGetalOperaties;
	import wiskunde.operaties.TransObject;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Troep extends Sprite
	{
		public var sb:SBreuk;
		
		public function Troep() 
		{
			sb = TransObject.QGetalNaarSBreuk(new QGetal("0", "12", "13"));
			trace(sb.entier, sb.breuk.teller, sb.breuk.noemer);
			trace(sb.breuk.teller / sb.breuk.noemer);
		}
		
	}

}
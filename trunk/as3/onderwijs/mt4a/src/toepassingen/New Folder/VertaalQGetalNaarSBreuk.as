package toepassingen.transObjecten 
{
	import flash.display.Sprite;
	import wiskunde.objecten.QGetal;
	import wiskunde.objecten.SBreuk;
	import wiskunde.operaties.TransObjectOperaties;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class VertaalQGetalNaarSBreuk extends Sprite
	{
		public var q:QGetal;
		public var sb:SBreuk;
		
		public function VertaalQGetalNaarSBreuk() 
		{
			q = new QGetal("12", "356", "78");
			trace(q.entier, q.decimaal, q.repetend);
			
			sb = TransObjectOperaties.QGetalNaarSBreuk(q);
			trace(sb.entier, sb.breuk.teller, sb.breuk.noemer);
			
			
			trace(sb.entier + sb.breuk.teller / sb.breuk.noemer);
			
		}
		
	}

}
package toepassingen.verhoudingen 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.QGetal;
	import wiskunde.operaties.VerhoudingsOperatie;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class MaakQGetal extends Sprite
	{
		
		public function MaakQGetal() 
		{
			//var a:QGetal = new QGetal("2", "3", "4");
			
			var a:Breuk = new Breuk(19, 321);
			var q:QGetal = VerhoudingsOperatie.breukNaarQGetal(a);
			
			trace(q.entier, q.decimaal, q.repetend);
			
		}
		
	}

}
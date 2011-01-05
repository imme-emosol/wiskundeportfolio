package wiskunde.operaties 
{
	import wiskunde.objecten.Breuk;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class BreukOperaties
	{
		public static function delen(a:Breuk, b:Breuk):Breuk
		{
			var antwoord:Breuk = new Breuk(a.teller * b.noemer, a.noemer* b.teller);			
			return antwoord
		}
		
	}

}
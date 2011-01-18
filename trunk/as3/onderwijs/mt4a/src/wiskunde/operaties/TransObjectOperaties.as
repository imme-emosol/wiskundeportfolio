package wiskunde.operaties 
{
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.QGetal;
	import wiskunde.objecten.SBreuk;
	
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TransObjectOperaties 
	{
		public static function QGetalNaarSBreuk(q:QGetal):SBreuk
		{
			
			var entier:Number = Number(q.entier);
			
			var lengteDecimaal:Number = Math.pow(10, q.decimaal.length);
			var lengteDecimaalEnRepetend:Number = Math.pow(10, q.decimaal.length + q.repetend.length);
			trace("lengteDecimaal", lengteDecimaal);
			trace("lengteDecimaalEnRepetend", lengteDecimaalEnRepetend);
			
			var decimaal:Number = Number(q.decimaal);
			var decimaalEnRepetend:Number = Number(q.decimaal + q.repetend);
			
			trace("decimaal", decimaal);
			trace("decimaalEnRepetend", decimaalEnRepetend);
			
			var teller:Number = decimaalEnRepetend - decimaal;
			var noemer:Number = lengteDecimaalEnRepetend - lengteDecimaal;
			
			var breuk:Breuk = new Breuk(teller, noemer);
			breuk = BreukOperaties.vereenvoudig(breuk);
			
			var antwoord:SBreuk = new SBreuk(entier, breuk);
			return antwoord;
		}
		
	}

}
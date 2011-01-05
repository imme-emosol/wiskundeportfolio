package wiskunde.operaties 
{
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.QGetal;
	import wiskunde.objecten.Verhouding;
	/**
	 * Operaties met Getallen
	 * @author Jelle Sjollema
	 */
	public class GetalOperaties
	{
		
		public static function kwadraat(a:Number):Number
		{
			var antwoord:Number;
			antwoord = a * a;
			//antwoord = Math.pow(a, 2);

			return antwoord;
		}
		
		/**
		 * De wortel uit een getal trekken... 
		 */
		public static function wortel(a:Number):Number
		{
			var antwoord:Number;
			antwoord = Math.sqrt(a);
			return antwoord;
		}
		
		public static function pythagoras(a:Number, b:Number):Number
		{
			var antwoord:Number;
			antwoord = wortel(kwadraat(a) + kwadraat(b))
			return antwoord
		}
		
		public static function afronding(a:Number, decimalen:Number):Number
		{
			var antwoord:Number;
			antwoord = Math.round(a * Math.pow(10, decimalen)) / Math.pow(10, decimalen);
			
			return antwoord;
		}
		
		public static function staartdeling(deeltal:Number, deler:Number, decimaal: int):String
		{
		var antwoord:String;
		var rest:Number;
 
		var breuk:Number = Math.floor(deeltal / deler);
		antwoord += breuk; 
		deeltal = 10 * (deeltal- breuk * deler);
 
		if (decimaal > 0)
		{
			antwoord += "."
			while (decimaal--)
			{
				breuk = Math.floor(deeltal / deler);
				antwoord += breuk;
				deeltal = 10 * (deeltal- breuk * deler);
			}
		}
 
		return antwoord;	
		}
		
		public static function vindRepetend(getal:String):String
		{
			var antwoord:String = '';
			var re:RegExp = /(.+?)(\1+)$/;
			var patroon:Object = re.exec(getal);
			antwoord = patroon[1];
			var decimaal:String = getal.replace(patroon[0], '' );
			return antwoord;
		}
		
		public static function isGeheelGetal(a:Number): Boolean
		{
			var antwoord:Boolean = false;
			if (a == Math.floor(a))
			{
				antwoord = true;
			}
			return antwoord;
		}
		
		public static function getalNaarVerhouding(a:Number):Verhouding
		{
			var antwoord:Verhouding;
			
			var temp:Number = a;
			var exp:Number = 1;
			
			while (!isGeheelGetal(temp))
			{
				temp = temp * 10;
				exp = exp * 10;
			}
			antwoord = new Verhouding(temp, exp);
			return antwoord;
			
		}
		
		public static function breukNaarQGetal(breuk:Breuk):QGetal
		{
			var entier:String;
			var decimaal:String;
			var repetend:String
			
			var getal:String = staartdeling(breuk.teller, breuk.noemer, 1000);
			repetend = vindRepetend(getal);

			var re:RegExp = /(.+?)(\1+)$/;
			var g:String = getal.replace(re, '');

			var tmp:Array = g.split(".");
			entier = tmp[0];
			decimaal = tmp[1];
			
			var antwoord:QGetal = new QGetal(entier, decimaal, repetend);
			return antwoord;
		}
		
		public static function getalNaarBreuk(a:Number):Breuk
		{
			var antwoord:Breuk;
			
			var temp:Number = a;
			var exp:Number = 1;
			
			while (!isGeheelGetal(temp))
			{
				temp = temp * 10;
				exp = exp * 10;
			}
			antwoord = new Breuk(temp, exp);
			return antwoord;
			
		}

	}
	
	
}
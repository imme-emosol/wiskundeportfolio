package wiskunde.operaties 
{
	import wiskunde.objecten.Verhouding;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class GetalOperaties
	{
		public static function afronding(a:Number, decimaal:Number):Number
		{
			var antwoord:Number;
			antwoord  = Math.round(a* Math.pow(10,decimaal))/Math.pow(10,decimaal);
			return antwoord;
		}
		
		public static function kwadraat(a:Number):Number
		{
			var antwoord:Number;
			antwoord = a * a;
			return antwoord;
		}
		
		public static function wortel(a:Number):Number
		{
			var antwoord:Number;
			antwoord = Math.sqrt(a);
			return antwoord;
		}

		public static function getalAdBreuk(a:Number):Verhouding
		{
			var antwoord:Verhouding;
			var temp:Number;
			
			
			var i:int;
			for (i = 0; i <= 16; i++)
			{
				temp = a * Math.pow(10, i);
				if (temp == Math.floor(temp))
				{
					antwoord = new Verhouding(temp, Math.pow(10, i));
					break;
				}
			}
			return antwoord;
		}
		
		public static function staartDeling(deeltal:Number, deler:Number, dec:int):String
		{
			var antwoord:String = '';
			var rest:Number;
			
			var breuk:Number = Math.floor(deeltal / deler);
			antwoord += breuk;
			deeltal = 10 * (deeltal - breuk*deler);
			
			if (dec > 0)
			{
				antwoord += ".";
				
				while (dec--)
				{
					breuk = Math.floor(deeltal / deler);
					antwoord += breuk;
					deeltal = 10 * (deeltal - breuk*deler);
				}
				
			}
			
			return antwoord;
			
		}
		
		public static function vindRepetend(getal:String):String
		{
			var antwoord:String = '';
			var re:RegExp = /(.+?)(\1+)$/;
			var patroon:Array = re.exec(getal);
			antwoord = patroon[1]
			return antwoord;
		}

		public static function vindDecimaal(getal:String):String
		{
			var antwoord:String = '';
			var re:RegExp = /(.+?)(\1+)$/;
			var patroon:Array = re.exec(getal);
			antwoord = patroon[1];
			antwoord= getal.replace(patroon[0], '' );
			return antwoord;
		}		
		
		
	}

}
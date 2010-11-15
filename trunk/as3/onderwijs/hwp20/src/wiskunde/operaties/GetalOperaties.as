package wiskunde.operaties 
{
	import wiskunde.objecten.Breuk;
	import wiskunde.objecten.Getal;
	//import wiskunde.objecten.SBreuk;
	/**
	 * Operaties met getallen
	 * @author Jelle Sjollema
	 */
	public class GetalOperaties
	{
		/**
		 * Telt tgetal a op bij getal b
		 * @param	a
		 * @param	b
		 * @return
		 */
		static public function som(a:Number, b:Number):Number
		{
			return a + b;
		}
		
		/**
		 * Trekt getal b van getal a af
		 * @param	a
		 * @param	b
		 * @return
		 */
		static public function verschil(a:Number, b:Number):Number
		{
			return a - b;
		}
		
		/**
		 * Vermenigvuldigt getal a met getal b
		 * @param	a
		 * @param	b
		 * @return
		 */
		static public function product(a:Number, b:Number):Number
		{
			return a * b;
		}
		
		/**
		 * Deelt getal a door getal b
		 * @param	a
		 * @param	b
		 * @return
		 */
		static public function quotient(a:Number, b:Number):Number
		{
			return a / b;
		}
		
		/**
		 * Bepaald de rest van de deling van getallen a en b
		 * @param	a
		 * @param	b
		 * @return
		 */
		static public function modulo(a:Number, b:Number):Number
		{
			return a % b;
		}
		
		/**
		 * Geeft het kwadraat van getal a
		 * @param	a
		 * @return
		 */
		static public function kwadraat(a:Number):Number
		{
			return a * a;
		}
		
		/**
		 * Geeft de wortel van getal a
		 * @param	a
		 * @return
		 */
		static public function wortel(a:Number):Number
		{
			return Math.sqrt(a);
		}
		
		
		/**
		 * Verhoogt of verlaagt een getal in de richting van het getal nul
		 * @param	a
		 * @return
		 */
		static public function entier(a:Number):Number
		{
			var antwoord:Number
			
			if (GetalOperaties.isGeheelGetal(a))
			{
				if (GetalOperaties.isNatuurlijkGetal(a))
				{
					antwoord = vloer(a);
				}
				else
				{
					antwoord = plafond(a);
				}
			}
			return antwoord;
			
		}
		
		/**
		 * Geeft het  aantal cijfers waaruit een getal bestaat
		 * @param	getal
		 * @return
		 */
		static public function lengte(getal:Number):Number
		{
			var antwoord:Number = Number(String(getal).length);
			return antwoord;
		}

		/**
		 * Onderzoekt of betal a een deler is van getal b
		 * @param	a
		 * @param	b
		 * @return
		 */
		static public function isDeler(a:Number, b:Number):Boolean
		{
			var antwoord:Boolean = false;
			if (GetalOperaties.isGeheelGetal(a) && GetalOperaties.isGeheelGetal(b))
			{
				if (a % b == 0)
				{
					antwoord = true;
				}
			}
			return antwoord;
		}
		
		/**
		 * Onderzoekt of een getal een Geheel getal is
		 * @param	a
		 * @return
		 */
		static public function isGeheelGetal(a:Number):Boolean
		{
			var antwoord:Boolean = false;
			
			if (a == Math.floor(a) || a == Math.ceil(a))
			{
				antwoord = true;
			}
			return antwoord;
		}
		
		/**
		 * Onderzoekt of een getal een Natuurlijk getal is
		 * @param	a
		 * @return
		 */
		static public function isNatuurlijkGetal(a:Number):Boolean
		{
			var antwoord:Boolean = false;
			
			if (a == Math.floor(a))
			{
				antwoord = true;
			}
			return antwoord;
		}
		
		/**
		 * Bepaalt de grootst gemene deler van twee Natuurlijke getallen
		 * @param	a
		 * @param	b
		 * @return
		 */
		static public function ggd(a:Number, b:Number):Number
		{
			if (isNatuurlijkGetal(a) && isNatuurlijkGetal(b))
			{
				var tmp:Number;
				while(b !=0)
				{
					tmp = a % b;
					a = b;
					b = tmp;					
				}
			}
			else
			{
				a = NaN;
			}
			return a;
			
		}
		

		
		/**
		 * Rondt een getal af op een aangegeven aantal decimalen. 
		 * @param	a
		 * @param	decimalen
		 * @return
		 */
		static public function afronding(a:Number,decimalen:Number):Number
		{
			var antwoord:Number;
			
			//onderzoek of decimalen een Geheel Getal is
			if (isGeheelGetal(decimalen))
			{
				var macht:Number = Math.pow(10, decimalen);
				antwoord = Math.round(macht * a) / macht;
				
			}
			else
			{
				antwoord = NaN;
			}
			
			return antwoord;
		}
		
		/**
		 * Geeft de wortel van de som van de kwadraten van de getallen a en b
		 * @param	a
		 * @param	b
		 * @return
		 */
		public static function pythagoras(a:Number, b:Number):Number
		{
			var c:Number;
			c = wortel(kwadraat(a) + kwadraat(b));
			return c;
			
		}
		
				/**
		 * Vertaalt een getal naar een Breuk
		 * @param	a
		 * @return
		 */
		
		 //public static function naarBreuk(a:Number):Breuk
		//{
			//var getal:Getal = new Getal(a);
			//var orde:Number = Math.pow(10, GetalOperaties.lengte(getal.decimaal));
			//var antwoord:Breuk = new Breuk(getal.entier * orde + getal.decimaal, orde);
			//antwoord = BreukOperaties.vereenvoudigen(antwoord);
			//return antwoord;
		//}
		
		/**
		 * Vertaalt een getal naar een Samengestelde Breuk
		 * @param	a
		 * @return
		 */
		//public static function naarSBreuk(a:Number):SBreuk
		//{
			//var entier:Number=0;
			//var teller:Number=NaN;
			//var noemer:Number=NaN;
//
			//maak van het getal een string
			//var getal:String = String(a);
//
			//onderzoek de string of er een punt in staat en geef de positie
			//var index:int = getal.indexOf(".");
//
			//if (index > 0)
			//{
				// bepaal de entier
				//entier = Number(getal.slice(0, index));
			//
				//bepaal de decimaal
				//var decimaal:Number = Number("0." + getal.slice(index + 1, getal.length));	
				//
				//het getal achter de punt wordt de teller
				//teller = Number(getal.slice(index + 1, getal.length));
				//
				//bepaal de orde van de decimaal
				//var orde:int = 0;
			//while (!GetalOperaties.isGeheelGetal(Math.pow(10,orde)*decimaal))
			//{
				//orde++;
			//}
			//noemer = Math.pow(10, orde);
			//}
			//else
			//{
				//entier = a;
			//}
			//var antwoord:SBreuk=new SBreuk(entier,teller,noemer);
			//return antwoord;
		//}
		
		/**
		 * Verlaagt getal a naar het dichtsbijzijnde Gehele getal
		 * @param	a
		 * @return
		 */
		public static function vloer(a:Number):Number
		{
			var antwoord:Number = Math.floor(a);
			return antwoord;
		}
		
		/**
		 * Verhoogt getal a naar het dichtstbijzijnde Gehele getal
		 * @param	a
		 * @return
		 */
		public static function plafond(a:Number):Number
		{
			var antwoord:Number = Math.ceil(a);
			return antwoord;
		}
		
		
		public static function numberNaarBreuk(a:Number):Breuk
		{	
			//maak van de Number een string.
			var sGetal:String = String(a);
	
			//onderzoek het getal of er een punt in staat en geef de positie
			var index:int = sGetal.indexOf(".");
			
			//splits het getal bij de punt
			var sEntier :String = sGetal.slice(0, index);
			var entier:Number = Number(sEntier);
			
			//vanaf de punt wordt het een decimaal
		    var sDecimaal:String = sGetal.slice(index + 1, sGetal.length);	
			
			var noemer:Number;
			var decimaal:Number;
			
			if (index< 0)
			{
				
				noemer = 1;
			}
			else
			{
				noemer =  Math.pow(10,Number(sDecimaal.length));
			}
			decimaal= Number(sDecimaal);
			
			var antwoord:Breuk = new Breuk(decimaal + entier*noemer,noemer );
			
			return antwoord;		
		}
		
		public static function getalNaarBreuk(g:Getal):Breuk
		{
			var antwoord:Breuk
			var ordeRepetend:Number;
			var entier:Number = g.entier;
			var entierBreuk:Breuk = new Breuk(entier, 1);
			
			if (g.repetend==0)
			{
				ordeRepetend = 1;
			}
			else
			{
				ordeRepetend = String(g.repetend).length;
			}
			
			if (isNaN(g.decimaal) )
			{
				antwoord = new Breuk(g.repetend, Math.pow(10, ordeRepetend)-1);
				antwoord = BreukOperaties.vereenvoudigen(antwoord);
			}
			else
			{
				var ordeDecimaal:Number = String(g.decimaal).length;
				var bDecimaal:Breuk = new Breuk(g.decimaal, Math.pow(10, ordeDecimaal));
				var bRepetend:Breuk = new Breuk(g.repetend, Math.pow(10,ordeDecimaal) * (Math.pow(10,ordeRepetend)-1));
				antwoord = BreukOperaties.som(bDecimaal, bRepetend);
				
				antwoord = BreukOperaties.vereenvoudigen(antwoord);
				antwoord = BreukOperaties.som(antwoord, entierBreuk);
				
			}

			return antwoord;
			
		}
	}

}
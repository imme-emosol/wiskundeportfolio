package wiskunde.operaties 
{
	import wiskunde.objecten.QGetal;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class QGetalOperaties
	{
		public static function construeerRepetend(repetend:String, len:Number):String
		{
			var antwoord:String = "";
			var lenRepetend:Number = repetend.length;
			//
			if (lenRepetend >= len)
			{
				antwoord = repetend.substr(0, len);
			}
			else
			{
				while (antwoord.length < len)
				{
					antwoord += repetend;
					
				}
				antwoord = antwoord.substr(0, len);
			}
			
			return antwoord;
		}
		
	}

}
package wiskunde.operaties 
{
	import adobe.utils.CustomActions;
	import wiskunde.objecten.Lijn;
	import wiskunde.objecten.Punt;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class LijnOperaties
	{
		public static function lijnDoorTweePunten(P:Punt, Q:Punt):Lijn
		{
			var antwoord:Lijn;
			var a:Number;
			var b:Number;
			var c:Number;
			
			a = -(P.y - Q.y);
			b = P.x - Q.x;
			c = a * P.x + b * P.y;
			
			antwoord = new Lijn(a, b, c);
			return antwoord;
		}
		
	}

}
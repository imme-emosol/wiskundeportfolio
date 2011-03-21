package wiskunde.objecten 
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Getal 
	{
		public var waarde:Number;
		
		public function Getal(waarde:Number) 
		{
			this.waarde = waarde;
			
		}
		
		public function telOp(getal:Getal):Getal
		{
			var antwoord:Getal = new Getal(this.waarde + getal.waarde);
			return antwoord;
		}
		
		public function trekAf(getal:Getal):Getal
		{
			var antwoord:Getal = new Getal(this.waarde - getal.waarde);
			return antwoord;
		}
		
		public function vermenigvuldigMet(getal:Getal):Getal
		{
			var antwoord:Getal = new Getal(this.waarde * getal.waarde);
			return antwoord;
		}
		
		public function deelDoor(getal:Getal):Getal
		{
			var antwoord:Getal = new Getal(this.waarde / getal.waarde);
			return antwoord;
		}
		
		
	}

}
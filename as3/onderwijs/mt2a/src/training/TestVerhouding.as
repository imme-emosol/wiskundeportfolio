package training 
{
	import flash.display.Sprite;
	import wiskunde.objecten.Verhouding;
	import wiskunde.operaties.VerhoudingsOperatie;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class TestVerhouding extends Sprite
	{
		
		public function TestVerhouding() 
		{
			var v:Verhouding = new Verhouding(48, 48);
			trace(v.deeltal);
			trace(v.deler);
			trace(v.quotient);
			
			var w:Verhouding = new Verhouding(80, 60);
			trace(w.deeltal);
			trace(w.deler);
			trace(w.quotient);
			
			var antw:Verhouding = VerhoudingsOperatie.optellen(v,w);
			
			trace(antw.deeltal);
			trace(antw.deler);
			trace(antw.quotient);
					
			
		}
		
	}

}
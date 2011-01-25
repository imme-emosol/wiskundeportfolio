package wiskunde.objecten 
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Hoek 
	{
		private var _graden:Number;
		private var _rad:Number;
		private var _omwentelingen:Number;
		
		public function Hoek(hoek:Number, g:Boolean = true) 
		{
			if (g)
			{
				// hoek is in graden
				_graden = hoek;
				_rad = gradenNaarRadialen(hoek);
				_omwentelingen = hoek / 360;
			}
			else
			{
				//hoek is in radialen
				_rad = hoek;
				_graden = radialenNaarGraden(hoek);
				_omwentelingen = _graden / 360;
				
			}
			
		}
		
		private function radialenNaarGraden(rad:Number):Number
		{
			var antwoord:Number = rad * 180 / Math.PI;
			return antwoord;
		}
		
		private function gradenNaarRadialen(grad:Number):Number
		{
			var antwoord:Number = grad * Math.PI / 180;
			return antwoord;
		}
		
		public function get graden():Number
		{
			return _graden;
		}
		
		public function get radialen():Number
		{
			return _rad;
		}
		
		public function get omwentelingen():Number
		{
			return _omwentelingen;
		}
		
		public function set graden(hoek:Number):void
		{
			_graden = hoek;
			_rad = gradenNaarRadialen(hoek);
			_omwentelingen = _graden / 360;
		}
		
		public function set radialen(hoek:Number):void
		{
			_graden = radialenNaarGraden(hoek);
			_rad = hoek;
			_omwentelingen = _graden / 360;
		}
	}

}
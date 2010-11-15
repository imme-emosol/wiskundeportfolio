package wiskunde.objecten.functies
{
	import flash.errors.IllegalOperationError;
	/**
	 * Abstracte klasse: geen instanties
	 * @author Jelle Sjollema
	 */
	public class Functie
	{
		
		public var abstracteVar:Number;

		public function maakFunctie(a:Number):void
		{
			var functie:IFunctie = this.factoryMethode();
			functie.manipulate();
		}
		
		
		/**
		 * Abstracte methode: moet overschreven worden
		 * @return null
		 */
		protected function  factoryMethode():IFunctie
		{
			throw new IllegalOperationError('absracte methode hebben geen instanties');
			return null
			
		}
		
		public function eenOfAndereFunctie():void
		{
			trace('een of andere functie');
		}
		
		
	}

}
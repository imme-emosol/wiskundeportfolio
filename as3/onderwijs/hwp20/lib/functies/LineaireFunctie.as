package wiskunde.objecten.functies
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class LineaireFunctie extends Functie
	{
		public var a:Number;
		
		override protected function factoryMethode():IFunctie
		{
			trace(this.a);
			trace('creatie TestFunctie');
			return new factLineaireFunctie();
		}
		
	}

}
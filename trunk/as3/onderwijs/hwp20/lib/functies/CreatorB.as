package wiskunde.objecten.functies
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class CreatorB extends Functie
	{
		override protected function factoryMethode():IFunctie
		{
			trace('creatie TestFunctie');
			return new TestFunctie();
		}
		
	}

}
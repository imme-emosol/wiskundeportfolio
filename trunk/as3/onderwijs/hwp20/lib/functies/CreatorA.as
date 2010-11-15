package wiskunde.objecten.functies
{
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class CreatorA extends Functie
	{
		override protected function factoryMethode():IFunctie
		{
			trace('creatie JelleFunctie');
			return new JelleFunctie();
		}
		
	}

}
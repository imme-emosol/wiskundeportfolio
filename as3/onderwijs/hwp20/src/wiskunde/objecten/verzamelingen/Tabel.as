package wiskunde.objecten.verzamelingen
{
	/**
	 * Legt data vast in de vorm van een tabel
	 * @author Jelle Sjollema
	 */
	public class Tabel
	{
		public var tabel:Array;
		public var id:int = 0;
		public var index:Boolean;
		
		public function Tabel(index:Boolean = false) 
		{
			
			this.tabel = new Array();
		}
		
		public function voerRijToe(...rij):void
		{
			if (index)
			{
				tabel.push(id, rij);
			}
			else
			{
				tabel.push(rij);
			}
			
			id++;
		}
		
	}

}
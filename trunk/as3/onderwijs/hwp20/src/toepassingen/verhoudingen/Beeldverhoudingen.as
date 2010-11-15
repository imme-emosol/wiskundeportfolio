package toepassingen.verhoudingen 
{
	import wiskunde.objecten.verzamelingen.Tabel;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Beeldverhoudingen extends Tabel
	{
		
		public function Beeldverhoudingen() 
		{
			this.voerRijToe("1", 1);
			this.voerRijToe("16:9 breedbeeld", 1.78);
			this.voerRijToe("4:3 traditioneel", 1.33);
			this.voerRijToe("2.39:1 film", 2.39);
			this.voerRijToe("1.41:1 A-formaat", 1.41);
			this.voerRijToe("1:1.41 A-formaat", 0.707);
			this.voerRijToe("1:0.62 Phi/ folio", 0.618);
			this.voerRijToe("1:1.62 16:10 breedbeeld - Phi", 1.62);
			this.voerRijToe("8.5:11 US-letter", 0.77);
			this.voerRijToe("11:16.9 tabloid", 0.65);
			this.voerRijToe("", 1.6);
			
		}
		
	}

}
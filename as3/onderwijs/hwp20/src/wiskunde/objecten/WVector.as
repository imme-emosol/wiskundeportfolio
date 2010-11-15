package wiskunde.objecten
{
	import flash.display.Sprite;
	import wiskunde.assets.Pijl
	import wiskunde.objecten.Hoek;
	/**
	 * Geeft met twee getallen een richting en een grootte
	 * @author Jelle Sjollema
	 */
	public class WVector extends Sprite
	{
		public var dx:Number;
		public var dy:Number;
		public var r:Number;
		public var hoek:Hoek;
		private var tekening:Boolean;
		private var kleur:uint;
		private var schaal:Number
		
		/**
		 * 
		 * @param	a: dx (als cs="c"), straal r (als cs="p")
		 * @param	b: dy (als cs="c"), hoek in radialen (als cs="p")
		 * @param	cs: coordinatensysteem "c" voor carthesiaans, "p" voor poolcoordinaten
		 */
		public function WVector(a:Number, b:Number,cs:String = "c") 
		{
			if (cs == "p")
			{
				this.r = a;
				this.hoek = new Hoek(b,"r");
				this.dx = r * Math.cos(hoek.rad);
				this.dy = r * Math.sin(hoek.rad);
			}
			else
			{
				this.dx = a;
				this.dy = b;
				this.r = Math.sqrt(dx*dx + dy*dy);
				this.hoek = new Hoek(Math.atan2(dy,dx),"r");				
			}
			tekening = false;
		
		}
		
		public function setVector(a:Number, b:Number,cs:String = "c"):void
		{
			if (cs == "p")
			{
				this.r = a;
				this.hoek = new Hoek(b,"r");
				this.dx = r * Math.cos(hoek.rad);
				this.dy = r * Math.sin(hoek.rad);
			}
			else
			{
				this.dx = a;
				this.dy = b;
				this.r = Math.sqrt(dx*dx + dy*dy);
				this.hoek = new Hoek(Math.atan2(dy,dx),"r");				
			}
			if (tekening)
			{
				teken(schaal, kleur);
			}
		
		}
			
		public function teken(schaal:Number, kleur:uint):void
		{

			tekening = true;
			while (this.numChildren > 0)
			{
				removeChildAt(0);
			}
			this.schaal = schaal;
			this.kleur = kleur;
			var pijl:Pijl = new Pijl(r * schaal, kleur);
			this.addChild(pijl);
			this.rotation = hoek.graden;
			
		}
	}
}
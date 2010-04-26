package org.wiskunde.algebra
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jelle Sjollema
	 */
	public class Getal extends Sprite
	{
		public var a:Number;
		public var entier:int;
		public var decimaal:Number;
		public var repetent:int;
		
		public function Getal(a:Number, rep:int = 0) 
		{
			this.a = a;
			this.entier = Math.floor(a);
			this.decimaal = a - entier;
		}
		
		public function set waarde(a:Number):void
		{
			this.a = a;
		}
		
	}

}
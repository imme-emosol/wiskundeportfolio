package wiskunde.objecten.functies
{
		import flash.display.Graphics;
		import flash.display.Sprite;
        import flash.errors.IllegalOperationError;
        import flash.utils.getQualifiedClassName;
 
        /**
         * Abstracte klasse Functie
         * @author Jelle Sjollema
         */
        public class Functie
        {
			public var params:Array;
			
			/**
			 * Functie
			 * Since this is a abstract class it is not allowed to instanciate this class.
			 */
			public function Functie()
			{
				if (getQualifiedClassName(this) == "wiskunde.objecten.functies::Functie")
				{
					throw new IllegalOperationError("Abstracte klasse, mag niet geinstantieerd worden");
				}
				
			}

			public function teken(min:Number, max:Number, schaal:Number = 1, kleur:uint = 0x000000 ):Sprite
			{
				var grafiek:Sprite;
				grafiek = new Sprite();
				//grafiek.scaleY = -1;
				
				var ordinaat:Number;
				var g:Graphics = grafiek.graphics;
				g.lineStyle(3, kleur);
				if (bereken(min) < 10000)
				{
					g.moveTo(min, bereken(min)*schaal);
				}
				else
				{
					g.moveTo(min+1, bereken(min+1)*schaal);
				}
				
				for (var i:int = min; i <= max; i++)
				{
					if (bereken(i) < 10000)
					{
						g.lineTo(i, bereken(i)*schaal);
					}
					else
					{
						g.moveTo(i+1, bereken(i+1)*schaal);
					}
					
				}
				return grafiek;
			}

			public function afgeleide():Functie
			{
				throw new IllegalOperationError("Abstract function must be ovverriden in subclass");
			}

			public function primitieve():Functie
			{
				throw new IllegalOperationError("Abstract function must be ovverriden in subclass");
			}
			
			public function bereken(uitvoer:Number):Number
			{
				throw new IllegalOperationError("Abstract function must be ovverriden in subclass");
			}
		}
}
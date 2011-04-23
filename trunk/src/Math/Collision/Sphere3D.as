package Math.Collision
{
	/**
	 * ...
	 * @author	Fred
	 * @date	2011.04.23
	 */	

	public class Sphere3D extends Shape3D
	{
		public var radius:Number;
		
		public function Sphere3D(radius:Number = 1)
		{
			super();
			this.radius = radius;
		}
	}
}
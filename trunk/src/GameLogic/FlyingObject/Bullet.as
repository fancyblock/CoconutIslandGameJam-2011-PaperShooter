package GameLogic.FlyingObject
{
	/**
	 * ...
	 * @author	Fred
	 * @date	2011.04.23
	 */	
	
	public class Bullet extends BaseFlyingObject
	{
		public var speed:Number;
		
		public function Bullet()
		{
			speed = 1;
		}
		
		public override function Update( delta:Number ):void {
			Position.z += speed * delta;
		}
	}
}
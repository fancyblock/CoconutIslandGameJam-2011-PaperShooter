package GameLogic.FlyingObject
{
	
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
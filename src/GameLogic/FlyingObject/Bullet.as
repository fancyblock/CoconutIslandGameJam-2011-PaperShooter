package GameLogic.FlyingObject
{
	import Event.CollisionEvent;
	
	import Math.Collision.AABB3D;
	import Math.Collision.Sphere3D;
	
	import Resource.ResourcePool;
	
	import flash.display.MovieClip;
	import flash.geom.Vector3D;

	/**
	 * ...
	 * @author	Fred
	 * @date	2011.04.23
	 */	
	
	public class Bullet extends BaseFlyingObject
	{
		public var speed:Vector3D;
		private var m_owner:IFlyingObject;
		
		public function Bullet(bulletType:int, owner:IFlyingObject)
		{
			speed = new Vector3D(1, 0, 0);
			
			m_mcV = ResourcePool.Singleton.GetBulletV(bulletType);
			m_mcH = ResourcePool.Singleton.GetBulletH(bulletType);
			
			m_owner = owner;
			
			addEventListener(CollisionEvent.TYPE, onCollision);
			
			//m_shape = new Sphere3D(10);
			
			( this.Shape as AABB3D ).min = new Vector3D( -10, -10, -10, 1 );
			( this.Shape as AABB3D ).max = new Vector3D( 10, 10, 10, 1 );
			
		}
		
		public function get owner():IFlyingObject
		{
			return m_owner;
		}
		
		private function onCollision(e:CollisionEvent):void {
			if(e.collidedObject == m_owner || e.collidedObject is Bullet)
				return;
				
			Alive = false;
			trace("Collides with " +e.collidedObject);
		}

		public override function Update( delta:Number ):void {
			Position.x += speed.x * delta;
			Position.y += speed.y * delta;
			Position.z += speed.z * delta;
			
			if(Position.z > m_host.ZLength)
				Alive = false;
		}
	}
}
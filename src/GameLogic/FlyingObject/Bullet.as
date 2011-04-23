package GameLogic.FlyingObject
{
	import Event.CollisionEvent;
	
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
		private var m_playerID:int;
		private var m_mcBulletV:MovieClip;
		private var m_mcBulletH:MovieClip;
		private var m_owner:IFlyingObject;
		
		public function Bullet(bulletType:int, owner:IFlyingObject)
		{
			speed = new Vector3D(1, 0, 0);
			m_playerID = playerID;
			
			m_mcBulletV = ResourcePool.Singleton.GetBulletV(bulletType);
			m_mcBulletH = ResourcePool.Singleton.GetBulletH(bulletType);
			
			m_owner = owner;
			
			addEventListener(CollisionEvent.TYPE, onCollision);
		}
		
		public function get owner():IFlyingObject
		{
			return m_owner;
		}

		public function get playerID():int
		{
			return m_playerID;
		}
		
		/**
		 * @desc	return the movieclip for this aspect
		 */
		override public function get VerticalMC():MovieClip 
		{ 
			return m_mcBulletV;
		}
		
		/**
		 * @desc	return the movieclip for this aspect
		 */
		override public function get HorizontalMC():MovieClip 
		{ 
			return m_mcBulletH;
		}	
		
		private function onCollision(e:CollisionEvent):void {
			//Alive = false;
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
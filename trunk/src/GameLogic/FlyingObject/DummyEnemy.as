package GameLogic.FlyingObject
{
	import Event.CollisionEvent;
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import Math.Collision.AABB3D;
	import Resource.ResourcePool;

	// The simplest form of enemy.
	// They don't shoot at the player nor move in the x-y plane.
	public class DummyEnemy extends Enemy
	{
		private var _mcH:MovieClip;
		private var _mcV:MovieClip;
		
		override public function get VerticalMC():MovieClip 
		{ 
			return _mcV;
		}
		
		override public function get HorizontalMC():MovieClip 
		{ 
			return _mcH;
		}
		
		public function DummyEnemy()
		{
			super();
			
			_mcH = ResourcePool.Singleton.GetDummyEnemyH();
			_mcV = ResourcePool.Singleton.GetDummyEnemyV();
		}
		
		override public function onAdd():void 
		{
			this.Position.x = this.m_host.XLength / 2;
			this.Position.y = this.m_host.YLength / 2;
			this.Position.z = this.m_host.ZLength;
			
			( this.Shape as AABB3D ).position = this.Position;
			( this.Shape as AABB3D ).min = new Vector3D( -10, -10, -10, 1 );
			( this.Shape as AABB3D ).max = new Vector3D( 10, 10, 10, 1 );
			
			addEventListener( CollisionEvent.TYPE, onCollision );
			
			Alive = true;
		}		
		
		override public function Update( delta:Number ):void
		{
			this.Position.z -= 1;
		}
		
		private function onCollision( e:CollisionEvent ):void
		{
			if ( e.collidedObject is Bullet )
			{
				removeEventListener( CollisionEvent.TYPE, onCollision );
				Alive = false;
			}
		}
	}
}

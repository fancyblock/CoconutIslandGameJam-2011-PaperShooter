package GameLogic.FlyingObject
{
	import Event.CollisionEvent;
	import Event.EnemyDestroyEvent;
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import Math.Collision.AABB3D;
	import Resource.ResourcePool;

	// The simplest form of enemy.
	// They don't shoot at the player nor move in the x-y plane.
	public class DummyEnemy extends Enemy
	{
		private static const BULLET_SPEED:Number = 80;
		
		private var _mcH:MovieClip;
		private var _mcV:MovieClip;
		private var _nextShot:Number;
		private var _elapsedTime:Number;
		
		override public function get ScoreValue():int
		{
			return 100;
		}
		
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
			
			
			( this.Shape as AABB3D ).position = this.Position;
			( this.Shape as AABB3D ).min = new Vector3D( -10, -10, -10, 1 );
			( this.Shape as AABB3D ).max = new Vector3D( 10, 10, 10, 1 );
			
			_nextShot = 0.5 + Math.random() * 2.5;
			_elapsedTime = 0;
		}
		
		override public function onAdd():void 
		{
			addEventListener( CollisionEvent.TYPE, onCollision );
			
			Alive = true;
		}		
		
		override public function Update( delta:Number ):void
		{
			_elapsedTime += delta;
			if(_elapsedTime >= _nextShot) {
				// dont shoot again for now
				_nextShot = 2 + Math.random() * 2;
				_elapsedTime = 0;
				
				var dir:Vector3D = GetPlayerDir();
				
				if(dir == null)
					return;
				
				dir.x *= BULLET_SPEED;
				dir.y *= BULLET_SPEED;
				dir.z *= BULLET_SPEED;
				
				shoot(dir);
			}
			
			this.Position.z -= 1;
			
			if(Position.z < 0)
				Alive = false;			
		}
		
		private function onCollision( e:CollisionEvent ):void
		{
			if ( (e.collidedObject is Bullet && Bullet(e.collidedObject).owner != this) 
				|| e.collidedObject is SpaceShip)
			{
				removeEventListener( CollisionEvent.TYPE, onCollision );
				Alive = false;
				dispatchEvent( new EnemyDestroyEvent() );
			}
		}
	}
}

package GameLogic.FlyingObject
{
	import Event.CollisionEvent;
	
	import Math.Collision.AABB3D;
	
	import Resource.ResourcePool;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Quad;
	
	import flash.geom.Vector3D;
	import Event.EnemyDestroyEvent;
	
	/**
	 * Crazy spinning enemy.
	 * @author	Fred
	 * @date	2011.04.23
	 */	
	

	public class SpinningEnemy extends Enemy
	{
		private static const SPEED:Number = 50;
		private static const BULLET_SPEED:Number = 160;		
		
		private var m_speed:Number;
		private var m_bulletSpeed:Number;
		private var m_rotation:Number;
		// this indicates if this enemy moves along the X or Y axis, or both
		// 0: x axis
		// 1: y axis
		// 2: both axis
		private var m_moveOnAxis:int;
		
		private var _nextShot:Number;
		private var _elapsedTime:Number;
		private var _difficulty:int;
		
		
		public function SpinningEnemy(difficulty:int = 2, moveOnAxis:int = -1)
		{
			super();
			
			m_speed = SPEED + Math.random()*SPEED;
			m_bulletSpeed = BULLET_SPEED - (2-difficulty)*30;
			m_rotation = 0;
			
			
			( this.Shape as AABB3D ).min = new Vector3D( -10, -10, -10, 1 );
			( this.Shape as AABB3D ).max = new Vector3D( 10, 10, 10, 1 );		
			
			addEventListener( CollisionEvent.TYPE, onCollision );
			
			_nextShot = Math.random() * 1;
			_elapsedTime = 0;

			if(moveOnAxis == -1)
				m_moveOnAxis = Math.random() > 0.5 ? 0 : 1;
			else
				m_moveOnAxis = moveOnAxis;
			
			if(moveOnAxis < 2) {
				m_mcV = ResourcePool.Singleton.GetEnemyV(FlyingObjTypeEnums.Enemy01);
				m_mcH = ResourcePool.Singleton.GetEnemyH(FlyingObjTypeEnums.Enemy01);
			}
			else {
				m_mcV = ResourcePool.Singleton.GetEnemyV(FlyingObjTypeEnums.Enemy03);
				m_mcH = ResourcePool.Singleton.GetEnemyH(FlyingObjTypeEnums.Enemy03);				
			}
			
			_difficulty = difficulty;
		}
		
		override public function get ScoreValue():int
		{
			return 300;
		}
		
		private function onCollision(e:CollisionEvent):void {
			
			if ( (e.collidedObject is Bullet && Bullet(e.collidedObject).owner != this) 
				|| e.collidedObject is SpaceShip)
			{
			
				Alive = false;
				trace("Spinning Enemy is DEAD!!! " +e.collidedObject);
				TweenMax.killTweensOf(this.Position);
				
				dispatchEvent( new EnemyDestroyEvent() );
			}
		}
		
		
		override public function onAdd():void 
		{
			nextWaypoint();
		}
		
		private function nextWaypoint():void {
			var duration:Number = 2;
			if(m_moveOnAxis == 0) {
				TweenMax.to(this.Position, duration, {x:Math.random() * m_host.XLength, ease:Quad.easeInOut, onComplete:nextWaypoint});
			}
			else if(m_moveOnAxis == 1) {
				TweenMax.to(this.Position, duration, {y:Math.random() * m_host.YLength, ease:Quad.easeInOut, onComplete:nextWaypoint});
			}
			else {
				TweenMax.to(this.Position, duration, {x:Math.random() * m_host.XLength, y:Math.random() * m_host.YLength, ease:Quad.easeInOut, onComplete:nextWaypoint});
			}
						
		}
		
				
		public override function Update( delta:Number ):void {
			//Position.x += m_speed * delta;
			//Position.y += m_speed * delta;
			Position.z -= m_speed * delta;
			
			m_rotation += 50 * delta + 150*delta*_difficulty;
			
			m_mcV.rotation = m_rotation;
			m_mcH.rotation = m_rotation;
						
			_elapsedTime += delta;
			if(_elapsedTime >= _nextShot) {
				
				if(_difficulty == 1)
					_nextShot = 1 + Math.random() * 3;
				else if(_difficulty == 2)
					_nextShot = Math.random() * 2;
				
				_elapsedTime = 0;
				
				var dir:Vector3D = GetPlayerDir();
				
				if(dir == null)
					return;
				
				dir.x *= m_bulletSpeed;
				dir.y *= m_bulletSpeed;
				dir.z *= m_bulletSpeed;
				
				if(_difficulty > 0)
					shoot(dir);
			}			
			
			if(Position.z < 0)
				Alive = false;
		}
		
	}
}
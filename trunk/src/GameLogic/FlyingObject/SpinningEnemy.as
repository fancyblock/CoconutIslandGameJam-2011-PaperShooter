package GameLogic.FlyingObject
{
	import Event.CollisionEvent;
	
	import Math.Collision.AABB3D;
	
	import Resource.ResourcePool;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Quad;
	
	import flash.geom.Vector3D;
	
	/**
	 * Crazy spinning enemy.
	 * @author	Fred
	 * @date	2011.04.23
	 */	
	

	public class SpinningEnemy extends Enemy
	{
		private static const SPEED:Number = 50;
		
		private var m_speed:Number;
		private var m_rotation:Number;
		// this indicates if this enemy moves along the X or Y axis
		private var m_moveOnX:Boolean;
		
		public function SpinningEnemy()
		{
			super();
			
			m_speed = SPEED + Math.random()*SPEED;
			m_rotation = 0;
			
			m_mcV = ResourcePool.Singleton.GetEnemyV(FlyingObjTypeEnums.Enemy01);
			m_mcH = ResourcePool.Singleton.GetEnemyH(FlyingObjTypeEnums.Enemy01);
			
			( this.Shape as AABB3D ).min = new Vector3D( -10, -10, -10, 1 );
			( this.Shape as AABB3D ).max = new Vector3D( 10, 10, 10, 1 );		
			
			addEventListener( CollisionEvent.TYPE, onCollision );
		}
		
		
		private function onCollision(e:CollisionEvent):void {
			Alive = false;
			trace("Spinning Enemy is DEAD!!! " +e.collidedObject);
			TweenMax.killTweensOf(this);
		}
		
		
		override public function onAdd():void 
		{
			m_moveOnX = Math.random() > 0.5 ? true : false;
			nextWaypoint();
		}
		
		private function nextWaypoint():void {
			var duration:Number = 2;
			if(m_moveOnX) {
				TweenMax.to(this.Position, duration, {x:Math.random() * m_host.XLength, ease:Quad.easeInOut, onComplete:nextWaypoint});
			}
			else {
				TweenMax.to(this.Position, duration, {y:Math.random() * m_host.YLength, ease:Quad.easeInOut, onComplete:nextWaypoint});
			}
						
		}
		
				
		public override function Update( delta:Number ):void {
			//Position.x += m_speed * delta;
			//Position.y += m_speed * delta;
			Position.z -= m_speed * delta;
			
			m_rotation += 50 * delta;
			
			m_mcV.rotation = m_rotation;
			m_mcH.rotation = m_rotation;
			
			if(Position.z < 0)
				Alive = false;
		}
		
	}
}
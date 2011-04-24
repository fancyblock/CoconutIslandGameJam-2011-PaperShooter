package GameLogic.FlyingObject
{
	import Event.CollisionEvent;
	
	import GameLogic.FlyingObject.BaseFlyingObject;
	import GameLogic.FlyingObject.IFlyingObject;
	
	import Math.Collision.AABB3D;
	
	import Resource.ResourcePool;
	
	import Sound.SoundEnums;
	import Sound.SoundManager;
	
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.core.InputKey;
	
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class SpaceShip extends BaseFlyingObject
	{
		//-------------------------------- static member ---------------------------------
		
		static private const SPEED:Number = 100; 
		static private const BULLET_SPEED:Number = 360;
		static public const PLAYER_1:int = 1;
		static public const PLAYER_2:int = 2;
		
		//-------------------------------- private member --------------------------------
		
		public var m_mcShipV:MovieClip = null;
		public var m_mcShipH:MovieClip = null;
		
		private var m_player1Shot:Boolean = false;
		private var m_player2Shot:Boolean = false;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function SpaceShip() 
		{
			//set the mc of this object
			m_mcShipV = ResourcePool.Singleton.GetSpaceShipV();
			m_mcShipH = ResourcePool.Singleton.GetSpaceShipH();
			
			( this.Shape as AABB3D ).min = new Vector3D( -10, -10, -10, 1 );
			( this.Shape as AABB3D ).max = new Vector3D( 10, 10, 10, 1 );	
			addEventListener(CollisionEvent.TYPE, onCollision);
		}
		
		/**
		 * @desc	callback when this object be add to the space
		 */
		override public function onAdd():void 
		{
			//set the position when ship be add to the space
			this.Position.x = this.m_host.XLength / 2;
			this.Position.y = this.m_host.YLength / 2;
			this.Position.z = this.m_host.ZLength / 10;
			
			//stage.addEventListener(Event.
		}
		
		/**
		 * @desc	return the movieclip for this aspect
		 */
		override public function get VerticalMC():MovieClip 
		{ 
			return m_mcShipV;
		}
		
		/**
		 * @desc	return the movieclip for this aspect
		 */
		override public function get HorizontalMC():MovieClip 
		{ 
			return m_mcShipH;
		}
		
		/**
		 * @desc	update
		 * @param	delta
		 */
		override public function Update( delta:Number ):void
		{
			//detect the input for move fire
			inputDectect(delta);
			
			//TODO:
		}
		
		/**
		 * @desc	return the type
		 */
		override public function get Type():int
		{
			return FlyingObjTypeEnums.SpaceShip;
		}
		
		//-------------------------------- private function --------------------------------
		private function spawnBullet(playerID:int):void {
			
			var bulletType:int;
			var speed:Vector3D;
			if(playerID == SpaceShip.PLAYER_1) {
				bulletType = FlyingObjTypeEnums.Bullet01; 
			}
			else {
				bulletType = FlyingObjTypeEnums.Bullet02;				
			}
	
			var bullet:Bullet = new Bullet(bulletType, this);
			bullet.speed = new Vector3D(0, 0, BULLET_SPEED);
			bullet.Position.x = Position.x;
			bullet.Position.y = Position.y;
			bullet.Position.z = Position.z;
			
			m_host.AddObject(bullet);
			
			SoundManager.Singleton.PlaySE( Sound.SoundEnums.SE_Fire );
			
			trace("spawn bullet");
		}
		
		private function inputDectect(delta:Number):void
		{
			var incX:Number = 0;
			var incY:Number = 0;
			
			
			if ( PBE.isKeyDown( InputKey.A ) )	//left
			{
				incX = -SPEED * delta;
			}
			else if ( PBE.isKeyDown( InputKey.D ) )	//right
			{
				incX = SPEED * delta;
			}
			
			if ( PBE.isKeyDown( InputKey.UP ) )	//up
			{
				incY = SPEED * delta;
			}
			else if ( PBE.isKeyDown( InputKey.DOWN ) )	//down
			{
				incY = -SPEED * delta;
			}
			
			// Player 1 shoots
			//if( PBE.inputManager.keyJustPressed(InputKey.W.keyCode)) {
			if( PBE.isKeyDown( InputKey.W )) {
				if(!m_player1Shot) {
					spawnBullet(PLAYER_1);
					m_player1Shot = true;
				}
				
			}
			else
				m_player1Shot = false;
			

			// Player 2 shoots
			//if( PBE.inputManager.keyJustPressed(InputKey.SPACE.keyCode)) {
			if( PBE.isKeyDown( InputKey.SPACE )) {
				if(!m_player2Shot) {
					spawnBullet(PLAYER_2);
					m_player2Shot = true;
				}
				
				
			}
			else
				m_player2Shot = false;
			
			//change the position
			if ( outOfSpace( this.Position.x, this.Position.y, incX, incY ) == false )
			{
				this.Position.x += incX;
				this.Position.y += incY;
			}
		}
		
		//judge if this object is out of the space or not
		private function outOfSpace( x:Number, y:Number, xInc:Number, yInc:Number ):Boolean
		{
			var nextPosX:Number = x + xInc;
			var nextPosY:Number = y + yInc;
			
			if ( nextPosX < 0 || nextPosY < 0 || nextPosX > m_host.XLength || nextPosY > m_host.YLength )
			{
				return true;
			}
			
			return false;
		}
		
		
		//-------------------------------- callback function --------------------------------

		
		private function onCollision(e:CollisionEvent):void {
			// do not collide with my own bullets
			if(e.collidedObject is Bullet && Bullet(e.collidedObject).owner == this)
				return;
			
			Alive = false;
			//trace("Collides with " +e.collidedObject);
		}		
	}

}
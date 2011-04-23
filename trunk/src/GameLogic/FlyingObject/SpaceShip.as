package GameLogic.FlyingObject
{
	import GameLogic.FlyingObject.BaseFlyingObject;
	import GameLogic.FlyingObject.IFlyingObject;
	
	import Resource.ResourcePool;
	
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
		
		static private const SPEED:Number = 5; 
		static private const BULLET_SPEED:Number = 120;
		static public const PLAYER_1:int = 1;
		static public const PLAYER_2:int = 2;
		
		//-------------------------------- private member --------------------------------
		
		public var m_mcShipV:MovieClip = null;
		public var m_mcShipH:MovieClip = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function SpaceShip() 
		{
			//set the mc of this object
			m_mcShipV = ResourcePool.Singleton.GetSpaceShipV();
			m_mcShipH = ResourcePool.Singleton.GetSpaceShipH();
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
			inputDectect();
			
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
			
			trace("spawn bullet");
		}
		
		private function inputDectect():void
		{
			var incX:Number = 0;
			var incY:Number = 0;
			
			if ( PBE.isKeyDown( InputKey.A ) )	//left
			{
				incX = -SPEED;
			}
			else if ( PBE.isKeyDown( InputKey.D ) )	//right
			{
				incX = SPEED;
			}
			
			if ( PBE.isKeyDown( InputKey.UP ) )	//up
			{
				incY = SPEED;
			}
			else if ( PBE.isKeyDown( InputKey.DOWN ) )	//down
			{
				incY = -SPEED;
			}
			
			// Player 1 shoots
			if( PBE.inputManager.keyJustPressed(InputKey.W.keyCode)) {
				spawnBullet(PLAYER_1);
			}

			// Player 2 shoots
			if( PBE.inputManager.keyJustPressed(InputKey.SPACE.keyCode)) {
				spawnBullet(PLAYER_2);
			}
			
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
		
	}

}
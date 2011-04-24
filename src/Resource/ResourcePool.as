package Resource
{
	import GameLogic.FlyingObject.FlyingObjTypeEnums;
	
	import flash.display.MovieClip;

	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class ResourcePool 
	{
		//-------------------------------- static member ---------------------------------
		
		static private var m_instance:ResourcePool = null;
		static private var m_safeFlag:Boolean = false;
		
		//-------------------------------- private member --------------------------------
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	return the singleton of this class
		 */
		static public function get Singleton():ResourcePool
		{
			if ( m_instance == null )
			{
				m_safeFlag = true;
				m_instance = new ResourcePool();
				m_safeFlag = false;
			}
			
			return m_instance;
		}
		
		/**
		 * @desc	constructor
		 */
		public function ResourcePool() 
		{
			if ( m_safeFlag == false )
			{
				throw new Error( "[Error]: this is a singleton, can not be new directly" );
			}
		}
		
		/**
		 * @desc	return the mc of spaceship v
		 * @return
		 */
		public function GetSpaceShipV():MovieClip
		{
			return ( new mcPlayerShipVRes );
		}
		
		/**
		 * @desc	return the mc of spaceship h
		 * @return
		 */
		public function GetSpaceShipH():MovieClip
		{
			return ( new mcPlayerShipHRes );
		}
				
		private function GetBullet(bulletType:int):MovieClip {
			var color:uint;
			
			switch(bulletType) {
				case FlyingObjTypeEnums.Bullet01:
					color = 0xF88017;
					break;
				case FlyingObjTypeEnums.Bullet02:
					color = 0x1010FF;
					break;
				case FlyingObjTypeEnums.Bullet03:
					color = 0xFFFFFF;
					break;
				case FlyingObjTypeEnums.Bullet04:
					color = 0xFFFF00;
					break;
			}
			
			var mc:MovieClip = new MovieClip();
			mc.graphics.beginFill(color);
			mc.graphics.drawCircle(0, 0, 5);
			mc.graphics.endFill();
			return ( mc );
			
		}
		
		public function GetBulletV(bulletType:int):MovieClip {
			return GetBullet(bulletType);
		}
		public function GetBulletH(bulletType:int):MovieClip {
			return GetBullet(bulletType);
		}
		
		public function GetLockOn():MovieClip
		{
			return new mcLockOnRes;
		}
		
		public function GetEnemyV(enemyType:int):MovieClip {
			return GetEnemy(enemyType);
		}

		public function GetDummyEnemyV():MovieClip
		{
			return new mcDummyVRes;
		}

		public function GetEnemyH(enemyType:int):MovieClip  {
			return GetEnemy(enemyType);
		}
		
		
		private function GetEnemy(enemyType:int):MovieClip {
			var color:uint;
			
			switch(enemyType) {
				case FlyingObjTypeEnums.Enemy01:
					color = 0xFF00FF;
					break;
				case FlyingObjTypeEnums.Enemy02:
					color = 0x00FF00;
					break;
				case FlyingObjTypeEnums.Enemy03:
					color = 0x00FFFF;
					break;
			}
			
			var mc:MovieClip = new MovieClip();
			mc.graphics.beginFill(color);
			mc.graphics.drawRect(-10, -10, 20, 20);
			mc.graphics.endFill();
			return ( mc );
			
		}

		public function GetDummyEnemyH():MovieClip
		{
			return new mcDummyHRes;
		}
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}
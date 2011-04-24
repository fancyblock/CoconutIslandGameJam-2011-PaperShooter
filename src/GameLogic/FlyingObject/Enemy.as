package GameLogic.FlyingObject
{
	import Resource.ResourcePool;
	
	import Sound.SoundManager;
	
	import flash.display.MovieClip;
	import flash.geom.Vector3D;

	/**
	 * ...
	 * @author	Fred
	 * @date	2011.04.23
	 */	

	public class Enemy extends BaseFlyingObject
	{
		private var _lockedOnV:Boolean = false;
		private var _lockedOnH:Boolean = false;
		private var _lockedOnMcV:MovieClip;
		private var _lockedOnMcH:MovieClip;
		
		public function set LockedOnV( lockedOn:Boolean ):void
		{
			_lockedOnV = lockedOn;
			
			if ( _lockedOnV )
			{
				this.VerticalMC.addChild( _lockedOnMcV );
			}
			else
			{
				this.VerticalMC.removeChild( _lockedOnMcV );
			}
		}
		
		public function get LockedOnV():Boolean
		{
			return _lockedOnV;
		}
		
		public function set LockedOnH( lockedOn:Boolean ):void
		{
			_lockedOnH = lockedOn;
			
			if ( _lockedOnH )
			{
				this.HorizontalMC.addChild( _lockedOnMcH );
			}
			else
			{
				this.HorizontalMC.removeChild( _lockedOnMcH );
			}
		}
		
		public function get LockedOnH():Boolean
		{
			return _lockedOnH;
		}
		
		public function Enemy()
		{
			super();
			
			_lockedOnMcV = ResourcePool.Singleton.GetLockOn();
			_lockedOnMcH = ResourcePool.Singleton.GetLockOn();
		}
		
		public function GetPlayer():IFlyingObject {
			var array:Array = m_host.ObjectList.filter(
				function(item:*, index:int, array:Array):Boolean {
					return item is SpaceShip;
				});			
			
			if(array.length > 0)
				return IFlyingObject(array[0]);
			
			return null;
		}
		
		public function GetPlayerDir():Vector3D {
			var player:IFlyingObject = GetPlayer();
			
			if(player == null)
				return null;
			
			var dir:Vector3D = player.Position.subtract(this.Position);
			dir.normalize();
			
			return dir;
		}
		
		public function shoot(speed:Vector3D):void {
			
			var bullet:Bullet = new Bullet(FlyingObjTypeEnums.Bullet03, this);
			bullet.speed = new Vector3D(speed.x, speed.y, speed.z);
			bullet.Position.x = Position.x;
			bullet.Position.y = Position.y;
			bullet.Position.z = Position.z;
			
			m_host.AddObject(bullet);
			
			SoundManager.Singleton.PlaySE( Sound.SoundEnums.SE_Fire );						
			
		} 		
	}
}
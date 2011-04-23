package GameLogic.FlyingObject
{
	import flash.display.MovieClip;
	import Resource.ResourcePool;
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
	}
}
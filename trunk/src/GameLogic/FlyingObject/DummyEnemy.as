package GameLogic.FlyingObject
{
	import flash.display.MovieClip;
	import Resource.ResourcePool;

	public class DummyEnemy extends Enemy
	{
		private var _mcH:MovieClip;
		private var _mcV:MovieClip;
		
		public function DummyEnemy()
		{
			super();
			
			_mcH = ResourcePool.Singleton.GetSpaceShipH();
			_mcV = ResourcePool.Singleton.GetSpaceShipV();
		}
		
		override public function get Alive():Boolean
		{
			return true;
		}
		
		/**
		 * @desc	callback when this object be add to the space
		 */
		override public function onAdd():void 
		{
			this.Position.z = this.m_host.ZLength;
			this.Position.x = this.m_host.XLength / 2;
			this.Position.y = this.m_host.YLength / 2;
		}
		
		/**
		 * @desc	return the movieclip for this aspect
		 */
		override public function get VerticalMC():MovieClip 
		{ 
			return _mcV;
		}
		
		/**
		 * @desc	return the movieclip for this aspect
		 */
		override public function get HorizontalMC():MovieClip 
		{ 
			return _mcH;
		}
		
		override public function Update( delta:Number ):void
		{
			this.Position.z += 5;
		}
	}
}

package GameLogic.FlyingObject
{
	import flash.display.MovieClip;
	import GameLogic.FlyingObject.IFlyingObject;
	import GameLogic.FlyingObject.BaseFlyingObject;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.core.InputKey;
	import Resource.ResourcePool;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class SpaceShip extends BaseFlyingObject
	{
		//-------------------------------- static member ---------------------------------
		
		static private const SPEED:Number = 5; 
		
		//-------------------------------- private member --------------------------------
		
		private var m_alive:Boolean;
		
		public var m_mcShipV:MovieClip = null;
		public var m_mcShipH:MovieClip = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function SpaceShip() 
		{
			m_alive = true;
			
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
			trace( this.Position.x, this.Position.y );
			
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
		
		/**
		 * @desc	return the state of this spaceship
		 */
		override public function get Alive():Boolean
		{
			return m_alive;
		}
		
		//-------------------------------- private function --------------------------------
		
		private function inputDectect():void
		{
			if ( PBE.isKeyDown( InputKey.A ) )	//left
			{
				this.Position.x -= SPEED;
			}
			else if ( PBE.isKeyDown( InputKey.D ) )	//right
			{
				this.Position.x += SPEED;
			}
			
			if ( PBE.isKeyDown( InputKey.UP ) )	//up
			{
				this.Position.y += SPEED;
			}
			else if ( PBE.isKeyDown( InputKey.DOWN ) )	//down
			{
				this.Position.y -= SPEED;
			}
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}
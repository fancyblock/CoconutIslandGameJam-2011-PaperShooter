package GameLogic.FlyingObject
{
	import GameLogic.FlyingObject.IFlyingObject;
	import GameLogic.FlyingObject.BaseFlyingObject;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.core.InputKey;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class SpaceShip extends BaseFlyingObject
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_alive:Boolean;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function SpaceShip() 
		{
			m_alive = true;
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
				//
			}
			else if ( PBE.isKeyDown( InputKey.B ) )	//right
			{
				//
			}
			//else if( PBE.isKeyDown( InputKey.
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}
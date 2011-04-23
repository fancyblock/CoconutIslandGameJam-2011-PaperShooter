package GameLogic.FlyingObject
{
	import GameLogic.FlyingObject.IFlyingObject;
	
	import Math.Collision.Shape3D;
	
	import flash.events.EventDispatcher;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class BaseFlyingObject extends EventDispatcher implements IFlyingObject
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_shape:Shape3D;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function BaseFlyingObject() 
		{
		}
		
		/**
		 * @desc	return the positon of this object
		 */
		public function get Position():Vector3D
		{
			return m_shape.position;
		}
		
		/**
		 * @desc	set the position of this object
		 */
		public function set Position( val:Vector3D ):void
		{
			m_shape.position = val;
		}
		
		public function get Shape():Shape3D {
			return m_shape;
		}		
		
		/**
		 * @desc	update
		 * @param	delta
		 */
		public function Update( delta:Number ):void{}
		
		/**
		 * @desc	return the type
		 */
		public function get Type():int { return 0; }
		
		/**
		 * @desc	return the state of this object
		 */
		public function get Alive():Boolean { return true; }
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}
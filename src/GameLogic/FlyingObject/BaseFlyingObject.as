package GameLogic.FlyingObject
{
	import flash.geom.Vector3D;
	import GameLogic.FlyingObject.IFlyingObject;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class BaseFlyingObject implements IFlyingObject 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_position:Vector3D = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function BaseFlyingObject() 
		{
			m_position = new Vector3D();
		}
		
		/**
		 * @desc	return the positon of this object
		 */
		public function get Position():Vector3D
		{
			return m_position;
		}
		
		/**
		 * @desc	set the position of this object
		 */
		public function set Position( val:Vector3D ):void
		{
			m_position = val;
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
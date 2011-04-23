package GameLogic
{
	import flash.geom.Vector3D;
	import GameLogic.FlyingObject.IFlyingObject;
	import GameLogic.ISpace;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class Battlefield implements ISpace 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_objectList:Array = null;
		private var m_spaceSize:Vector3D = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function Battlefield( xSize:Number, ySize:Number, zSize:Number )
		{
			m_spaceSize = new Vector3D( xSize, ySize, zSize );
			m_objectList = new Array();
		}
		
		/**
		 * @desc	return the length of x 
		 */
		public function get XLength():Number
		{
			return m_spaceSize.x;
		}
		
		/**
		 * @desc	return the length of y
		 */
		public function get YLength():Number
		{
			return m_spaceSize.y;
		}
		
		/**
		 * @desc	return the length of z
		 */
		public function get ZLength():Number
		{
			return m_spaceSize.z;
		}
		
		/**
		 * @desc	return the objectlist
		 */
		public function get ObjectList():Array
		{
			return m_objectList;
		}
		
		/**
		 * @desc	update the space
		 * @param	delta
		 */
		public function Update( delta:Number ):void
		{
			for each( var obj:IFlyingObject in m_objectList )
			{
				obj.Update( delta );
			}
		}
		
		/**
		 * @desc	add a object to the space
		 * @param	obj
		 */
		public function AddObject( obj:IFlyingObject ):void
		{
			m_objectList.push( obj );
		}
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}
package GameLogic
{
	import Event.CollisionEvent;
	import Math.Collision.AABB3D;
	import Math.Collision.Shape3D;
	
	import GameLogic.FlyingObject.BaseFlyingObject;
	import GameLogic.FlyingObject.Enemy;
	import GameLogic.FlyingObject.IFlyingObject;
	import GameLogic.ISpace;
	
	import flash.geom.Vector3D;
	
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
		
		private var m_aabb:AABB3D = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function Battlefield( xSize:Number, ySize:Number, zSize:Number )
		{
			m_spaceSize = new Vector3D( xSize, ySize, zSize );
			m_objectList = new Array();
			
			m_aabb = new AABB3D();
			m_aabb.position = new Vector3D();
			m_aabb.min = new Vector3D();
			m_aabb.max = new Vector3D( xSize, ySize, zSize );
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
				// check for collisions
				checkCollisions(obj);
				checkEscapeObject( obj );
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
			obj.Host = this;
		}
		
		/**
		 * @desc	return the shape of this space
		 */
		public function get AABB():AABB3D
		{
			return m_aabb;
		}
		
		//-------------------------------- private function --------------------------------
		
		private function checkCollisions(fromObj:IFlyingObject):void {
			
			// only check collisions from Bullet/Player to Enemy
			if(fromObj is Enemy)
				return;
			
			for each( var toObj:IFlyingObject in m_objectList )
			{
				if(toObj == fromObj)
					continue;
				
				if(fromObj.Shape.intersects(toObj.Shape)) {
					// objects collided, send CollisionEvent message
					fromObj.dispatchEvent(new CollisionEvent(toObj));
					toObj.dispatchEvent(new CollisionEvent(fromObj));
				}
					
			}			
		}
		
		//judge if the object is escape the space, mark alive as false if escaped
		private function checkEscapeObject( obj:IFlyingObject ):void
		{
			//
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}
package GameLogic.FlyingObject
{
	import flash.display.MovieClip;
	import GameLogic.FlyingObject.IFlyingObject;
	import GameLogic.ISpace;
	import Math.Collision.AABB3D;
	
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
		
		protected var m_host:ISpace = null;
		protected var m_shape:Shape3D;
		protected var m_mcV:MovieClip;
		protected var m_mcH:MovieClip;
		
		private var m_alive:Boolean = true;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function BaseFlyingObject() 
		{
			m_shape = new AABB3D();
		}
		
		/**
		 * @desc	set the host of this object
		 */
		public function set Host( host:ISpace ):void
		{
			m_host = host;
			onAdd();
		}
		
		/**
		 * @desc	callback when this object be add to the space
		 */
		public function onAdd():void {}
		
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
		public function get Alive():Boolean { return m_alive; }
		
		/**
		 * @desc	set the alive value
		 */
		public function set Alive( val:Boolean ):void { m_alive = val; }
		
		/**
		 * @desc	return the movieclip for this aspect
		 */
		public function get VerticalMC():MovieClip { return m_mcV; }
		
		/**
		 * @desc	return the movieclip for this aspect
		 */
		public function get HorizontalMC():MovieClip { return m_mcH; }
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}
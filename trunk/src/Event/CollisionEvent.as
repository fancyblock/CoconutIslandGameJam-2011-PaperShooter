package Event
{
	import GameLogic.FlyingObject.IFlyingObject;
	
	import flash.events.Event;
	
	/**
	 * ...
	 * @author	Fred
	 * @date	2011.04.23
	 */		
	
	public class CollisionEvent extends Event
	{
		public static const TYPE:String = "EventCollision";
		
		private var _collidedObject:IFlyingObject;
		
		public function CollisionEvent(collidedObject:IFlyingObject)
		{
			super(TYPE);
			_collidedObject = collidedObject;
		}
		
		
		public function get collidedObject():IFlyingObject
		{
			return _collidedObject;
		}

	}
}
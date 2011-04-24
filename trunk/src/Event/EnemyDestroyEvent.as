package  Event
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class EnemyDestroyEvent extends Event 
	{
		public static const TYPE:String = "EnemyDestroy";
		
		public function EnemyDestroyEvent(bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(EnemyDestroyEvent.TYPE, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new EnemyDestroyEvent(bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("EnemyDestroyEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}
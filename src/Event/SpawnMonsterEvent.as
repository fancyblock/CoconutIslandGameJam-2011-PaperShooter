package Event
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author	Fred
	 * @date	2011.04.23
	 */			
	public class SpawnMonsterEvent extends Event
	{
		public static const TYPE:String = "EventSpawnMonster";		
		
		private var m_monsterType:int; 
		
		public function SpawnMonsterEvent(monsterType:int)
		{
			super(TYPE);
			m_monsterType = monsterType;
		}
		
		public function get monsterType():int {
			return m_monsterType;
		}
	}
}
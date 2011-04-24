package GameLogic
{
	import Event.SpawnMonsterEvent;
	
	import GameLogic.FlyingObject.DummyEnemy;
	import GameLogic.FlyingObject.Enemy;
	import GameLogic.FlyingObject.FlyingObjTypeEnums;
	import GameLogic.FlyingObject.SpinningEnemy;
	
	import flash.events.EventDispatcher;
	import flash.geom.Vector3D;
	
	/**
	 * This class should be a normal GameObject. But we don't have such class, and it doesn't make sense to 
	 * make it an IFlyingObject. So for now, it's like this.
	 * @author	Fred
	 * @date	2011.04.23
	 */	
	
	public class EnemySpawner extends EventDispatcher
	{
		public var elapsedTime:Number;
		private var m_nextSpawn:Number;
		private var m_host:ISpace = null;
		
		public function EnemySpawner(host:ISpace)
		{
			m_host = host;
			addEventListener(SpawnMonsterEvent.TYPE, onSpawnMonster);
			elapsedTime = 0;
			m_nextSpawn = 4;
		}
		
		public function Update( delta:Number ):void
		{
			elapsedTime += delta;
			
			if(elapsedTime >= m_nextSpawn) {
				elapsedTime = 0;
				spawnRandomMonster();
			}
		}
		
		private function spawnRandomMonster():void {
			dispatchEvent(new SpawnMonsterEvent(FlyingObjTypeEnums.Enemy01 + Math.random()*3))
		}
		
		
		private function onSpawnMonster(e:SpawnMonsterEvent):void {
			var monster:Enemy = null;
			
			switch(e.monsterType) {
				case(FlyingObjTypeEnums.Enemy01):
					monster = new DummyEnemy();
					break;
				case(FlyingObjTypeEnums.Enemy02):
				case(FlyingObjTypeEnums.Enemy03):
					monster = new SpinningEnemy();
					break;
			}
						
			monster.Position.x = Math.random() * ( m_host.XLength - 40 ) + 20;
			monster.Position.y = Math.random() * ( m_host.YLength - 40 ) + 20;
			monster.Position.z = m_host.ZLength - 20;
			m_host.AddObject(monster);
			
			m_nextSpawn = 2 + Math.random() * 2; 
		}
	}
}
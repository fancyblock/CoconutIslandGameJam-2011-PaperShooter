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
		
		private var _lastDifficulty:int = -1;
		
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
			
			m_nextSpawn -= delta;
			
			if(m_nextSpawn <= 0) {
				spawnRandomMonster();
			}
			
			if(difficulty != _lastDifficulty) {
				_lastDifficulty = difficulty;
				trace("--> Difficulty: " + difficulty);
			}
		}
		
		private function get difficulty():int {
			var difficulty:int = 0;
			if(elapsedTime < 10)
				difficulty = 0;
			else if(elapsedTime < 20)
				difficulty = 1;
			else if(elapsedTime < 30)
				difficulty = 2;
			else if(elapsedTime < 40)
				difficulty = 3;
			else if(elapsedTime < 50)
				difficulty = 4;
			else if(elapsedTime < 60)
				difficulty = 5;
			else
				difficulty = 6;
			
			return difficulty;
		}
		
		private function getEnemyTypeByChance(chance:Number):int {
			
			if(difficulty < 1) {
				if(chance < 0.7)
					return FlyingObjTypeEnums.Enemy01;
				else
					return FlyingObjTypeEnums.Enemy02;
			}
			else if(difficulty < 2) {
				if(chance < 0.6)
					return FlyingObjTypeEnums.Enemy01;
				else
					return FlyingObjTypeEnums.Enemy02;
			}
			else if(difficulty < 3) {
				if(chance < 0.5)
					return FlyingObjTypeEnums.Enemy01;
					return FlyingObjTypeEnums.Enemy02;
			}
			else if(difficulty < 4) {
				if(chance < 0.3)
					return FlyingObjTypeEnums.Enemy01;
				else if(chance < 0.8)
					return FlyingObjTypeEnums.Enemy02;
				else
					return FlyingObjTypeEnums.Enemy03;
			}
			else if(difficulty < 5) {
				if(chance < 0.3)
					return FlyingObjTypeEnums.Enemy01;
				else if(chance < 0.7)
					return FlyingObjTypeEnums.Enemy02;
				else
					return FlyingObjTypeEnums.Enemy03;
			}
			else if(difficulty < 6) {
				if(chance < 0.3)
					return FlyingObjTypeEnums.Enemy01;
				else if(chance < 0.66)
					return FlyingObjTypeEnums.Enemy02;
				else
					return FlyingObjTypeEnums.Enemy03;
			}
			else {
				if(chance < 0.3)
					return FlyingObjTypeEnums.Enemy01;
				else if(chance < 0.6)
					return FlyingObjTypeEnums.Enemy02;
				else
					return FlyingObjTypeEnums.Enemy03;				
			}
			
			
		}
		
		private function spawnRandomMonster():void {
			var doom:Number = Math.random();
			
			if(difficulty < 1) {				
				m_nextSpawn = 3 + Math.random() * 3;
			}
			else if(difficulty < 2) {
				m_nextSpawn = 2 + Math.random() * 3;
			}
			else if(difficulty < 4) {
				if(doom > 0.6)
					dispatchEvent(new SpawnMonsterEvent(getEnemyTypeByChance(Math.random())));
					
				m_nextSpawn = 2 + Math.random() * 2;
			}
			else if(difficulty < 6) {
				if(doom > 0.6)
					dispatchEvent(new SpawnMonsterEvent(getEnemyTypeByChance(Math.random())));
				
				m_nextSpawn = 2 + Math.random() * 2;
			}
			
			else {
				if(doom > 0.95) {
					dispatchEvent(new SpawnMonsterEvent(FlyingObjTypeEnums.Enemy03));
					dispatchEvent(new SpawnMonsterEvent(FlyingObjTypeEnums.Enemy03));
				}
				else if(doom > 0.6) {
					dispatchEvent(new SpawnMonsterEvent(getEnemyTypeByChance(Math.random())));
				}
				else if(doom > 0.3) {
					dispatchEvent(new SpawnMonsterEvent(FlyingObjTypeEnums.Enemy01));
					dispatchEvent(new SpawnMonsterEvent(FlyingObjTypeEnums.Enemy01));
					dispatchEvent(new SpawnMonsterEvent(FlyingObjTypeEnums.Enemy01));
					dispatchEvent(new SpawnMonsterEvent(FlyingObjTypeEnums.Enemy01));
				}
				
				m_nextSpawn = 2 + Math.random() * 2;
			}
			
			dispatchEvent(new SpawnMonsterEvent(getEnemyTypeByChance(Math.random())));
			
			//dispatchEvent(new SpawnMonsterEvent(FlyingObjTypeEnums.Enemy01 + Math.random()*2))
			//m_nextSpawn = 2 + Math.random() * 2;
			 
		}
		
		
		private function onSpawnMonster(e:SpawnMonsterEvent):void {
			var monster:Enemy = null;
			
			switch(e.monsterType) {
				case(FlyingObjTypeEnums.Enemy01):
					if(difficulty < 2)
						monster = new DummyEnemy(0);
					else
						monster = new DummyEnemy(1);
					break;
				case(FlyingObjTypeEnums.Enemy02):
					if(difficulty < 1)
						monster = new SpinningEnemy(0);
					else
						monster = new SpinningEnemy(1);
					break;
				case(FlyingObjTypeEnums.Enemy03):
					monster = new SpinningEnemy(2, 2);
					break;
			}
						
			monster.Position.x = Math.random() * ( m_host.XLength - 40 ) + 20;
			monster.Position.y = Math.random() * ( m_host.YLength - 40 ) + 20;
			monster.Position.z = m_host.ZLength - 20;
			m_host.AddObject(monster);
		}
	}
}
package  GameLogic
{
	import flash.events.Event;
	import GameLogic.FlyingObject.Enemy;
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class PlayerStatus 
	{
		static private var m_instance:PlayerStatus = null;
		static private var m_safeFlag:Boolean = false;

		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	return the singleton of this class
		 */
		static public function get Singleton():PlayerStatus
		{
			if ( m_instance == null )
			{
				m_safeFlag = true;
				m_instance = new PlayerStatus();
				m_safeFlag = false;
			}
			
			return m_instance;
		}
		
		/**
		 * @desc	constructor
		 */
		public function PlayerStatus() 
		{
			if ( m_safeFlag == false )
			{
				throw new Error( "[Error]: this is a singleton, can not be new directly" );
			}
		}
		
		public var _score:int = 0;
		
		public function onEnemyDestroyed( e:Event ):void
		{
			_score += ( e.target as Enemy ).ScoreValue;
		}
	}
}

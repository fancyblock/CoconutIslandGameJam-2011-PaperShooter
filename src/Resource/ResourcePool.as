package Resource
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class ResourcePool 
	{
		//-------------------------------- static member ---------------------------------
		
		static private var m_instance:ResourcePool = null;
		static private var m_safeFlag:Boolean = false;
		
		//-------------------------------- private member --------------------------------
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	return the singleton of this class
		 */
		static public function get Singleton():ResourcePool
		{
			if ( m_instance == null )
			{
				m_safeFlag = true;
				m_instance = new ResourcePool();
				m_safeFlag = false;
			}
			
			return m_instance;
		}
		
		/**
		 * @desc	constructor
		 */
		public function ResourcePool() 
		{
			if ( m_safeFlag == false )
			{
				throw new Error( "[Error]: this is a singleton, can not be new directly" );
			}
		}
		
		/**
		 * @desc	return the mc of spaceship v
		 * @return
		 */
		public function GetSpaceShipV():MovieClip
		{
			return ( new mcPlayerShipVRes );
		}
		
		/**
		 * @desc	return the mc of spaceship h
		 * @return
		 */
		public function GetSpaceShipH():MovieClip
		{
			return ( new mcPlayerShipHRes );
		}
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}
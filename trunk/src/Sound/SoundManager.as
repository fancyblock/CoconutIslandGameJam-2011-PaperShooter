package Sound
{
	import com.pblabs.engine.PBE;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.4.24
	 */
	public class SoundManager 
	{
		//------------------------------ static member -------------------------------------
		
		static private var m_instance:SoundManager = null;
		static private var m_safeFlag:Boolean = false;
		
		//------------------------------ private member ------------------------------------
		
		private var m_soundLibs:Array = null;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function SoundManager() 
		{
			if ( m_safeFlag == false )
			{
				throw new Error( "[Error] this is a singleton, can not be new directly !" );
			}
			else
			{
				initial();
			}
		}
		
		/**
		 * @desc	return the singleton of this class
		 */
		public static function get Singleton():SoundManager
		{
			if ( m_instance == null )
			{
				m_safeFlag = true;
				m_instance = new SoundManager();
				m_safeFlag = false;
			}
		
			return m_instance;
		}
		
		/**
		 * @desc	play the background music
		 * @param	soundId
		 */
		public function PlayBGM( soundId:String ):void
		{
			PBE.soundManager.play( m_soundLibs[soundId], soundId );
		}
		
		/**
		 * @desc	play the sound effect
		 * @param	soundID
		 */
		public function PlaySE( soundId:String ):void
		{
			PBE.soundManager.play( m_soundLibs[soundId], soundId );
		}
		
		/**
		 * @desc	stop all the sound
		 */
		public function StopSound( soundId:String ):void
		{
			PBE.soundManager.stopCategorySounds( soundId );
		}
		
		//------------------------------ private function ----------------------------------
		
		//initial the singleton
		private function initial():void
		{
			m_soundLibs = new Array();
			
			m_soundLibs[SoundEnums.BGM_Title] = new bgm_title;
			m_soundLibs[SoundEnums.BGM_Gaming] = new bgm_gaming;
			m_soundLibs[SoundEnums.BGM_End] = new bgm_end;
			
			m_soundLibs[SoundEnums.SE_Btn] = new se_btn;
			m_soundLibs[SoundEnums.SE_Fire] = new se_fire;
			m_soundLibs[SoundEnums.SE_Hitted] = new se_hitted;
		}
		
		//------------------------------- event callback -----------------------------------
		
	}

}
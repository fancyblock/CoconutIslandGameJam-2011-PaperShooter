package Screen
{
	import flash.text.TextField;
	import Screen.BasicScreen;
	import flash.display.MovieClip;
	import Sound.SoundEnums;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class EndScreen extends BasicScreen 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_scoreBox:TextField = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	construcor ot this class
		 */
		public function EndScreen( ui:Class )
		{
			super();
			
			this.setUI( ( new ui ) as MovieClip );
			
			//get the ui elements
			m_scoreBox = this.Canvas.getChildByName( "txtScore" ) as TextField;
			
			//set the bgm
			this.setBGM( SoundEnums.BGM_End );
			
			m_scoreBox.text = GlobalWork.Mark.toString();
		}
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}
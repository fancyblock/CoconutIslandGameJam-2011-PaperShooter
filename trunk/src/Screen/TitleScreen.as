package Screen
{	
	import com.pblabs.engine.PBE;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import Sound.SoundEnums;

	public class TitleScreen extends BasicScreen
	{
		//------------------------------------------ private member ------------------------------------------
		
		private var m_btnStart:SimpleButton = null;
		
		//------------------------------------------- public function -------------------------------------------

		/**
		 * @desc	constructor of TitleScreen
		 */
		public function TitleScreen( ui:Class )
		{
			super();
			
			this.setUI( ( new ui ) as MovieClip );
			
			//get the ui elements
			m_btnStart = this.Canvas.getChildByName( "btnStart" ) as SimpleButton;
			m_btnStart.scaleX = m_btnStart.scaleY = 3.0;
			
			//attach event listener
			m_btnStart.addEventListener( MouseEvent.CLICK, _onStart );
			
			//set the bgm
			this.setBGM( SoundEnums.BGM_Title );
			
			//set the button se
			this.setButtonSE( m_btnStart );
		}
		
		//------------------------------------------ private function -------------------------------------------
		
		//------------------------------------------- event callback -------------------------------------------
		
		//callback when click [start] button
		private function _onStart( evt:MouseEvent ):void
		{
			PBE.screenManager.pop();
			PBE.screenManager.push( ScreenEnums.Game_Screen );
		}

	}
}
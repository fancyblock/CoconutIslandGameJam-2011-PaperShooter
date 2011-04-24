package
{
	
	import com.pblabs.engine.PBE;
	import flash.display.Sprite;
	import flash.system.fscommand;
	import Screen.EndScreen;
	import Screen.GameScreen;
	import Screen.ScreenEnums;
	import Screen.TitleScreen;
	
	/**
	 * @desc	
	 * @author	Hejiabin
	 * @date	2011.4.23
	 */
	[SWF(width="802", height="600", backgroundColor="0x000000", frameRate="30")]
	public class PaperShooter extends Sprite
	{
		//------------------------------ static member -------------------------------------
		
		//------------------------------ private member ------------------------------------
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor of PaperShooter
		 */
		public function PaperShooter()
		{
			trace( "[Game Start]" );
			
			//startup the engine
			PBE.startup( this );
			
			//flash player setting
			fscommand( "allowscale", "false" );
			
			//regisit the screens
			PBE.screenManager.registerScreen( ScreenEnums.Title_Screen, new TitleScreen( TitleScreenRes ) );
			PBE.screenManager.registerScreen( ScreenEnums.Game_Screen, new GameScreen( GameScreenRes ) );
			PBE.screenManager.registerScreen( ScreenEnums.End_Screen, new EndScreen( EndScreenRes ) );
			
			PBE.screenManager.push( ScreenEnums.Title_Screen );
			
		}
		
		//------------------------------ private function ----------------------------------
		
		//------------------------------- event callback -----------------------------------
		
	}
}
package
{
	import com.pblabs.engine.PBE;
	import flash.display.Sprite;
	import flash.system.fscommand;
	import Screen.GameScreen;
	import Screen.TitleScreen;
	import Screen.ScreenEnums;
	import Screen.EndScreen;
	
	/**
	 * @desc	
	 * @author	Hejiabin
	 * @date	2011.4.23
	 */
	[SWF(width="800", height="600", backgroundColor="0x000000")]
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
			PBE.screenManager.registerScreen( ScreenEnums.Game_Screen, new GameScreen( frameRes ) );
	//		PBE.screenManager.registerScreen( ScreenEnums.End_Screen, new EndScreen( xxx ) );
			
			PBE.screenManager.push( ScreenEnums.Title_Screen );
		}
		
		//------------------------------ private function ----------------------------------
		
		//------------------------------- event callback -----------------------------------
		
	}
}
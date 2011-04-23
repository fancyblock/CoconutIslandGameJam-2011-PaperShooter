package
{
	import Screen.TitleScreen;
	
	import com.pblabs.engine.PBE;
	
	import flash.display.Sprite;
	import flash.system.fscommand;
	
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
			//startup the engine
			PBE.startup( this );
			
			//flash player setting
			fscommand( "allowscale", "false" );
			
			//regisit the screens
			PBE.screenManager.registerScreen( "TitleScreen", new TitleScreen( TitleScreen ) );

			PBE.screenManager.push( "TitleScreen" );
		}
		
		//------------------------------ private function ----------------------------------
		
		//------------------------------- event callback -----------------------------------
		
	}
}
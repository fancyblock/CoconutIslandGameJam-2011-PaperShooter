package
{
	import flash.display.Sprite;
	import com.pblabs.engine.PBE;
	import flash.system.fscommand;
	
	/**
	 * @desc	
	 * @author	Hejiabin
	 * @date	2011.4.23
	 */
	[SWF(width="1024", height="768", backgroundColor="0x000000")]
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
		}
		
		//------------------------------ private function ----------------------------------
		
		//------------------------------- event callback -----------------------------------
		
	}
}
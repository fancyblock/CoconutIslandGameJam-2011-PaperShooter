package Screen
{	
	import flash.display.MovieClip;

	public class TitleScreen extends BasicScreen
	{
		//------------------------------------------- static member -------------------------------------------
		
		//------------------------------------------- public member ------------------------------------------
		
		//------------------------------------------ private member ------------------------------------------
		
		//------------------------------------------- public function -------------------------------------------

		/**
		 * @desc	constructor of TitleScreen
		 */
		public function TitleScreen( ui:Class )
		{
			super();
			
			this.setUI( ( new ui ) as MovieClip );
		}
		
		//------------------------------------------ private function -------------------------------------------
		
		//------------------------------------------- event callback -------------------------------------------

	}
}
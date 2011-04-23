package Screen
{
	import flash.display.MovieClip;
	import Screen.BasicScreen;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class GameScreen extends BasicScreen 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor of this class
		 */
		public function GameScreen( ui:Class )
		{
			super();
			
			this.setUI( ( new ui ) as MovieClip );
			
			//[unfinished]
		}
		
		/**
		 * @desc	callback when show
		 */
		override public function onShow():void
		{
			
		}
		
		/**
		 * @desc	callback when hide
		 */
		override public function onHide():void
		{
			
		}
		
		/**
		 * @desc	frame function
		 */
		override public function onFrame(delta:Number):void
		{
			
		}
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}
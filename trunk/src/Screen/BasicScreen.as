package Screen
{
	import com.pblabs.screens.BaseScreen;
	import flash.display.MovieClip;
	
	/**
	 * @author	Hejiabin
	 * @date	2011.4.23
	 */
	public class BasicScreen extends BaseScreen
	{
		//------------------------------------------- static member -------------------------------------------
		
		//------------------------------------------- public member ------------------------------------------
		
		//------------------------------------------ private member ------------------------------------------
		
		private var m_ui:MovieClip = null;
		
		//------------------------------------------- public function -------------------------------------------
		
		/**
		 * @desc	constructor of Screen
		 */
		public function BasicScreen()
		{
			//TODO: implement function
			super();
		}
		
		/**
		 * @desc	return the canvas
		 */
		public function get Canvas():MovieClip
		{
			return m_ui;
		}
		
		/**
		 * @desc	frame function
		 */
		override public function onFrame(delta:Number):void
		{
			
		}
		
		/**
		 * @desc	callback when hide
		 */
		override public function onHide():void
		{
			
		}
		
		/**
		 * @desc	callback when show
		 */
		override public function onShow():void
		{
			
		}
		
		//------------------------------------------ private function -------------------------------------------
		
		//attach a ui to this screen
		protected function setUI( ui:MovieClip ):void
		{
			this.m_ui = ui;
			
			this.addChild( m_ui );
		}
		
		
		//------------------------------------------- event callback -------------------------------------------
		
	}
}
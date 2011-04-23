package Screen
{
	import flash.display.MovieClip;
	import GameLogic.ISpace;
	import Screen.BasicScreen;
	import View.HorizontalView;
	import View.VerticalView;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class GameScreen extends BasicScreen 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_verView:VerticalView = null;
		private var m_horView:HorizontalView = null;
		
		private var m_space:ISpace = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor of this class
		 */
		public function GameScreen( ui:Class )
		{
			super();
			
			this.setUI( ( new ui ) as MovieClip );
			
			//get all the ui elements
			m_verView = new VerticalView( this.Canvas.getChildByName( "mcVerticalView" ) as MovieClip );
			m_horView = new HorizontalView( this.Canvas.getChildByName( "mcHorizontalView" ) as MovieClip );
		}
		
		/**
		 * @desc	callback when show
		 */
		override public function onShow():void
		{
			//m_space = 
			
			//attach space to the views
			m_verView.AttachSpace( m_space );
			m_horView.AttachSpace( m_space );
			
		}
		
		/**
		 * @desc	frame function
		 */
		override public function onFrame(delta:Number):void
		{
			//TODO: implement function
		}
		
		/**
		 * @desc	callback when hide
		 */
		override public function onHide():void
		{
			//TODO: implement function
		}
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}
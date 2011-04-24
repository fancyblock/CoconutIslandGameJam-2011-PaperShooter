package View
{
	import GameLogic.ISpace;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class BaseViewport 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		protected var m_space:ISpace = null;
		
		protected var m_mcCanva:MovieClip = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function BaseViewport() 
		{
		}
		
		/**
		 * @desc	update function
		 */
		public function Render():void
		{
			if( GlobalWork.RenderMode == GlobalWork.RenderMode_2D )
			{
				( m_mcCanva.getChildByName( "mcFrame" ) as MovieClip ).gotoAndStop( 2 );
			}
			else
			{
				( m_mcCanva.getChildByName( "mcFrame" ) as MovieClip ).gotoAndStop( 1 );
			}
		}
		
		/**
		 * @desc	attach the space to this view
		 * @param	space
		 */
		public function AttachSpace( space:ISpace ):void
		{
			m_space = space;
		}
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}
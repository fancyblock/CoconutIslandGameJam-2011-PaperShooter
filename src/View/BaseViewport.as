package View
{
	import GameLogic.ISpace;
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class BaseViewport 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_space:ISpace = null;
		
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
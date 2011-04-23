package View
{
	import GameLogic.FlyingObject.IFlyingObject;
	
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class HorizontalView extends BaseViewport
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_mcCanva:MovieClip = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 * @param	mc
		 */
		public function HorizontalView( mc:MovieClip )
		{
			super();
			
			m_mcCanva = mc;
		}
		
		/**
		 * @desc	update function
		 */
		override public function Render():void
		{
			var objList:Array = this.m_space.ObjectList;
			
			//loop for render every object
			for each( var obj:IFlyingObject in objList )
			{
				if ( obj.Alive )
				{
					if ( m_mcCanva != obj.HorizontalMC.parent )
					{
						m_mcCanva.addChild( obj.HorizontalMC );
					}
					
					updatePosition( obj );
				}
				else
				{
					//clean the object
					if ( m_mcCanva == obj.HorizontalMC.parent )
					{
						m_mcCanva.removeChild( obj.HorizontalMC );
					}
				}
			}
		}
		
		//-------------------------------- private function --------------------------------
		
		private function updatePosition( obj:IFlyingObject ):void
		{
			obj.HorizontalMC.x = obj.Position.z;
			obj.HorizontalMC.y = m_space.YLength - obj.Position.y;
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}
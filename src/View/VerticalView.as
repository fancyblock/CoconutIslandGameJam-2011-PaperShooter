package View
{
	import flash.display.MovieClip;
	import GameLogic.FlyingObject.FlyingObjTypeEnums;
	import GameLogic.FlyingObject.IFlyingObject;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011.04.23
	 */
	public class VerticalView extends BaseViewport 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_mcCanva:MovieClip = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 * @param	mc
		 */
		public function VerticalView( mc:MovieClip )
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
					if ( m_mcCanva != obj.VerticalMC.parent )
					{
						m_mcCanva.addChild( obj.VerticalMC );
					}
					
					updatePosition( obj );
				}
				else
				{
					//clean the object
					if ( m_mcCanva == obj.VerticalMC.parent )
					{
						m_mcCanva.removeChild( obj.VerticalMC );
					}
				}
			}
		}
		
		//-------------------------------- private function --------------------------------
		
		private function updatePosition( obj:IFlyingObject ):void
		{
			obj.VerticalMC.x = obj.Position.x;
			obj.VerticalMC.y = m_space.ZLength - obj.Position.z;
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}
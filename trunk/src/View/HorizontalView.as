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
			super.Render();
			
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
			if( GlobalWork.RenderMode == GlobalWork.RenderMode_2D )
			{
				obj.HorizontalMC.x = obj.Position.z;
				obj.HorizontalMC.y = m_space.YLength - obj.Position.y;
				obj.HorizontalMC.scaleX = 1.0;
				obj.HorizontalMC.scaleY = 1.0;
				obj.HorizontalMC.alpha = 1.0;
			}
			else if( GlobalWork.RenderMode == GlobalWork.RenderMode_3D )
			{
				//perspective projection calculate
				
				var x:Number = obj.Position.z;
				var y:Number = obj.Position.y;
				var z:Number = obj.Position.x;
				
				//(30 margin)	- parameter about perspective
				var n:Number = 950;
				var k:Number = 950;
				var miniSize:Number = 0.76;
				
				x = x - 250;
				y = y - 150;
				z = 300 - z;
				
				var newX:Number = x / ( n + z ) * k;
				var newY:Number = y / ( n + z ) * k;
				
				//set the 2d position
				obj.HorizontalMC.x = newX + 250;
				obj.HorizontalMC.y = m_space.YLength - ( newY + 150 );
				
				//set the scale
				var scaleVal:Number = z * ( ( miniSize - 1 ) / 300 ) + 1;
				obj.HorizontalMC.scaleX = 1.5 - ( 1 - scaleVal ) * 2;
				obj.HorizontalMC.scaleY = 1.5 - ( 1 - scaleVal ) * 2;
				
				//set the alpha
				obj.HorizontalMC.alpha = 1 - ( 1 - scaleVal ) * 2;
			}
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}
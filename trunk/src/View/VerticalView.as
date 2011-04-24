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
			super.Render();
			
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
			if( GlobalWork.RenderMode == GlobalWork.RenderMode_2D )
			{
				obj.VerticalMC.x = obj.Position.x;
				obj.VerticalMC.y = m_space.ZLength - obj.Position.z;
				obj.VerticalMC.scaleX = 1.0;
				obj.VerticalMC.scaleY = 1.0;
				obj.VerticalMC.alpha = 1.0;
			}
			else if( GlobalWork.RenderMode == GlobalWork.RenderMode_3D )
			{
				//perspective projection calculate
				
				var x:Number = obj.Position.x;
				var y:Number = obj.Position.z;
				var z:Number = obj.Position.y;
				
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
				obj.VerticalMC.x = newX + 250;
				obj.VerticalMC.y = m_space.ZLength - ( newY + 150 );
				
				//set the scale
				var scaleVal:Number = z * ( ( miniSize - 1 ) / 300 ) + 1;
				obj.VerticalMC.scaleX = 1.5 - ( 1 - scaleVal ) * 2;
				obj.VerticalMC.scaleY = 1.5 - ( 1 - scaleVal ) * 2;
				
				//set the alpha
				obj.VerticalMC.alpha = 1 - ( 1 - scaleVal ) * 2;
			}
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}
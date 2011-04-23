package GameLogic.FlyingObject
{
	import flash.display.MovieClip;
	import Math.Collision.Shape3D;

	import GameLogic.ISpace;
	
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface IFlyingObject 
	{
		function Update( delta:Number ):void;
		
		function get Type():int;
		
		function set Host( host:ISpace ):void;
		
		function get Position():Vector3D;
		
		function set Position( val:Vector3D ):void;
		
		function get Alive():Boolean;
		
		function set Alibe( val:Boolean ):void;
		
		function get VerticalMC():MovieClip;
		
		function get HorizontalMC():MovieClip;
		
		function get Shape():Shape3D;
		
		function dispatchEvent(e:Event):Boolean;
	}
	
}
package GameLogic.FlyingObject
{
	import Math.Collision.Shape3D;
	
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
		
		function get Position():Vector3D;
		
		function set Position( val:Vector3D ):void;
		
		function get Alive():Boolean;
		
//		function get AABB():
		
		function get Shape():Shape3D;
		
		function dispatchEvent(e:Event):Boolean;
	}
	
}
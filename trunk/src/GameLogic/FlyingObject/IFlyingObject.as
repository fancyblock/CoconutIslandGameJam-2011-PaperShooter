package GameLogic.FlyingObject
{
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
		
//		function get AABB():
	}
	
}
package GameLogic
{
	import GameLogic.FlyingObject.IFlyingObject;
	import Math.Collision.AABB3D;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface ISpace 
	{
		function get XLength():Number;
		
		function get YLength():Number;
		
		function get ZLength():Number;
		
		function get ObjectList():Array;
		
		function Update( delta:Number ):void
		
		function AddObject( obj:IFlyingObject ):void;
		
		function get AABB():AABB3D;
	}
	
}
package Math.Collision
{
	import flash.geom.Vector3D;

	public class Shape3D
	{
		public var position:Vector3D;
		
		public function Shape3D()
		{
			position = new Vector3D();
		}
		
		public function intersects(shape:Shape3D):Boolean {
			if(this is AABB3D) {
				if(shape is AABB3D)
					return Collision.intersects_AABB_AABB(AABB3D(this), AABB3D(shape));
				else			
					return Collision.intersects_AABB_Sphere(AABB3D(this), Sphere3D(shape));
			}
			else {
				if(shape is AABB3D)
					return Collision.intersects_AABB_Sphere(AABB3D(shape), Sphere3D(this));
				else
					return Collision.intersects_Sphere_Sphere(Sphere3D(this), Sphere3D(shape));
			}
				
		}
		

	}
}
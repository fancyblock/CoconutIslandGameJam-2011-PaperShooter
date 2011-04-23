package Math.Collision
{
	import flash.geom.Vector3D;

	public class Collision
	{
		public function Collision()
		{
		}
		
		public static function intersects_AABB_Sphere(aabb:AABB3D, sphere:Sphere3D):Boolean {
			var spherePos:Vector3D = sphere.position;
			var sphereRadius:Number = sphere.radius; 
			
			var closestPoint:Vector3D = aabb.closestPointTo(spherePos);
			
			return closestPoint.subtract(spherePos).lengthSquared < sphereRadius*sphereRadius;
		}
		
		public static function intersects_AABB_AABB(aabb1:AABB3D, aabb2:AABB3D):Boolean {
			var p1:Vector3D = aabb1.position;
			var p2:Vector3D = aabb2.position;
			
			// check for overlap
			if(aabb1.min.x + p1.x > aabb2.max.x + p2.x) return false;
			if(aabb1.max.x + p1.x < aabb2.min.x + p2.x) return false;
			if(aabb1.min.y + p1.y > aabb2.max.y + p2.y) return false;
			if(aabb1.max.y + p1.y < aabb2.min.y + p2.y) return false;
			if(aabb1.min.z + p1.z > aabb2.max.z + p2.z) return false;
			if(aabb1.max.z + p1.z < aabb2.min.z + p2.z) return false;
			
			return true;
		}
		
		public static function intersects_Sphere_Sphere(sphere1:Sphere3D, sphere2:Sphere3D):Boolean {
			var v1:Vector3D = sphere1.position;
			var v2:Vector3D = sphere2.position;
			
			return v2.subtract(v1).length < (sphere1.radius + sphere2.radius);
		}
		
	}
}
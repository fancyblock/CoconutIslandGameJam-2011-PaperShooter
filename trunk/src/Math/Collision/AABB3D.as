package Math.Collision
{
	import flash.geom.Vector3D;

	/**
	 * ...
	 * @author	Fred
	 * @date	2011.04.23
	 */	
	public class AABB3D extends Shape3D
	{
		public var min:Vector3D;
		public var max:Vector3D;
		
		public function AABB3D()
		{
			super();
			min = new Vector3D();
			max = new Vector3D();
		}
		
		public function closestPointTo(p:Vector3D):Vector3D {
			var r:Vector3D = new Vector3D();
			
			// translate the point back by the AABB's position, and restore it at the end
			p.x -= position.x;
			p.y -= position.y;
			p.z -= position.z;
			
			if(p.x < min.x)
				r.x = min.x;
			else if(p.x > max.x)
				r.x = max.x;
			else
				r.x = p.x;
			
			if(p.y < min.y)
				r.y = min.y;
			else if(p.y > max.y)
				r.y = max.y;
			else
				r.y = p.y;
			
			if(p.z < min.z)
				r.z = min.z;
			else if(p.z > max.z)
				r.z = max.z;
			else
				r.z = p.z;
			
			p.x += position.x;
			p.y += position.y;
			p.z += position.z;
						
			r.x += position.x;
			r.y += position.y;
			r.z += position.z;

			
			return r;
		}
	}
}
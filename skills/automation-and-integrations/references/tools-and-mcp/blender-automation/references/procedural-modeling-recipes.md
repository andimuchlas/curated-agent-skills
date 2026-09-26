# Blender Procedural Modeling Recipes & Code Patterns

Ready-to-use Python scripts (`bpy` and `bmesh`) for agents to execute via the Blender MCP server.

---

## 1. Low-Poly Landscape & Nature Generator

```python
import bpy
import bmesh
import random
import math
from mathutils import Vector

def clean_scene():
    bpy.ops.object.select_all(action='SELECT')
    bpy.ops.object.delete(use_global=False)

def create_lowpoly_terrain(grid_size=10, subdivisions=20, max_height=2.5):
    mesh = bpy.data.meshes.new("Terrain_Mesh")
    obj = bpy.data.objects.new("Terrain", mesh)
    bpy.context.scene.collection.objects.link(obj)
    
    bm = bmesh.new()
    bmesh.ops.create_grid(bm, x_segments=subdivisions, y_segments=subdivisions, size=grid_size)
    
    # Displace vertices procedurally
    for v in bm.verts:
        dist_from_center = (v.co.x**2 + v.co.y**2)**0.5
        noise = math.sin(v.co.x * 0.8) * math.cos(v.co.y * 0.8)
        random_jitter = random.uniform(-0.15, 0.15)
        
        # Island falloff
        falloff = max(0.0, 1.0 - (dist_from_center / (grid_size * 0.48)))
        v.co.z = (noise * max_height + random_jitter) * falloff
        
    bm.to_mesh(mesh)
    bm.free()
    
    # Flat shading for low-poly aesthetic
    for poly in mesh.polygons:
        poly.use_smooth = False
    mesh.update()
    return obj

def create_lowpoly_tree(location=(0,0,0), height_scale=1.0):
    col = bpy.data.collections.get("Foliage") or bpy.data.collections.new("Foliage")
    if col.name not in bpy.context.scene.collection.children:
        bpy.context.scene.collection.children.link(col)
        
    # Trunk
    trunk_mesh = bpy.data.meshes.new("Trunk_Mesh")
    trunk_obj = bpy.data.objects.new("Trunk", trunk_mesh)
    col.objects.link(trunk_obj)
    
    bm_t = bmesh.new()
    bmesh.ops.create_cone(bm_t, cap_ends=True, cap_tris=False, segments=6, radius1=0.25, radius2=0.15, depth=1.5 * height_scale)
    bm_t.to_mesh(trunk_mesh)
    bm_t.free()
    trunk_obj.location = Vector(location) + Vector((0, 0, 0.75 * height_scale))
    
    # Foliage Cones
    for i in range(3):
        foil_mesh = bpy.data.meshes.new(f"Foliage_{i}_Mesh")
        foil_obj = bpy.data.objects.new(f"Foliage_{i}", foil_mesh)
        col.objects.link(foil_obj)
        
        bm_f = bmesh.new()
        r1 = (0.9 - i * 0.2) * height_scale
        r2 = 0.0
        d = 1.1 * height_scale
        bmesh.ops.create_cone(bm_f, cap_ends=True, cap_tris=False, segments=6, radius1=r1, radius2=r2, depth=d)
        bm_f.to_mesh(foil_mesh)
        bm_f.free()
        
        foil_obj.location = Vector(location) + Vector((0, 0, (1.2 + i * 0.6) * height_scale))
```

---

## 2. Modern Product Studio Pedestal & Stage

```python
import bpy
import bmesh
import math

def create_product_stage(radius=3.0, height=0.6, bevel_amount=0.04):
    mesh = bpy.data.meshes.new("Pedestal_Mesh")
    obj = bpy.data.objects.new("Studio_Pedestal", mesh)
    bpy.context.scene.collection.objects.link(obj)
    
    bm = bmesh.new()
    bmesh.ops.create_cone(bm, cap_ends=True, cap_tris=False, segments=64, radius1=radius, radius2=radius, depth=height)
    bm.to_mesh(mesh)
    bm.free()
    
    obj.location = (0, 0, height / 2.0)
    
    # Smooth with Bevel modifier
    bevel = obj.modifiers.new("Pedestal_Bevel", "BEVEL")
    bevel.width = bevel_amount
    bevel.segments = 4
    bevel.limit_method = 'ANGLE'
    
    # Backdrop / Curved Cyclorama
    backdrop_mesh = bpy.data.meshes.new("Backdrop_Mesh")
    backdrop_obj = bpy.data.objects.new("Backdrop", backdrop_mesh)
    bpy.context.scene.collection.objects.link(backdrop_obj)
    
    bm_b = bmesh.new()
    # Floor to wall curved plane
    v1 = bm_b.verts.new((-8, -6, 0))
    v2 = bm_b.verts.new((8, -6, 0))
    v3 = bm_b.verts.new((8, 4, 0))
    v4 = bm_b.verts.new((-8, 4, 0))
    v5 = bm_b.verts.new((8, 4, 8))
    v6 = bm_b.verts.new((-8, 4, 8))
    
    bm_b.faces.new([v1, v2, v3, v4])
    bm_b.faces.new([v4, v3, v5, v6])
    
    bm_b.to_mesh(backdrop_mesh)
    bm_b.free()
    
    # Bevel modifier on wall junction
    b_bev = backdrop_obj.modifiers.new("Backdrop_Bevel", "BEVEL")
    b_bev.width = 3.0
    b_bev.segments = 16
    
    b_sub = backdrop_obj.modifiers.new("Subsurf", "SUBSURF")
    b_sub.levels = 2
    
    return obj, backdrop_obj
```

---

## 3. Sci-Fi Structural Modular Panel

```python
import bpy
import bmesh
from mathutils import Vector

def create_scifi_panel(width=2.0, height=2.0, depth=0.15):
    mesh = bpy.data.meshes.new("SciFi_Panel_Mesh")
    obj = bpy.data.objects.new("SciFi_Panel", mesh)
    bpy.context.scene.collection.objects.link(obj)
    
    bm = bmesh.new()
    bmesh.ops.create_cube(bm, size=1.0)
    bmesh.ops.scale(bm, vec=Vector((width, height, depth)), verts=bm.verts)
    
    # Inset and extrude center face for panel recess
    for face in bm.faces:
        if face.normal.z > 0.8: # Top face
            inset_res = bmesh.ops.inset_individual(bm, faces=[face], thickness=0.2, depth=-0.05)
            # Inset again for inner core
            for inner_face in inset_res['faces']:
                bmesh.ops.inset_individual(bm, faces=[inner_face], thickness=0.1, depth=-0.03)
                
    bm.to_mesh(mesh)
    bm.free()
    
    # Bevel edges
    bevel = obj.modifiers.new("Panel_Bevel", "BEVEL")
    bevel.width = 0.015
    bevel.segments = 3
    bevel.limit_method = 'ANGLE'
    
    return obj
```

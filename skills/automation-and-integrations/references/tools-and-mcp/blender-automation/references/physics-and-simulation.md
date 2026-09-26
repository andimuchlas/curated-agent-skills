# Blender Physics & Dynamic Simulation Recipes

Automated physics setup for Rigid Bodies, Cloth, and Animation Baking in Blender via Python.

---

## 1. Rigid Body Dynamics (Drop Test / Domino / Physics Stacking)

Configures active falling objects colliding against a passive ground plane.

```python
import bpy

def setup_rigid_body_world():
    """Ensures scene has an active Rigid Body World."""
    if not bpy.context.scene.rigidbody_world:
        bpy.ops.rigidbody.world_add()
    bpy.context.scene.rigidbody_world.substeps_per_frame = 10
    bpy.context.scene.rigidbody_world.solver_iterations = 20

def make_rigid_body(obj, rb_type='ACTIVE', mass=1.0, shape='CONVEX_HULL', friction=0.5, bounciness=0.2):
    """
    Assigns Rigid Body physics to a target object without UI dependencies.
    """
    setup_rigid_body_world()
    
    # Remove existing if present
    if obj.rigid_body:
        bpy.context.view_layer.objects.active = obj
        bpy.ops.rigidbody.object_remove()
        
    bpy.context.view_layer.objects.active = obj
    bpy.ops.rigidbody.object_add()
    
    rb = obj.rigid_body
    rb.type = rb_type # 'ACTIVE' or 'PASSIVE'
    rb.mass = mass
    rb.collision_shape = shape # 'BOX', 'SPHERE', 'MESH', 'CONVEX_HULL'
    rb.friction = friction
    rb.restitution = bounciness # Bounciness
    return rb
```

---

## 2. Procedural Cloth Simulation (Tablecloth / Draped Fabric)

Creates a subdivided sheet that drapes and rests naturally over furniture or geometry.

```python
import bpy
import bmesh

def create_draped_tablecloth(table_obj, cloth_size=2.4, height_offset=0.2, subdivisions=40):
    """
    Generates a cloth mesh above table_obj and runs collision drape simulation.
    """
    # 1. Ensure Table has collision physics
    bpy.context.view_layer.objects.active = table_obj
    if not any(m.type == 'COLLISION' for m in table_obj.modifiers):
        col_mod = table_obj.modifiers.new("Collision", 'COLLISION')
        col_mod.cloth_friction = 5.0
        
    # 2. Create Cloth Plane
    cloth_mesh = bpy.data.meshes.new("Tablecloth_Mesh")
    cloth_obj = bpy.data.objects.new("Tablecloth", cloth_mesh)
    bpy.context.scene.collection.objects.link(cloth_obj)
    
    bm = bmesh.new()
    bmesh.ops.create_grid(bm, x_segments=subdivisions, y_segments=subdivisions, size=cloth_size)
    bm.to_mesh(cloth_mesh)
    bm.free()
    
    # Position slightly above target table
    bounds_z_max = max([(table_obj.matrix_world @ v.co).z for v in table_obj.data.vertices]) if table_obj.type == 'MESH' else table_obj.location.z
    cloth_obj.location = (table_obj.location.x, table_obj.location.y, bounds_z_max + height_offset)
    
    # 3. Add Cloth Modifier
    cloth_mod = cloth_obj.modifiers.new("Cloth", 'CLOTH')
    cloth_settings = cloth_mod.settings
    cloth_settings.quality = 5
    cloth_settings.mass = 0.3
    cloth_settings.tension_stiffness = 15.0
    cloth_settings.bending_stiffness = 0.5
    
    # Collision & Self-Collision
    cloth_mod.collision_settings.use_collision = True
    cloth_mod.collision_settings.use_self_collision = True
    cloth_mod.collision_settings.self_distance_min = 0.005
    
    # Add Subdivision Surface & Solidify for realistic fabric look
    subsurf = cloth_obj.modifiers.new("Subsurf", 'SUBSURF')
    subsurf.levels = 1
    
    solid = cloth_obj.modifiers.new("Solidify", 'SOLIDIFY')
    solid.thickness = 0.003
    
    return cloth_obj
```

---

## 3. Simulation Bake & Keyframe Extraction

Bakes physics frames into static meshes or keyframes for export.

```python
import bpy

def apply_simulated_frame_to_mesh(obj, modifier_name="Cloth", frame_number=40):
    """
    Simulates to target frame and converts the deformed shape into a permanent base mesh.
    """
    bpy.context.scene.frame_set(frame_number)
    bpy.context.view_layer.update()
    
    bpy.context.view_layer.objects.active = obj
    bpy.ops.object.modifier_apply(modifier=modifier_name)
    print(f"[Physics] Baked frame {frame_number} permanently onto {obj.name}")
```

# Blender Procedural Geometry Nodes Recipes

Ready-to-use Python scripts for constructing and applying Geometry Node trees in Blender 4.x / 5.x.

---

## 1. Geometry Node Tree Creation Helper

In Blender 4.0+, `NodeTree` uses `interface.new_socket` instead of `inputs.new` / `outputs.new`. This helper handles both modern and legacy Blender versions.

```python
import bpy

def get_or_create_geo_tree(name="Procedural_GeoTree"):
    # Return existing if found
    tree = bpy.data.node_groups.get(name)
    if tree and tree.type == 'GEOMETRY':
        return tree
        
    tree = bpy.data.node_groups.new(name=name, type='GeometryNodeTree')
    nodes = tree.nodes
    links = tree.links
    nodes.clear()
    
    # Setup Group Input and Output sockets (Blender 4.x+ interface API)
    if hasattr(tree, "interface"):
        tree.interface.new_socket(name="Geometry", in_out='INPUT', socket_type='NodeSocketGeometry')
        tree.interface.new_socket(name="Geometry", in_out='OUTPUT', socket_type='NodeSocketGeometry')
    else:
        tree.inputs.new('NodeSocketGeometry', 'Geometry')
        tree.outputs.new('NodeSocketGeometry', 'Geometry')
        
    node_in = nodes.new('NodeGroupInput')
    node_out = nodes.new('NodeGroupOutput')
    node_in.location = (-300, 0)
    node_out.location = (400, 0)
    
    return tree, node_in, node_out
```

---

## 2. Procedural Object Scattering (Foliage / Rocks on Terrain)

Distributes instances across a target mesh surface with randomized scale and rotation.

```python
import bpy

def apply_scatter_geometry_nodes(target_obj, instance_collection_name="Scatter_Assets", density=25.0):
    """
    Distributes objects from instance_collection onto target_obj surface.
    """
    tree, node_in, node_out = get_or_create_geo_tree(f"{target_obj.name}_ScatterTree")
    nodes = tree.nodes
    links = tree.links
    
    # 1. Distribute Points on Faces
    dist_node = nodes.new('GeometryNodeDistributePointsOnFaces')
    dist_node.location = (-50, 100)
    dist_node.inputs['Density'].default_value = density
    
    # 2. Collection Info (Instance Source)
    col = bpy.data.collections.get(instance_collection_name)
    col_info = nodes.new('GeometryNodeCollectionInfo')
    col_info.location = (-100, -150)
    if col:
        col_info.inputs['Collection'].default_value = col
    col_info.inputs['Separate Children'].default_value = True
    col_info.inputs['Reset Children'].default_value = True
    
    # 3. Instance on Points
    instance_node = nodes.new('GeometryNodeInstanceOnPoints')
    instance_node.location = (150, 0)
    instance_node.inputs['Pick Instance'].default_value = True
    
    # 4. Random Rotation & Scale
    rot_random = nodes.new('FunctionNodeRandomValue')
    rot_random.location = (-100, -300)
    rot_random.data_type = 'FLOAT_VECTOR'
    rot_random.inputs[7].default_value = (0, 0, 0) # Min Euler
    rot_random.inputs[8].default_value = (0, 0, 6.283) # Max Z Euler (360 deg)
    
    scale_random = nodes.new('FunctionNodeRandomValue')
    scale_random.location = (-100, -450)
    scale_random.data_type = 'FLOAT'
    scale_random.inputs[2].default_value = 0.6 # Min scale
    scale_random.inputs[3].default_value = 1.3 # Max scale
    
    # 5. Join Geometry (Keep original terrain + scattered instances)
    join_node = nodes.new('GeometryNodeJoinGeometry')
    join_node.location = (300, 0)
    
    # Link graph
    links.new(node_in.outputs['Geometry'], dist_node.inputs['Mesh'])
    links.new(dist_node.outputs['Points'], instance_node.inputs['Points'])
    links.new(col_info.outputs['Instances'], instance_node.inputs['Instance'])
    links.new(rot_random.outputs['Value'], instance_node.inputs['Rotation'])
    links.new(scale_random.outputs['Value'], instance_node.inputs['Scale'])
    
    links.new(node_in.outputs['Geometry'], join_node.inputs['Geometry'])
    links.new(instance_node.outputs['Instances'], join_node.inputs['Geometry'])
    links.new(join_node.outputs['Geometry'], node_out.inputs['Geometry'])
    
    # Attach modifier to target object
    mod = target_obj.modifiers.new(name="Scatter_GeoNodes", type='NODES')
    mod.node_group = tree
    return mod
```

---

## 3. Procedural Hanging Cable / Wire Generator

Creates sagging hanging cables between two coordinates or along curve points.

```python
import bpy
import mathutils

def create_hanging_cable(start_pos=(0, 0, 2), end_pos=(4, 0, 2), sag=0.8, radius=0.03, resolution=32):
    """
    Creates a procedural sagging cable curve with bevel.
    """
    curve_data = bpy.data.curves.new('Cable_Curve', type='CURVE')
    curve_data.dimensions = '3D'
    curve_data.bevel_depth = radius
    curve_data.bevel_resolution = 4
    curve_data.use_fill_caps = True
    
    spline = curve_data.splines.new('BEZIER')
    spline.bezier_points.add(1) # Already has 1 point by default, total 2
    
    p0 = spline.bezier_points[0]
    p1 = spline.bezier_points[1]
    
    p0.co = start_pos
    p1.co = end_pos
    
    # Calculate sag control handles
    mid_point = (mathutils.Vector(start_pos) + mathutils.Vector(end_pos)) / 2.0
    sag_point = mid_point - mathutils.Vector((0, 0, sag))
    
    p0.handle_right_type = 'ALIGNED'
    p0.handle_right = mathutils.Vector(start_pos) + (sag_point - mathutils.Vector(start_pos)) * 0.5
    p0.handle_left_type = 'AUTO'
    
    p1.handle_left_type = 'ALIGNED'
    p1.handle_left = mathutils.Vector(end_pos) + (sag_point - mathutils.Vector(end_pos)) * 0.5
    p1.handle_right_type = 'AUTO'
    
    curve_obj = bpy.data.objects.new('Hanging_Cable', curve_data)
    bpy.context.scene.collection.objects.link(curve_obj)
    return curve_obj
```

---

## 4. Procedural Modular Grid / Wall Array (Geo Nodes)

Instantiates modular building blocks into parametric grids with random material or mesh variations.

```python
import bpy

def apply_grid_array_nodes(target_obj, count_x=5, count_y=3, spacing_x=2.0, spacing_y=2.0):
    """
    Duplicates target object into a parametric X/Y grid via Geometry Nodes.
    """
    tree, node_in, node_out = get_or_create_geo_tree(f"{target_obj.name}_GridTree")
    nodes = tree.nodes
    links = tree.links
    
    grid_node = nodes.new('GeometryNodeMeshGrid')
    grid_node.location = (-100, 100)
    grid_node.inputs['Vertices X'].default_value = count_x
    grid_node.inputs['Vertices Y'].default_value = count_y
    grid_node.inputs['Size X'].default_value = (count_x - 1) * spacing_x
    grid_node.inputs['Size Y'].default_value = (count_y - 1) * spacing_y
    
    inst_node = nodes.new('GeometryNodeInstanceOnPoints')
    inst_node.location = (150, 0)
    
    links.new(grid_node.outputs['Mesh'], inst_node.inputs['Points'])
    links.new(node_in.outputs['Geometry'], inst_node.inputs['Instance'])
    links.new(inst_node.outputs['Instances'], node_out.inputs['Geometry'])
    
    mod = target_obj.modifiers.new(name="Grid_Array_GeoNodes", type='NODES')
    mod.node_group = tree
    return mod
```

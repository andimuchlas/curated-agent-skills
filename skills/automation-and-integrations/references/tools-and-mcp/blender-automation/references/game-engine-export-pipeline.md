# Game-Ready Asset Preparation & Export Pipeline

Complete workflow for optimizing, UV-unwrapping, checking mesh hygiene, and exporting 3D models to Game Engines (Roblox, Unity, Unreal Engine, WebGL/Three.js) via `bpy` and `bmesh`.

---

## 1. Mesh Hygiene & Sanity Check Protocol

Always clean meshes before export to eliminate non-manifold geometry, duplicate vertices, and inverted normals.

```python
import bpy
import bmesh

def sanitize_and_prepare_mesh(obj):
    """
    Cleans up mesh geometry: removes doubles, fixes face normals,
    dissolves degenerates, and applies transforms.
    """
    if obj.type != 'MESH':
        return False
        
    # 1. Apply All Transforms (Location, Rotation, Scale)
    bpy.context.view_layer.objects.active = obj
    obj.select_set(True)
    bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)
    
    # 2. BMesh Hygiene
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    
    # Remove duplicate/overlapping vertices
    bmesh.ops.remove_doubles(bm, verts=bm.verts, dist=0.0001)
    
    # Dissolve degenerate zero-area faces and edges
    bmesh.ops.dissolve_degenerate(bm, dist=0.0001, edges=bm.edges)
    
    # Recalculate consistent outward face normals
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces)
    
    # Write back to mesh
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()
    
    print(f"[Sanitize] Successfully cleaned {obj.name}: {len(obj.data.vertices)} verts, {len(obj.data.polygons)} polys")
    return True
```

---

## 2. Automated Smart UV Unwrapping

Generates non-overlapping UV coordinates for lightmapping and texturing.

```python
import bpy
import bmesh

def auto_smart_uv_unwrap(obj, angle_limit=66.0, island_margin=0.02):
    """
    Performs Smart UV Project on the object mesh data.
    """
    if obj.type != 'MESH':
        return
        
    bpy.context.view_layer.objects.active = obj
    obj.select_set(True)
    
    # Switch to edit mode for UV operations
    bpy.ops.object.mode_set(mode='EDIT')
    bpy.ops.mesh.select_all(action='SELECT')
    
    # Smart UV projection
    bpy.ops.uv.smart_project(
        angle_limit=angle_limit,
        island_margin=island_margin,
        area_weight=0.0,
        correct_aspect=True,
        scale_to_bounds=False
    )
    
    bpy.ops.object.mode_set(mode='OBJECT')
    print(f"[UV] Auto UV unwrap applied to {obj.name}")
```

---

## 3. LOD (Level of Detail) & Polycount Budgeting

Generates optimized mesh variants using planar or collapse decimation.

```python
import bpy

def generate_lod_variants(source_obj, lod_ratios=[0.5, 0.25]):
    """
    Creates LOD1 and LOD2 variants using the Decimate modifier.
    """
    lod_objects = []
    
    for i, ratio in enumerate(lod_ratios, start=1):
        lod_name = f"{source_obj.name}_LOD{i}"
        lod_mesh = source_obj.data.copy()
        lod_mesh.name = f"{lod_name}_Mesh"
        lod_obj = source_obj.copy()
        lod_obj.data = lod_mesh
        lod_obj.name = lod_name
        
        # Link to active collection
        bpy.context.scene.collection.objects.link(lod_obj)
        
        # Apply decimate modifier
        dec_mod = lod_obj.modifiers.new("Decimate_LOD", "DECIMATE")
        dec_mod.decimate_type = 'COLLAPSE'
        dec_mod.ratio = ratio
        
        # Apply modifier directly to mesh
        bpy.context.view_layer.objects.active = lod_obj
        bpy.ops.object.modifier_apply(modifier="Decimate_LOD")
        
        lod_objects.append(lod_obj)
        print(f"[LOD] Created {lod_name} ({ratio*100:.0f}% polycount): {len(lod_obj.data.polygons)} polys")
        
    return lod_objects
```

---

## 4. Universal glTF / GLB Export (Roblox, Web, Three.js)

glTF 2.0 (.glb) is the standard format for WebGL, Three.js, and modern game imports.

```python
import bpy

def export_gltf(filepath, selected_only=True, embed_textures=True):
    """
    Exports clean glTF/GLB with standard game engine settings (+Y Up).
    """
    bpy.ops.export_scene.gltf(
        filepath=filepath,
        export_format='GLB' if filepath.endswith('.glb') else 'GLTF_SEPARATE',
        use_selection=selected_only,
        export_apply=True, # Apply modifiers
        export_yup=True,
        export_materials='EXPORT',
        export_image_format='AUTO',
        export_cameras=False,
        export_lights=False
    )
    print(f"[Export] glTF successfully exported to: {filepath}")
```

---

## 5. Game FBX Export (Unity, Unreal Engine)

```python
import bpy

def export_game_fbx(filepath, selected_only=True):
    """
    Exports FBX with Z-up, -Y forward (Standard Game Engine orientation).
    """
    bpy.ops.export_scene.fbx(
        filepath=filepath,
        use_selection=selected_only,
        global_scale=1.0,
        apply_unit_scale=True,
        apply_scale_options='FBX_SCALE_ALL',
        axis_forward='-Z',
        axis_up='Y',
        bake_space_transform=True,
        object_types={'MESH', 'ARMATURE'},
        use_mesh_modifiers=True,
        mesh_smooth_type='FACE',
        add_leaf_bones=False
    )
    print(f"[Export] FBX successfully exported to: {filepath}")
```

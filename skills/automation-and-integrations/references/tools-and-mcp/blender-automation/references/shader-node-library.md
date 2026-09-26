# Blender Procedural Shader Node Library

Modular, scriptable shader graphs built for Blender 4.x / 5.x via `bpy.data.materials`.

---

## 1. Procedural Brushed Metal

```python
import bpy

def create_brushed_metal_material(name="Brushed_Metal", color=(0.7, 0.72, 0.75, 1.0), roughness=0.25):
    mat = bpy.data.materials.get(name) or bpy.data.materials.new(name=name)
    mat.use_nodes = True
    nodes = mat.node_tree.nodes
    links = mat.node_tree.links
    nodes.clear()
    
    out = nodes.new("ShaderNodeOutputMaterial")
    bsdf = nodes.new("ShaderNodeBsdfPrincipled")
    tex_coord = nodes.new("ShaderNodeTexCoord")
    mapping = nodes.new("ShaderNodeMapping")
    noise = nodes.new("ShaderNodeTexNoise")
    bump = nodes.new("ShaderNodeBump")
    
    out.location = (400, 0)
    bsdf.location = (150, 0)
    bump.location = (-50, -100)
    noise.location = (-250, -100)
    mapping.location = (-450, -100)
    tex_coord.location = (-650, -100)
    
    # Configure anisotropic stretch for brushed lines
    mapping.inputs['Scale'].default_value[0] = 100.0
    mapping.inputs['Scale'].default_value[1] = 1.0
    mapping.inputs['Scale'].default_value[2] = 1.0
    
    noise.inputs['Scale'].default_value = 20.0
    noise.inputs['Detail'].default_value = 4.0
    
    bump.inputs['Strength'].default_value = 0.08
    bump.inputs['Distance'].default_value = 0.1
    
    # BSDF settings
    bsdf.inputs['Base Color'].default_value = color
    bsdf.inputs['Metallic'].default_value = 1.0
    bsdf.inputs['Roughness'].default_value = roughness
    
    # Wire links
    links.new(tex_coord.outputs['Object'], mapping.inputs['Vector'])
    links.new(mapping.outputs['Vector'], noise.inputs['Vector'])
    links.new(noise.outputs['Fac'], bump.inputs['Height'])
    links.new(bump.outputs['Normal'], bsdf.inputs['Normal'])
    links.new(bsdf.outputs['BSDF'], out.inputs['Surface'])
    
    return mat
```

---

## 2. Emissive Holographic / Cyberpunk Neon

```python
import bpy

def create_neon_material(name="Neon_Cyan", glow_color=(0.0, 0.9, 1.0, 1.0), strength=12.0):
    mat = bpy.data.materials.get(name) or bpy.data.materials.new(name=name)
    mat.use_nodes = True
    nodes = mat.node_tree.nodes
    links = mat.node_tree.links
    nodes.clear()
    
    out = nodes.new("ShaderNodeOutputMaterial")
    bsdf = nodes.new("ShaderNodeBsdfPrincipled")
    
    out.location = (300, 0)
    bsdf.location = (0, 0)
    
    bsdf.inputs['Base Color'].default_value = glow_color
    bsdf.inputs['Emission Color'].default_value = glow_color
    bsdf.inputs['Emission Strength'].default_value = strength
    
    links.new(bsdf.outputs['BSDF'], out.inputs['Surface'])
    return mat
```

---

## 3. Procedural Marble

```python
import bpy

def create_marble_material(name="Procedural_Marble"):
    mat = bpy.data.materials.get(name) or bpy.data.materials.new(name=name)
    mat.use_nodes = True
    nodes = mat.node_tree.nodes
    links = mat.node_tree.links
    nodes.clear()
    
    out = nodes.new("ShaderNodeOutputMaterial")
    bsdf = nodes.new("ShaderNodeBsdfPrincipled")
    ramp = nodes.new("ShaderNodeValToRGB")
    wave = nodes.new("ShaderNodeTexWave")
    noise = nodes.new("ShaderNodeTexNoise")
    mapping = nodes.new("ShaderNodeMapping")
    tex_coord = nodes.new("ShaderNodeTexCoord")
    
    out.location = (500, 0)
    bsdf.location = (250, 0)
    ramp.location = (0, 0)
    wave.location = (-250, 0)
    noise.location = (-450, 0)
    mapping.location = (-650, 0)
    tex_coord.location = (-850, 0)
    
    # Distortion configuration
    noise.inputs['Scale'].default_value = 3.0
    noise.inputs['Detail'].default_value = 8.0
    wave.inputs['Scale'].default_value = 2.0
    wave.inputs['Distortion'].default_value = 12.0
    wave.inputs['Detail'].default_value = 5.0
    
    # Ramp colors: White base with dark veins
    ramp.color_ramp.elements[0].position = 0.4
    ramp.color_ramp.elements[0].color = (0.1, 0.12, 0.15, 1.0) # Vein
    ramp.color_ramp.elements[1].position = 0.65
    ramp.color_ramp.elements[1].color = (0.92, 0.94, 0.96, 1.0) # Marble white
    
    bsdf.inputs['Roughness'].default_value = 0.12 # Polished
    
    links.new(tex_coord.outputs['Object'], mapping.inputs['Vector'])
    links.new(mapping.outputs['Vector'], noise.inputs['Vector'])
    links.new(noise.outputs['Fac'], wave.inputs['Vector'])
    links.new(wave.outputs['Color'], ramp.inputs['Fac'])
    links.new(ramp.outputs['Color'], bsdf.inputs['Base Color'])
    links.new(bsdf.outputs['BSDF'], out.inputs['Surface'])
    
    return mat
```

# Blender MCP Tool Integration Reference

Reference of core and asset tools exposed by the `blender` MCP server.

---

## 1. Core Execution & Scene Tools

### `execute_blender_code`
Executes Python scripts directly in the active Blender runtime via `bpy` and `bmesh`.
- **Arguments**:
  - `code` (*string, required*): The complete Python script to execute.
  - `user_prompt` (*string, optional*): The exact user prompt string (verbatim).
- **Execution Guidelines**:
  - Encapsulate logic in functions.
  - Check object existence before attempting modification or deletion.
  - Return print statements or structured logs to stdout for diagnostic feedback.

### `get_scene_info`
Fetches a high-level summary of the active Blender scene.
- **Arguments**:
  - `user_prompt` (*string, optional*)
- **Returns**: Object count, list of objects with names, types, world locations, and active materials count.

### `get_object_info`
Fetches detailed mesh and transform metadata for a specific object.
- **Arguments**:
  - `object_name` (*string, required*): Exact name of the object in Blender.
  - `user_prompt` (*string, optional*)
- **Returns**: Bounding box dimensions, scale, rotation, vertex count, polygon count, modifier stack names and types.

### `get_viewport_screenshot`
Captures an image of the current 3D viewport.
- **Arguments**:
  - `user_prompt` (*string, optional*)
- **Returns**: Image data URI / preview to verify visual layout, camera framing, and lighting balance.

---

## 2. External Asset Integrations

### Polyhaven (PBR Textures, HDRI, Models)
- `search_polyhaven_assets(query, asset_type)`: Find photorealistic textures (diffuse, normal, roughness) or HDRIs.
- `download_polyhaven_asset(asset_id, asset_type, resolution)`: Downloads and imports into Blender scene.
- `set_texture(object_name, texture_path, mapping_type)`: Applies imported PBR texture sets to active geometry.

### PolyPizza & Sketchfab (Low-Poly & High-Detail Models)
- `search_polypizza_models(query, limit)` / `download_polypizza_model(model_id)`
- `search_sketchfab_models(query, limit)` / `download_sketchfab_model(model_id)`

### Generative 3D (Hyper3D & Hunyuan3D)
- `generate_hyper3d_model_via_text(prompt)` / `generate_hyper3d_model_via_images(image_paths)`
- `generate_hunyuan3d_model(prompt)`
- `poll_hunyuan_job_status(task_id)` / `import_generated_asset_hunyuan(task_id)`

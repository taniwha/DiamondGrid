import bpy
import os
from io_object_mu.export_mu import export_object

blend_filepath = bpy.context.blend_data.filepath
blend_filepath = os.path.dirname(blend_filepath)
print(blend_filepath)
for obj in bpy.data.objects:
    if not obj.parent and obj.children:
        name = obj.name+".mu"
        filepath = os.path.join(blend_filepath, name)
        mu = export_object (obj, filepath)
        #for tex in mu.textures:
        #    image = bpy.data.images[tex.name]
        #    print(tex.name, image.type)
        #    name = tex.name + ".png"
        #    image.packed_files[0].filepath = os.path.join(blend_filepath, name)
        #    #image.file_format = 'PNG'
        #    #print(image.filepath_raw)
        #    image.save()

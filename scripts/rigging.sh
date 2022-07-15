# echo("Renaming sample.obj to sample_ori.obj")
# docker exec rignet mv /data/obj_file/sample.obj /data/obj_file/sample_ori.obj

echo("Make sure file exists called sample_remesh.obj")
docker exec rignet python quick_start.py

# echo("Exporting as fbx file")
# docker exec rignet python maya_save_fbx.py


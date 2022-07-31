# echo("Renaming sample.obj to sample_ori.obj")
docker exec rignet mv /data/obj_file/sample.obj /data/obj_file/sample_ori.obj

echo("start rigging")
sudo docker exec rignet conda run -n rignet_cuda11 python quick_start.py

# echo("Exporting as fbx file")
# docker exec rignet python maya_save_fbx.py

echo("FINISHED")
# Es muss in data/rignet ein sample_remesh.obj enthalten
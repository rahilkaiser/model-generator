docker exec openpose ./build/examples/openpose/openpose.bin \
    --image_dir data/frames \
    --write_json data/keypoints \
    --display 0 \
    --render_pose 0 \ 
    --face \ 
    --logging_level 0 --disable_multi_thread --net-resolution "320x176" --face_net_resolution "20x20"

#Needs at least 12 GB Vram on GPU plus 2 GB of free available space https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/06_maximizing_openpose_speed.md

docker exec human_texture_stitching echo "Step 1: make unwraps..."

docker exec human_texture_stitching mkdir -p ./data/stitching/unwraps

docker exec human_texture_stitching \
    python step1_make_unwraps.py \
    data/stitching/frame_data.pkl data/frames data/segmentations data/stitching/unwraps

echo "Step 2: make priors..."
docker exec human_texture_stitching \
    python step2_segm_vote_gmm.py \
    data/stitching/unwraps data/stitching/segm.png data/stitching/gmm.pkl
#!/usr/bin/env bash

# mkdir -p data/sample/unwraps

echo "Step 3: stitch texture..."
docker exec human_texture_stitching \
    python step3_stitch_texture.py \
    data/stitching/unwraps data/stitching/segm.png data/stitching/gmm.pkl \
    data/texture/sample_texture.jpg
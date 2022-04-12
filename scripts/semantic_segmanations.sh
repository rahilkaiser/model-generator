echo "Step 1 perform semantic segmentation"
docker exec semantic_segmentation python inf_pgn.py -i ./data/frames -o ./data/segmentations
echo "Step 2 refactoring"
docker exec semantic_segmentation \
    find data/segmentations/cihp_parsing_maps -name '*_vis.png' -exec mv -t data/segmentations {} +

docker exec semantic_segmentation \
    rm -r data/segmentations/cihp_edge_maps data/segmentations/cihp_parsing_maps
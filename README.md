# model-generator

### Prerequisites
- Docker
- Docker-compose version 3 : 
- Docker-Nvidia: https://github.com/NVIDIA/nvidia-docker

### Inital setup for CIHP_PGN
1. Download the pretrained model from [google drive](https://drive.google.com/open?id=1Mqpse5Gen4V4403wFEpv3w3JAsWw2uhk)
2. Create a directory inside ./CIHP_PGN called checkpoint
3. Unzip the pretrained model into the checkpoint directory

### Installation
1. Just run `docker-compose up` and wait until all 4 Containers are running

2. Put your Frames into the `data/frames` directory

### Usage
scripts are provided within the scripts directory

1. Prepare Data for Octopus

    1.1 To generate semantic segmentations of your frames run:  
    ```
    bash ./scripts/semantic_segmentations.sh
    ``` 
    The results are inside `data/segmentations` to view
    
    Note: Make sure that directory is empty before running that script, so that there are only the produced results inside

    1.2 To generate keypoints of your frames run:  
    ```
    bash ./scripts/openpose.sh
    ``` 
    The results are inside `data/keypoints` to view
    
    Note: Make sure that directory is empty before running that script, so that there are only the produced results inside

2. Generate Model with Octopus by running:
    ```
    bash ./scripts/octopus.sh
    ``` 
    The Result is an obj file inside `data/obj_file`
3. Generate Texture for the Octopusmodel by running:
    ```
    bash ./scripts/stitching.sh
    ``` 
    The Result is a texture inside `data/texture`

4. To visualize the the generated model use Blender

    4.1 Import the obj model inside `data/obj_file`
    
    4.2 Go to Shading and drag the texture from`data/texture` inside the shader-editor (the bottom panel)
    
    4.3 Inside the Shader-Editor use the Color-Output of the texture for the Basecolor-Input of the Princpal BSDF Component
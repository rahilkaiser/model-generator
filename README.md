# model-generator

## Prerequisites
- Docker
- Docker-compose version 3
- Docker-Nvidia: https://github.com/NVIDIA/nvidia-docker

## Inital setup for CIHP_PGN
1. Download the pretrained model from [google drive](https://drive.google.com/open?id=1Mqpse5Gen4V4403wFEpv3w3JAsWw2uhk)
2. Create a directory inside ./CIHP_PGN called checkpoint 
3. Unzip the pretrained model into the checkpoint directory

(IMPORTANT: The Folderstructure should look like this : `$HOME/CIHP_PGN/checkpoint/CIHP_pgn/`--> the 4 extracted files of the pretrained model should be inside that directory)


## Installation
1. Just run `docker-compose up` and wait until all 4 Containers are running

2. Put your Frames into the `data/frames` directory

## Usage
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

4. Autorig the generated model with RigNet
    4.1 before docker-compose up you will have to run ```xhost +"local:docker@"```
    4.2 after that execute     
    ```
    bash ./scripts/rigging.sh
    ```
    4.3 it will generate 

4. To visualize the the generated model use Blender

    4.1 Import the obj model inside `data/obj_file`
    
    4.2 Go to Shading and drag the texture from `data/texture` inside the shader-editor (the bottom panel)
    
    4.3 Inside the Shader-Editor use the Color-Output of the texture for the Basecolor-Input of the Princpal BSDF Component

## Data-Folder Overview
### data/frames:
* is the input folder for 8 Images around the person 
### data/keypoints:
* contain the detected landmarks for body and face by openpose for each individual frame
### data/segmentations:
* contains the result of segmentations for each frame (basically the output of CIHP_PGN)
### data/obj_file:
* contains the generated obj file by octopus 
### data/rignet:
* contains the remeshed obj file (subdivided between 1k to 5k Vertices) rignet_input 
   * needs to be called `sample_remesh.obj`
   * can be done with MeshLab with the use of quadratic edge collapse
* also contains after running the script the result txt-file of all joints informations
### data/rignet/blender_result:
* contains the generated Result fbx file created by the rignet-blender-plugin
### data/stitching:
* unwraps files for each image generated (this folder can be ignored for the modelgeneration)
### data/texture:
* is the result texture-file generated for the octopus result obj file
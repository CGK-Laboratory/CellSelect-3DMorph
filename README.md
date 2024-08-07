
# ![alt text](https://github.com/CGK-Laboratory/.github/assets/133057205/2d6d4003-04c6-4772-a32e-27d45efd12fa "Logo Title Text 1")
![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/CGK-Laboratory/CellSelect-3DMorph/total?style=for-the-badge&color=0c9310)

<img align="right" src="https://github.com/CGK-Laboratory/CellSelect_3DMorph/assets/133057205/84d05c81-4c03-4797-9398-2243a37b15f6" width="500">
CellSelect-3DMorph is a MATLAB-based script that isolate and analyzes cells morphology from 3D images, by reconstructing the cells from fluorescent pixels. The code allows to obtain different parameters including cell volume (exact number of pixels occupied by the cell), territorial volume (maximum cell extension), ramification index (territorial volume/cell volume), branch length, number of branch and end points, and more. CellSelect uses the 3D Morph developed code but now adds the possibility of rejecting any cell that is not complete in the frame of the image (x, y and z positions) and which the morphology cannot be calculated properly.



Description
===========
## Uses
CellSelect-3DMorph as its predecessor (3DMorph) was specifically developed to isolate and analyze microglia morphology. Literature have indicated that microglia function is closely related to its morphology, for example a non-ramified microglia have been interpreted as increased microglia phagocytic functions while a more ramified microglia have surveying functions in the cellular environment. We use CellSelect-3DMorph to study microglia plasticity XXXX. Furthermore, another interesting application of the code could to study astrocyte morphology. 

## Pipeline
CellSelect-3DMorph imports .tif or .lsm stacks (3 dimensional images) and processes cell morphologies. 
To begin, run the program and select 'Interactive Mode'. Choose your file (must be in Current Folder or add path first), input xy and z scale, and channel information. 
From here, GUI windows are implemented with individual explanations. For a more detailed run down check the [WIKI]() which has a full protocol on using CellSelect. 
Once complete, a Parameters file will be saved to the MATLAB Current Folder. This file can then be used to batch process files with no user input. 

Control and ExCell images are provided as test samples. 

## Matlab dependencies:
- MATLAB >= 2018a
- Image Processing Toolbox
- Statistics and Machine Learning Toolbox
- Parallel Computing Toolbox
- MATLAB Parallel Server
- Polyspace Bug Finder
## Differences
- New Cell Selection Functionality
-  Erosion of images for better segmentation was achieved by changing line 210 of the code from the original  se=strel('diamond',6) to  se=strel('diamond',5)
-  There are pop-up windows indicating an error has occurred during segmentation
  
  ## Requirements 
- 32 Gigabytes of RAM
- Have Windows 7 or above
  

CGK fork
--------
The main change of this fork is the use of updated versions of:
- [skeleton3D-matlab](https://github.com/phi-max/skeleton3d-matlab)
- [skel2graph3d](https://github.com/phi-max/skel2graph3d-matlab)

------------------------------------------------------------

Forked from original code and [article](https://pubmed.ncbi.nlm.nih.gov/30627639/) by Elisa M York
Packaged May 2018

This package comes with no warranty of any kind. Permission is
granted to use the material for noncommercial and research purposes.

------------------------------------------------------------

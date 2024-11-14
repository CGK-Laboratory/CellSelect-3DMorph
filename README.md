
# 
# ![# CellSelect-3DMorph ](https://github.com/CGK-Laboratory/.github/assets/133057205/2d6d4003-04c6-4772-a32e-27d45efd12fa "CellSelect-3DMorph ") 


![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/CGK-Laboratory/CellSelect-3DMorph/total?style=for-the-badge&color=0c9310)

<div align="center">
<img align="right" src="https://github.com/CGK-Laboratory/CellSelect_3DMorph/assets/133057205/84d05c81-4c03-4797-9398-2243a37b15f6" width="500">
</div>

CellSelect-3DMorph is a MATLAB-based script that isolates and analyzes cell morphology from 3D images by reconstructing cells from fluorescent pixels. The code allows users to obtain different parameters including cell volume (exact number of pixels occupied by the cell), territorial volume (maximum cell extension), ramification index (territorial volume/cell volume), branch length, number of branches and end points, and more. CellSelect uses the 3D Morph code but adds the possibility of rejecting any cells that are not complete in the frame of the image (x, y and z positions) and whose morphology cannot be calculated properly.

<br><br><br>


Description
===========
CellSelect-3DMorph, like its predecessor (3DMorph), was specifically developed to isolate and analyze microglia morphology. Literature has indicated that microglial function can be related to its morphology, making morphology an approximate measure of function. For example, non-ramified microglia have been interpreted as having increased phagocytic functions, while more ramified microglia have surveying functions in the cellular environment. We use CellSelect-3DMorph to study microglia plasticity. Additionally, the code could be used to study astrocyte morphology.


CellSelect-3DMorph imports .tif or .lsm stacks (3-dimensional images) and processes cell morphologies.

## Use

### Using Matlab:
1. Go to the code folder
2. Run Script_3DMorph.m

### Using Windows standalone app 
<img align="right" src="https://github.com/user-attachments/assets/53e2ba87-6964-4f01-bba3-aa1c7b81e5e0" width="60">

1. Download the CellSelect-3DMorph-standalone-app from [the last release](https://github.com/CGK-Laboratory/CellSelect-3DMorph/releases/latest).
2. Install the standalone app.
3. Open the CellSelect-3DMorph app.


### General
Select 'Interactive Mode'. Choose your file (must be in Current Folder or add path first), input xy and z scale, and channel information. 
From here, GUI windows are implemented with individual explanations. For a more detailed run down check the [WIKI]() which has a full protocol on using CellSelect. 
Once complete, a Parameters file will be saved to the MATLAB Current Folder. This file can then be used to batch process files with no user input. 

Control and ExCell images are provided as test samples. 

## Useful Links

- Go to the [wiki](https://github.com/CGK-Laboratory/CellSelect-3DMorph/wiki) to find tips and tutorials.
- Go to the [forum](https://github.com/CGK-Laboratory/CellSelect-3DMorph/discussions) to ask questions, see announcements or open a new discussion.
  
## Differences with the original [3DMorph](https://github.com/ElisaYork/3DMorph) by Elisa M York


- New Cell Selection Functionality (you can manually select which cells to use).

<img align="center" src="https://github.com/user-attachments/assets/82b49ecb-3333-40d5-8873-73423c41683b" width="600">
<br><br>

- Erosion of images for better segmentation was achieved by changing the default `erosion` value and including it as a parameter to be seen and changed by the user easily.
- Force µm as the unit to improve interpretation of the results and figures.
- Force µm as the unit to improveinterperatiuon of the results and figures.
- Allow the user to load videos and save the results on different folders.
- Updated versions of dependencies:
  * [skeleton3D-matlab](https://github.com/phi-max/skeleton3d-matlab)
  * [skel2graph3d](https://github.com/phi-max/skel2graph3d-matlab)

------------------------------------------------------------

  ## Requirements 
- 32 Gigabytes of RAM
- Have Windows 7 or above


## Matlab dependencies (to run from source code):
- MATLAB >= 2018a
- Image Processing Toolbox
- Statistics and Machine Learning Toolbox
- Parallel Computing Toolbox
- MATLAB Parallel Server
- Polyspace Bug Finder


## Citation

If you find CellSelect-3DMorph useful in your research, please cite:

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.12587784.svg)](https://doi.org/10.5281/zenodo.12587783)

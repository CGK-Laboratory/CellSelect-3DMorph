
# ![alt text](https://github.com/CGK-Laboratory/.github/assets/133057205/2d6d4003-04c6-4772-a32e-27d45efd12fa "Logo Title Text 1")
![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/CGK-Laboratory/CellSelect-3DMorph/total?style=for-the-badge&color=0c9310)


<img align="right" src="https://github.com/CGK-Laboratory/CellSelect_3DMorph/assets/133057205/84d05c81-4c03-4797-9398-2243a37b15f6" width="500">
CellSelect-3DMorph is a MATLAB-based script that isolate and analyzes cells morphology from 3D images, by reconstructing the cells from fluorescent pixels. The code allows to obtain different parameters including cell volume (exact number of pixels occupied by the cell), territorial volume (maximum cell extension), ramification index (territorial volume/cell volume), branch length, number of branch and end points, and more. CellSelect uses the 3D Morph developed code but now adds the possibility of rejecting any cell that is not complete in the frame of the image (x, y and z positions) and which the morphology cannot be calculated properly.


Description
===========
CellSelect-3DMorph as its predecessor (3DMorph) was specifically developed to isolate and analyze microglia morphology. Literature have indicated that microglia function is closely related to its morphology, for example a non-ramified microglia have been interpreted as increased microglia phagocytic functions while a more ramified microglia have surveying functions in the cellular environment. We use CellSelect-3DMorph to study microglia plasticity. Furthermore, another interesting application of the code could to study astrocyte morphology. 

CellSelect-3DMorph imports .tif or .lsm stacks (3 dimensional images) and processes cell morphologies.

## Use

### Using Matlab:
1. Go to the code folder
2. Run Script_3DMorph.m

### Using Windows standalone app
1. Download the CellSelect-3DMorph-standalone-app from [the last release](https://github.com/CGK-Laboratory/CellSelect-3DMorph/releases/latest).
2. Install the standalone app
3. Open the CellSelect-3DMorph app

### General
Select 'Interactive Mode'. Choose your file (must be in Current Folder or add path first), input xy and z scale, and channel information. 
From here, GUI windows are implemented with individual explanations. For a more detailed run down check the [WIKI]() which has a full protocol on using CellSelect. 
Once complete, a Parameters file will be saved to the MATLAB Current Folder. This file can then be used to batch process files with no user input. 

Control and ExCell images are provided as test samples. 

## Useful Links

Go to the [wiki](https://github.com/CGK-Laboratory/CellSelect-3DMorph/wiki) to find tips and turoeials.
Go to the [forum](https://github.com/CGK-Laboratory/CellSelect-3DMorph/discussions) to ask questions, see announcements or open a new discussion.
  
## Differences with the original [3DMorph](https://github.com/ElisaYork/3DMorph) by Elisa M York
- New Cell Selection Functionality (you can manually select which cells to use).
- Erosion of images for better segmentation was achieved by changing default `erosion` value and inclidun it as a parameter to be saw and change by the user easily.
- There are pop-up windows indicating an error has occurred during segmentation.
- Force µm as the unit to improveinterperatiuon of the results and figures.
- Allow the user to load videos and save the results on different folders.
- Updated versions of dependencies:
  * [skeleton3D-matlab](https://github.com/phi-max/skeleton3d-matlab)
  * [skel2graph3d](https://github.com/phi-max/skel2graph3d-matlab)

  
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

------------------------------------------------------------

## Citation

If you find CellSelect-3DMorph useful in your research, please cite:

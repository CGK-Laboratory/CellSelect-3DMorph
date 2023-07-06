<img align="right" src="https://github.com/CGK-Laboratory/CellSelect_3DMorph/assets/133057205/85b9d95c-4999-4944-80aa-28f07bd9375c" width="500">

# CellSelect-3DMorph
Cell-Select-3DMorph is a MATLAB-based script that analyzes cells morphology from 3D images, by recontructing the cells from the flourecent pixels. The recontruction is measuring all cells: cell volume and territorial volume,Ramification index, branch length, number of branch and end points, and more. CellSelect, as the name implies, adds the possibility of rejecting any cell that is not fully in the frame of the image and which morphology cannot be calculated properly. 



Description
===========
## Uses
CellSelect-3DMorph as its predecesor (3DMorph) was specifically made to analyze microglia morphology. This is because microglia function is closely related to its morphology, as a non-ramified microglia have phagocytic functions while more ramified microglia have surveying functions in the cellular environment. CellSelect is used in our lab to have an approximate function of microgla. Other cells morphology can also give an aproximate function of the cell like astrocytes and the software could also help with this analysis, however the lab has never done so. 

## Pipeline
CellSelect-3DMorph imports .tif or .lsm stacks (3 dimensional images) and processes cell morphologies. 
To begin, run the program and select 'Interactive Mode'. Choose your file (must be in Current Folder or add path first), input xy and z scale, and channel information. 
From here, GUI windows are implemented with individual explanations. For a more detailed run down check the [WIKI]() which has a full protocol on using CellSelect. 
Once complete, a Parameters file will be saved to the MATLAB Current Folder. This file can then be used to batch process files with no user input. 

Control and ExCell images are provided as test samples. 

For more information,troubleshooting tips, and to cite, please refer to [paper](https://pubmed.ncbi.nlm.nih.gov/30627639/). 


## Matlab dependencies:
- MATLAB >= 2018a
- Image Processing Toolbox
- Statistics and Machine Learning Toolbox
- Parallel Computing Toolbox
- MATLAB Parallel Server
- Polyspace Bug Finder

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

# Usage
The repository TreeToCongruency provides a R script called TreeToCongruency.R to compare two trees to through a tanglegram and estimations of congruency metrics (Robinson-Foulds indexes, Fowlkes-Mallows indexes and Cophenetic correlations).
# Dependencies
The R script TreeToCongruency.R was prepared and tested with R version 3.6.3.
- library(ape)
- library(ggplot2)
- library(maps)
- library(phytools)
- library(viridis)
- library(dplyr)
- library(phylogram)
- library(phangorn)
- library(dendextend)
# Install R from configured sources (Ubuntu 20.04)
```
sudo apt update
sudo apt -y install r-base
R --version
```
# Update R
## 1/ Check current R version
```
R --version
```
## 2/ Update and upgrade apt-get
```
sudo apt-get update
sudo apt-get upgrade
```
## 3/ Check available last recent R version
```
sudo apt-cache showpkg r-base
```
## 4/ Update R
```
sudo apt-get install r-base
```
## 5/ Check updated R version
```
R --version
```
# Usage
```
Rscript TreeToCongruency.R tree1.nwk tree2.nwk
```
# Illustration
![PCA figure](https://github.com/Nicolas-Radomski/TreeToCongruency/blob/main/illustration.png)
# Reference
Mangone I., Palma F., Janowicz A., Moura A., Chiaverini A., Torresi M., Garofolo G., Criscuolo A., Brisse S., Di Pasquale A., Camma C. and N. Radomski. In vitro and in silico parameters for precise cgMLST typing of Listeria monocytogenes 2021, under reviewing
# Acknowledgment
My former colleague Laurent Guillier with whom I learned a lot about R
# Author
Nicolas Radomski

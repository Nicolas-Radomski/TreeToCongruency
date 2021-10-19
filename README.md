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
# Install dependencies and launch the R script
## 1/ Unpack the GitHub repository and move inside
```
git clone https://github.com/Nicolas-Radomski/TreeToCongruency.git
cd TreeToCongruency
```
## 2/ Install dependencies
```
R
install.packages("ape")
install.packages("ggplot2")
install.packages("maps")
install.packages("phytools")
install.packages("viridis")
install.packages("dplyr")
install.packages("phylogram")
install.packages("phangorn")
install.packages("dendextend")
quit()
```
## 3/ Launch the R script
```
Rscript TreeToCongruency.R tree1.nwk tree2.nwk
```
# Illustration
![PCA figure](https://github.com/Nicolas-Radomski/TreeToCongruency/blob/main/illustration.png)
# Reference
First version: Henri C., P. Leekitcharoenphon, H.A. Carleton, N. Radomski, R. S. Kaas, J. F. Mariet, A. Felten, F. M. Aarestrup, P. G. Smidt, S. Roussel, L. Guillier, M.Y. Mistou and R.S. Hendriksen. An assessment of different genomic approaches for inferring phylogeny of Listeria monocytogenes. 2017, Frontiers Microbiology, 8(2351): 1-13, doi.org/10.3389/fmicb.2017.02351
Second version: Vila Nova M, Durimel K., La K., Felten A., Bessières P., Mistou M.Y., Mariadassou M. and N. Radomski. Genetic and metabolic signatures of Salmonella enterica subsp. enterica associated with animal sources at the pangenomic scale. 2019, BMC Genomics, 20(1): 814, doi: 10.1186/s12864-019-6188-x
# Acknowledgment
My colleague Antonio Rinaldi for our fruitful exchanges about Rscript
# Author
Nicolas Radomski

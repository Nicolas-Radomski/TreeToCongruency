# Usage
The repository TreeToCongruency provides a R script called TreeToCongruency.R to compare two Newick trees through a tanglegram and estimations of congruency metrics (Cophenetic correlations, Robinson-Foulds index, tree distances and Fowlkes-Mallows index).
# Dependencies
The R script TreeToCongruency.R was prepared and tested with R version 3.6.3.
- library(dplyr)
- library(ape)
- library(phytools)
- library(dendextend)
- library(viridis)
- library(phylogram)
- library(phangorn)
# Install R from configured sources (Ubuntu 20.04)
```
sudo apt update
sudo apt install r-base
R --version
```
# Update R
## 1/ Check the current R version
```
R --version
```
## 2/ Update and upgrade apt-get
```
sudo apt-get update
sudo apt-get upgrade
```
## 3/ Check the available lastest R version
```
sudo apt-cache showpkg r-base
```
## 4/ Update the lastest R version
```
sudo apt-get install r-base
```
## 5/ Check the updated R version
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
install.packages("dplyr")
install.packages("ape")
install.packages("phytools")
install.packages("dendextend")
install.packages("viridis")
install.packages("phylogram")
install.packages("phangorn")
quit()
```
## 3/ Launch the R script with different paired-trees
```
Rscript TreeToCongruency.R tree1.nwk tree2.nwk
```
```
Rscript TreeToCongruency.R TREE1.nwk TREE2.nwk
```
# Expected figures of paired-trees
- Tanglegram.pdf
- Tanglegram.tiff
# Expected congruency metrics in a CongruencyMetrics.txt file
- Cophenetic correlation with Pearson method
- Cophenetic correlation with Kendall method
- Cophenetic correlation with Spearman method
- Robinson-Foulds distance
- Branch score difference
- Path difference
- Quadratic path difference
- Fowlkes-Mallows index
# Illustration
![PCA figure](https://github.com/Nicolas-Radomski/TreeToCongruency/blob/main/illustration.png)
# Reference
- First version: Henri C., P. Leekitcharoenphon, H.A. Carleton, N. Radomski, R. S. Kaas, J. F. Mariet, A. Felten, F. M. Aarestrup, P. G. Smidt, S. Roussel, L. Guillier, M.Y. Mistou and R.S. Hendriksen. An assessment of different genomic approaches for inferring phylogeny of Listeria monocytogenes. 2017, Frontiers Microbiology, 8(2351): 1-13, doi.org/10.3389/fmicb.2017.02351
- Second version: Vila Nova M, Durimel K., La K., Felten A., Bessières P., Mistou M.Y., Mariadassou M. and N. Radomski. Genetic and metabolic signatures of Salmonella enterica subsp. enterica associated with animal sources at the pangenomic scale. 2019, BMC Genomics, 20(1): 814, doi: 10.1186/s12864-019-6188-x
# Acknowledgment
My colleague Antonio Rinaldi for our fruitful exchanges about Rscript
# Author
Nicolas Radomski

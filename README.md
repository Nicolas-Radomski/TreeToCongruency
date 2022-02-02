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
# Install R (Ubuntu 20.04)
## 1/ Update and upgrade apt-get
```
sudo apt-get update
sudo apt-get upgrade
```
## 2/ Check the available updated R version
```
sudo apt-cache showpkg r-base
```
## 3/ Install the updated R version
```
sudo apt-get install r-base
```
## 4/ Check the installed R version
```
R --version
```
# Install R dependencies and launch with Rscript
## 1/ Unpack the GitHub repository and move inside
```
git clone https://github.com/Nicolas-Radomski/TreeToCongruency.git
cd TreeToCongruency
```
## 2/ Install R dependencies
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
## 3/ Launch with Rscript and different paired-trees
```
Rscript TreeToCongruency.R tree1.nwk tree2.nwk
```
```
Rscript TreeToCongruency.R TREE1.nwk TREE2.nwk
```
# Install the Docker image and launch with Docker
## 1/ Pull the Docker image from Docker Hub
```
docker pull nicolasradomski/treetocongruency
```
## 2/ Launch with Docker and different paired-trees
```
docker run --name nicolas --rm -v /home/data:/data -v /home/output:/output nicolasradomski/treetocongruency:latest sh -c 'Rscript code/TreeToCongruency.R data/tree1.nwk data/tree2.nwk' > output/std.log 2>&1
```
```
sudo docker run --name nicolas --rm -v /home/data:/data -v /home/output:/output nicolasradomski/treetocongruency:latest sh -c 'Rscript code/TreeToCongruency.R data/TREE1.nwk data/TREE2.nwk' > output/std.log 2>&1
```
# Expected output
## 1/ Figures of paired-trees in Tanglegram files
- Tanglegram.pdf
- Tanglegram.tiff
## 2/ Congruency metrics in a CongruencyMetrics.txt file
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
- Docker Hub: https://hub.docker.com/r/nicolasradomski/treetocongruency
# Acknowledgment
My colleague Antonio Rinaldi for our fruitful exchanges about Rscript
# Author
Antonio Rinaldi and Nicolas Radomski

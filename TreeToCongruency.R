#!/usr/bin/Rscript

# clean environment
rm(list=ls())

# get arguments
args = commandArgs(trailingOnly=TRUE)

# test if there are two argument: if not, return an error
if (length(args)!=2) {
  stop("USAGE: Rscript TreeToCongruency.R tree1.nwk tree2.nwk", call.=FALSE)
}

# skip lines related to installation of libraries because there are supposed to be already installed
skip_instalation <- scan(what="character")
# install libraries
install.packages("ape")
install.packages("ggplot2")
install.packages("maps")
install.packages("phytools")
install.packages("viridis")
install.packages("dplyr")
install.packages("phylogram")
install.packages("phangorn")
install.packages("dendextend")

rm(skip_instalation)

# load packages
library(ape)
library(ggplot2)
library(maps)
library(phytools)
library(viridis)
library(dplyr)
library(phylogram)
library(phangorn)
library(dendextend)

# read input arguments
t1 = read.tree(args[1])
t2 = read.tree(args[2])

# print arguments
print("input arguments: ")
cat(args, sep = "\n")

# print working directory
print_wd_path <- paste("working directory path: ", getwd())
print(print_wd_path)

# create output directory
## create directory
dir.create("output")
## create output path
output_path <- paste(getwd(),"output",sep='/')
## print output path
print_outpout_path <- paste("output path: ", output_path)
print(print_outpout_path)

# compare trees graphically (ggsave, maps, phytools, viridis, dplyr, phylogram)
## root trees
tree1 <- midpoint.root(t1)
tree2 <- midpoint.root(t2)
## add branch length
tree1 <- compute.brlen(tree1)
tree2 <- compute.brlen(tree2)
## convert phylo objects to dendrograms
dnd1<- as.dendrogram(tree1)
dnd2<- as.dendrogram(tree2)
## plot the tanglegram with color for common nodes
### create list of dendrograms
dndlist <- dendextend::dendlist(dnd1, dnd2)
### plot tanglegram
tanglegram <- dendextend::tanglegram(dnd1,dnd2, margin_inner = 8, lab.cex = 0.9, 
                                     lwd = 2,common_subtrees_color_branches = TRUE)
### open a pdf file in the output directory, plot tanglegram and close the file
pdf(file = file.path(output_path,"tanglegram.pdf"))
plot(tanglegram)
dev.off()
### open a tiff file in the output directory, plot tanglegram and close the file
tiff(filename = file.path(output_path,"tanglegram.tiff"),
     width = 1200, height = 900, units = "px", pointsize = 30,
     compression = "lzw")
plot(tanglegram)
dev.off()

# remove the file Rplots.pdf
file.remove("Rplots.pdf")

# estimate the Robinson-Foulds distance (phangorn)
# number of partitions of data implied by the first tree but not the second tree
# + number of partitions of data implied by the second tree but not the first tree
## concatenate "robinson-foulds =" and RF.dist output
RF <- print(paste("robinson-foulds =", RF.dist(tree1,tree2),sep=" "))
## save the RF distance in a txt file inside the output directory
write.table(RF, file = file.path(output_path,"RF.txt"), sep = "\t", row.names = TRUE, col.names = FALSE)

# estimate the Robinson-Foulds indexes (phangorn)
# - symmetric difference (i.e. Robinson-Foulds distance)
# - branch score difference
# - path difference
# - weighted path difference
## calculate the Robinson-Foulds indexes
RF_indexes <- treedist(tree1,tree2)
## save the RF_indexes in a txt file inside the output directory
write.table(RF_indexes, file = file.path(output_path,"RF-indexes.txt"), sep = "\t", row.names = TRUE, col.names = FALSE)

# estimate the Fowlkes-Mallows indexes (dendextend)
# a correlation value between 0 to 1 (almost identical clusters for some k)
# - Fowlkes-Mallows index with medium k = 25
# - E_FM: expectancy of the FM
# - V_FM: variance of the FM
## calculate the Fowlkes-Mallows indexes
FM_indexes <- cor_FM_index(dnd1, dnd2, k = 25)
## save the FM_indexes in a txt file inside the output directory
write.table(RF_indexes, file = file.path(output_path,"FM-indexes.txt"), sep = "\t", row.names = TRUE, col.names = FALSE)

# estimate the Cophenetic correlations (dendextend)
# probability (between 0 and 1) assessing how a dendrogram preserves (p closes to 1) the pairwise distances between the original unmodeled data points
## concatenate "cophenetic-correlation =" and RF.dist output
CC_pearson <- print(paste("cophenetic-correlation-person =", cor_cophenetic(dnd1, dnd2, method_coef = "pearson"),sep=" "))
CC_kendall <- print(paste("cophenetic-correlation-kendall =", cor_cophenetic(dnd1, dnd2, method_coef = "kendall"),sep=" "))
CC_spearman <- print(paste("cophenetic-correlation-spearman =", cor_cophenetic(dnd1, dnd2, method_coef = "spearman"),sep=" "))
## save the CC in a txt file inside the output directory
write.table(CC_pearson, file = file.path(output_path,"CC-person.txt"), sep = "\t", row.names = TRUE, col.names = FALSE)
write.table(CC_kendall, file = file.path(output_path,"CC-kendall.txt"), sep = "\t", row.names = TRUE, col.names = FALSE)
write.table(CC_spearman, file = file.path(output_path,"CC-spearman.txt"), sep = "\t", row.names = TRUE, col.names = FALSE)

# add message
print("Developped by Nicolas Radomski on October 18 (2021) with the R version 3.6.3 (2020-02-29)")

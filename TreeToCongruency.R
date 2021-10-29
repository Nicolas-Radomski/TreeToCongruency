#!/usr/bin/env Rscript

# clean environment
rm(list=ls())

# skip lines related to installation of libraries because there are supposed to be already installed
skip_instalation <- scan(what="character")
# install libraries
install.packages("dplyr")
install.packages("ape")
install.packages("phytools")
install.packages("dendextend")
install.packages("viridis")
install.packages("phylogram")
install.packages("phangorn")

rm(skip_instalation)

# load packages avoiding warning messages
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ape))
suppressPackageStartupMessages(library(phytools))
suppressPackageStartupMessages(library(dendextend))
suppressPackageStartupMessages(library(viridis))
suppressPackageStartupMessages(library(phylogram))
suppressPackageStartupMessages(library(phangorn))

# get arguments
args = commandArgs(trailingOnly=TRUE)

# test if there are two arguments: if not, return an error
if (length(args)!=2) {
  stop("Please, provide two Newick files\n
       USAGE: Rscript 20211020-nwk-input.R tree1.nwk tree2.nwk", call.=FALSE)
}

# read input arguments (ape)
t1 = read.tree(args[1])
t2 = read.tree(args[2])

# prepare input
## root trees (phytools)
tree1 <- midpoint.root(t1)
tree2 <- midpoint.root(t2)
## add branch length (ape)
tree1 <- compute.brlen(tree1)
tree2 <- compute.brlen(tree2)
## convert phylo objects to dendrograms (stats)
dnd1 <- as.dendrogram(tree1)
dnd2 <- as.dendrogram(tree2)

# plot a tanglegram with color for common nodes

## open a pdf file in the output directory, plot tanglegram and close the file
pdf(file = "Tanglegram.pdf")
dendextend::tanglegram(dnd1,dnd2, margin_inner = 8, lab.cex = 0.9,lwd = 2,common_subtrees_color_branches = TRUE)
dev.off()

## open a tiff file in the output directory, plot tanglegram and close the file
tiff(filename = "Tanglegram.tiff", width = 1200, height = 900, units = "px", pointsize = 30, compression = "lzw")
dendextend::tanglegram(dnd1,dnd2, margin_inner = 8, lab.cex = 0.9,lwd = 2,common_subtrees_color_branches = TRUE)
dev.off()

# estimate several metrics
## create CongruencyMetrics.txt where metrics will be saved
sink("CongruencyMetrics.txt")

## print working directory path
cat("Working directory path:",getwd(),"\n")
## print arguments
cat("First tree:",args[1],"\n")
cat("Second tree:",args[2],"\n")

## estimate the Cophenetic correlations (dendextend)
## probability (between 0 and 1) assessing how a dendrogram preserves (p closes to 1) the pairwise distances between the original unmodeled data points
### estimate and print Cophenetic correlation with Pearson method
ccp <- cor_cophenetic(t1,t2,method_coef="pearson")
cat("Cophenetic correlation with Pearson method:" ,round(ccp,4),"\n")
### estimate and print Cophenetic correlation with Kendall method
cck <- cor_cophenetic(t1,t2,method_coef="kendall")
cat("Cophenetic correlation with Kendall method:" ,round(cck,4),"\n")
### estimate and print Cophenetic correlation with Spearman method
ccs <- cor_cophenetic(t1,t2,method_coef="spearman")
cat("Cophenetic correlation with Spearman method:" ,round(ccs,4),"\n")

## estimate the Robinson-Foulds distance and Robinson-Foulds indexes
### estimate and print Robinson-Foulds distance (phangorn)
### number of partitions of data implied by the first tree but not the second tree
### + number of partitions of data implied by the second tree but not the first tree
rf <- RF.dist(t1,t2)
cat("Robinson-Foulds distance:" ,rf,"\n")
### estimate and print tree distances (phangorn)
rfm <- treedist(t1,t2)
cat("Branch score difference:",rfm[2],"\n")
cat("Path difference:",rfm[3],"\n")
cat("Quadratic path difference:",rfm[4],"\n")

### estimate and print the Fowlkes-Mallows index (dendextend)
# a correlation value between 0 to 1 (almost identical clusters for some k)
fmi <- cor_FM_index(dnd1,dnd2,k=25)
cat("Fowlkes-Mallows index:",fmi[1])

### close correlation_metrics.txt
sink()

# add message
print("Developped by Nicolas Radomski and Antonio Rinaldi on October 29 (2021) with the R version 3.6.3 (2020-02-29)")

# replace lines into the TreeToCongruency.R Rscript
## pdf(file = "Tanglegram.pdf") by pdf(file = "output/Tanglegram.pdf")
## sink("CongruencyMetrics.txt") by sink("output/CongruencyMetrics.txt")
# Base image https://hub.docker.com/u/rocker/
FROM rocker/r-base:latest
# create directories
RUN mkdir -p /data
RUN mkdir -p /code
RUN mkdir -p /output
# copy files
COPY /code/install_packages.R /code/install_packages.R
COPY /code/TreeToCongruency.R /code/TreeToCongruency.R
# install R-packages
RUN Rscript /code/install_packages.R
# run the script
CMD Rscript /code/TreeToCongruency.R

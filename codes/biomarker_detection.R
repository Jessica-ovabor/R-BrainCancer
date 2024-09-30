#install libraries
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()
#Install TCGA Biolinks
BiocManager::install("TCGAbiolinks", force = TRUE)

#edgeR and Limma for Differential Analysis

BiocManager::install("edgeR")

BiocManager::install("edgeR")

##EDASeq

BiocManager::install("EDASeq")

#gplots

install.packages('gplots')

#sesameData

BiocManager::install("sesameData")

#Summarized Experiment

BiocManager::install("SummarizedExperiment")

##enable libraries

library("TCGAbiolinks")
library(SummarizedExperiment)
library(biomaRt)
library("limma")
library("edgeR")
library("EDASeq")
library(gplots)

#project information

getProjectSummary("TCGA-GBM")
?GDCquery

##Download and preprocess data

gbmQ <- GDCquery(project = 'TCGA-GBM',
                 data.category ='Transcriptome Profiling',
                 data.type ='Gene Expression Quantification')
GDCdownload(gbmQ)
gbm.data <- GDCprepare(gbmQ)
head(gbm.data)

#explore metadata
gbm.data$tumor_descriptor
gbm.data$race
gbm.data$barcode

#Creating metadata for use case
simpleMeta <- data.frame("barcode" =gbm.data$barcode,
                         "race" = gbm.data$race,
                          "tumor_type" =gbm.data$tumor_descriptor)


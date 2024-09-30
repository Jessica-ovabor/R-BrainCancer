#Differential  expressed analysis(dea)
selectResults <- TCGAanalyze_DEA(mat1 = filtData[, c(selectedBarcodes)[1:5]],
                                 mat2 = filtData[, c(selectedBarcodes)[6:10]],
                                 Cond1type = "Recurrence",
                                 Cond2type = "Primary",
                                 pipeline =  "edgeR",#limma
                                 fdr.cut = 0.01,
                                 logFC.cut = 2) 

#Differential  expressed analysis with Treatment levels
selectResults.level <- TCGAanalyze_LevelTab(selectResults, "Recurrence","Primary",
                                            filtData[, c(selectedBarcodes)[1:5]],
                                            filtData[, c(selectedBarcodes)[6:10]])
plot(selectResults$logFC, -log10(selectResults$FDR))

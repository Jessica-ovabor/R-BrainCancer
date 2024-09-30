# Heatmap generation

head(selectResults.level)
dim(selectResults.level)
    
heat.data <- filtData[rownames(selectResults.level),]

#color the plot by the kind of tumor
cancer.type <- c(rep("Recurrence", 5), rep("Primary", 5))

ccodes <- c()

for (i in cancer.type){
  if(i == "Recurrence"){
    ccodes <- c(ccodes, "red")
  }else{
    ccodes <- c(ccodes, "blue")
  }
}

heatmap.2(x = as.matrix(heat.data),
          col= hcl.colors(10, palette = 'Blue-Red 2'),
          Rowv = F, Colv = T,
          scale = 'row',
          sepcolor =  'black',
          trace = 'none',
          key =  TRUE,
          dendrogram = 'col',
          cexRow = 0.5, cexCol =1 ,
          main = "",
          na.color = 'black',
          ColSideColors = ccodes)

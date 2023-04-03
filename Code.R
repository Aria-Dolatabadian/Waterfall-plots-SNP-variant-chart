if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("GenVisR")

library(GenVisR)

mutationData <- read.delim("BKM120_Mutation_Data.tsv")


# Reformat the mutation data for waterfall()
mutationData <- mutationData[,c("patient", "gene.name", "trv.type", "amino.acid.change")]
colnames(mutationData) <- c("sample", "gene", "variant_class", "amino.acid.change")

# Create a vector to save mutation priority order for plotting
mutation_priority <- as.character(unique(mutationData$variant_class))

# Create an initial plot


mutationColours <- c("nonsense"='#4f00A8', "frame_shift_del"='#A80100', "frame_shift_ins"='#CF5A59', "in_frame_del"='#ff9b34', "splice_site_del"='#750054', "splice_site"='#A80079', "missense"='#009933', "splice_region"='#ca66ae', "rna"='#888811')

waterfall(mutationData, fileType = "Custom", variant_class_order=mutation_priority, mainPalette=mutationColours)


#https://genviz.org/module-03-genvisr/0003/02/01/waterfall_GenVisR/

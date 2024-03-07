# cse284-project
## Project Overview
In our project, we will compare the results of using two different commands, PLINK and KING, to identify relatives in a specific population in the dataset 1000 Genomes Project. 
## Data
We will focus on 1000 Genomes individuals from the LWK population (the Luhya population from Kenya). For Plink, we use the preprocessed files in plink format: `ps2_ibd.lwk.fam`, `ps2_ibd.lwk.bed`, and `ps2_ibd.lwk.bim`. For KING, only `ps2_ibd.lwk.bed` was used.
## PLINK
In our repository, we have created the "plink.sh" file. In this script file, we input the binary genotype data and ouptut the file containing the identify-by-descent (IBD) statistics calculated for all pairs of individuals in the input data. 
## KING
[KING](https://www.kingrelatedness.com/manual.shtml) is a toolset to explore genotype data from a genome-wide association study (GWAS) or a sequencing project. 

In our repository, we have created the "king.sh" file. In this script file, we input the genotype data in binary PLINK format and output the file containing information about the segments of IBD detected between all pairs of individuals in the input data.
## Analysis & Result


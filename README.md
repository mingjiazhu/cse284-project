# cse284-project
Group 17 / Brocolli
Yinglan Chi, Jiayin Liu, Mingjia Zhu

## Project Overview

In our project, we will compare the results of using two different commands, PLINK and KING, to identify relatives in a specific population in the dataset 1000 Genomes Project.

## Data

In our project, we will use the 1000 Genomes Project. The 1000 Genomes Project is a landmark genome sequencing project that was launched in 2008. The goal of this project is to sequence the genomes of a large number of people from different ethnic groups around the world and provide a comprehensive resource on human genetic variation. It sequenced the genomes of over 2500 individuals from 26 populations around the world. The objective of the 1000 Genomes Project was to identify most genetic variants with frequencies of at least 1% in the populations studied. This includes SNPs, short insertions and deletions, and larger structural variants. The data has been made freely available to the research community, facilitating genetic and biomedical research.

We will focus on 1000 Genomes individuals from the LWK population (the Luhya population from Kenya). For Plink, we use the preprocessed files in plink format: `ps2_ibd.lwk.fam`, `ps2_ibd.lwk.bed`, and `ps2_ibd.lwk.bim`. For KING, only `ps2_ibd.lwk.bed` was used.

## PLINK

In our repository, we have created the "plink.sh" file. In this script file, we input the binary genotype data and ouptut the file containing the identify-by-descent (IBD) statistics calculated for all pairs of individuals in the input data.

## KING

[KING](https://www.kingrelatedness.com/manual.shtml) is a toolset to explore genotype data from a genome-wide association study (GWAS) or a sequencing project. To install KING, run

```
wget https://www.kingrelatedness.com/Linux-king.tar.gz
tar -xzvf Linux-king.tar.gz
```

We have included the installed executable file in this repository.

In our repository, we have created the "king.sh" file. In this script file, we input the genotype data in binary PLINK format and output the file containing information about the segments of IBD detected between all pairs of individuals in the input data.

## Analysis & Result

We compared our relative pairs results using PLINK and KING on several relationship, including parent & child, siblings, first cousin, grandparent & grandchild, and identical twins.

For PLINK, we selected data from `lwk.ibd.genome` by filtering %IBD2, %IBD1 and %IBD0, which are columns `Z2`, `Z1` and `Z0`.

For KING, we have 2 methods of selecting data:

1. The first method is selecting by filtering %IBD2 and %IBD1 similarly to PLINK, which are columns `IBD1Seg` and `IBD2SEG` here.
2. The second method is selecting by filtering the `InfType` column. `InfType` column have different values that represent different relationship, including `PO` for Parent-Offspring, `FS` for Full Sibling, `UN` for Unrelated, `2nd` for Second-degree relatives, `3rd` for Third-degree relatives, and `4th` for Fourth-degree relatives.

For parent & child:
PLINK method and 2 KING methods gave exact same output pairs, we think it is because IBD percent for parent & child is definite, not an approximate value, %IBD1 = 1.

For siblings:
PLINK and KING's second method of filtering the `InfType` column gave same results, while KING's first method of filtering %IBD2 and %IBD1 gave a different result with one less pair. We think the reason of this difference is though both filtering the IBD percent, PLINK's and KING's algorithm and optimization may differ from each other, leading to a difference in the output.

For First cousin:
PLINK gave 9 pairs of output, KING's first method of filtering %IBD2 and %IBD1 gave 11 pairs of output and KING's second method of filtering the `InfType` column gave 8 pairs of output. We think PLINK and KING's first method of filtering %IBD2 and %IBD1 may overcound other pairs as first cousin.

For grandparent & grandchild:
PLINK gave 4 pairs of output, KING's both methods gave same 5 pairs of output. However, all methods may overcount because grandparent & granchild relationship have ths same IBD percents with half siblings and also avuncular. They both belong to second-degree relatives and we could not distinguish them using out methodes here.

For identical twins:
All three methods gave no output. Probably due to the limitation of our dataset, there is no identical twins data in our dataset.

Overall, we have found that our three methods generate similar outputs, sometimes small difference occurs, which may due to the differnet algorithm and optimization mechanism in different methods.

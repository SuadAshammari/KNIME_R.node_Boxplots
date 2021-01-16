# Create Multiple Boxplots in KNIME Using R view node
## ![Image](https://www.knime.com/files/knime_logo_github_40x40_4layers.png) KNIME®
## ![Image](https://www.r-project.org/Rlogo.png)

This repository contains the KNIME workflow that has two nodes. The first is the file reader that includes the data frame, and the second is the R node (R view (table)), which contains the R script used to create a list of boxplots.

## How To Use The Workflow:
- File reader node: in this node, add the data set.
- R view (table) node: this node will create the boxplot figures when it is executed. If there are figures overlap, click on configure > Image settings> then change the width and height to change the figures' dimensions.

## ![alt text](https://raw.githubusercontent.com/SuadAshammari/KNIME_R.node_Boxplots/main/ImageExample/KNIME_Script%20with%20changes.png?token=ASMBS7RWDY6QESBGDTXKJJTAAJAKS)

>In this figure, the highlighted word with the red square is the column that contains the groups to compare. This means the user has to replace "Group" with the column name in the data set used in the analysis. For example, if the column containing the groups is named "Label", the user should substitute all "Group" words highlighted with the red square with "Label".

## Node Representation 
## ![Image](https://raw.githubusercontent.com/SuadAshammari/KNIME_R.node_Boxplots/main/ImageExample/boxplots%20Screenshot%202021-01-12%20131257.png?token=ASMBS7WFI5QSTR3HPDY3EPDAAJARA)

## Node Outcomes:
## ![Image](https://raw.githubusercontent.com/SuadAshammari/KNIME_R.node_Boxplots/main/ImageExample/Boxplot_t.test.png?token=ASMBS7XR6E2S4PAGR4QZ773AAJA3S)
> Outcome for T-test (unpaired).

## ![Image](https://raw.githubusercontent.com/SuadAshammari/KNIME_R.node_Boxplots/main/ImageExample/Boxplot%20ANOVA.png?token=ASMBS7QQ3VR4M7O2ZN56O73AAJBB4)
> Outcome for one-way ANOVA.

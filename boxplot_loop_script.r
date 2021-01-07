df <- knime.in
library(ggplot2)
library(ggpubr)
library(dplyr)

# This code is used to change column names. In KNIME, the R node uses the same column names, which leads to the error message " Error <text>: unexpected symbol."
names(df)<- gsub("\\.",".", make.names(names(df), unique = T))
names(df)

# select only numeric columns:
sample_list<-colnames(dplyr::select_if(df, is.numeric))
sample_list

# Create a list to save the boxplots into it:
allplots <- list()

# A loop that used to generate boxplots:
if (nlevels(df$Group)==2) {
for (i in 1: length(sample_list)){
  bp<- ggplot(df, aes_string(x="Group",y=sample_list[i],fill="Group", title = sample_list[i], outlier.shape = NA)) +
    border(color = "black", size= 2.5)+
    geom_jitter(aes(fill= Group),shape = 21, size = 4,color = "black", stroke= 1, position = position_jitter())+
    geom_boxplot(alpha=0.7, linetype = 1, size= 1.1) + theme(legend.position="none") + scale_fill_brewer(palette="Set1")+    stat_boxplot(geom ="errorbar",size= 1.1, width= 0.2)+
    theme (axis.title.y=element_blank())+
    theme (axis.title.x=element_blank())+
    stat_compare_means(inherit.aes = TRUE, data=df, method=  "t.test", paired= FALSE ,method.args = list(var.equal = TRUE),fontface = "bold.italic", size= 5,vjust=0.2,hjust=0.7)
  allplots[[i]] <-  bp}
} else if (nlevels(df$Group) > 2) {
  for (i in 1: length(sample_list)){ 
    bp<- ggplot(df, aes_string(x="Group",y=sample_list[i],fill="Group", title = sample_list[i], outlier.shape = NA)) +
      border(color = "black", size= 2.5)+
      geom_jitter(aes(fill= Group),shape = 21, size = 4,color = "black", stroke= 1, position = position_jitter())+
      geom_boxplot(alpha=0.7, linetype = 1, size= 1.1) + theme(legend.position="none") + scale_fill_brewer(palette="Set1")+    stat_boxplot(geom ="errorbar",size= 1.1, width= 0.4)+
      theme (axis.title.y=element_blank())+
      theme (axis.title.x=element_blank())+
      stat_compare_means(inherit.aes = TRUE, data=df, method=  "anova", paired= FALSE ,method.args = list(var.equal = TRUE),fontface = "bold.italic", size= 5,vjust=0.2,hjust=0.2)
    allplots[[i]] <-  bp}
  }


patchwork::wrap_plots(allplots)


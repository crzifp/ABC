install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(xlsx)
library(ggplot2)


setwd("C:/Users/fuelx_wl3/Documents/FuelX Data/Python Scrapper")

glossier <- read.csv("glossier_sample_data.csv")
str(glossier)
names(glossier)[1] <- "domain_name"
head(glossier)


gid_domain_count <- read.csv("gid_domain_count.csv")

gid_domain_count_sub <- gid_domain_count[gid_domain_count$domain_name!="", ]

merged <- left_join(gid_domain_count_sub, glossier, by="domain_name")
tibble <- merged %>% group_by(gid) %>% summarize(male = sum(count*male)/sum(count), female = sum(count*female)/sum(count), 
age_18_24 = sum(count*X18.24)/sum(count),  age_25_34 = sum(count*X25.34)/sum(count), age_35_44 = sum(count*X35.44)/sum(count), age_45_54 = sum(count*X45.54)/sum(count),
age_65 = sum(count*X65.)/sum(count), has_children = sum(count*Has.Children)/sum(count), no_children = sum(count*No.Children)/sum(count), African = sum(count*African)/sum(count), African_American = sum(count*African.American)/sum(count),
Asian = sum(count*Asian)/sum(count), Caucasian = sum(count*Caucasian)/sum(count), Hispanic = sum(count*Hispanic)/sum(count), Middle_Eastern = sum(count*Middle.Eastern)/sum(count),
Other = sum(count*Other)/sum(count))
df <- as.data.frame(tibble)
df_complete <- df[complete.cases(df),]

#clustering
df_dist <- dist(df_complete[,c(-1,-18)], method="euclidean")
h_clust <- hclust(df_dist)
h_clust
plot(h_clust)


df_complete["gender"] <- ifelse(df_complete$male>= df_complete$female, "M", "F")

mean(df_complete$gender, na.rm = T)


for(i in 1:nrow(df_complete)){
  for(j in 4:8){
     if(df_complete[i,j] == max(df_complete[i,4:8])){
       df_complete$age[i] = colnames(df_complete[i,])[j]
     }
  }
}

for(i in 1:nrow(df_complete)){
  for(j in 11:16){
    if(df_complete[i,j] == max(df_complete[i,11:16])){
      df_complete$ethnicity[i] = colnames(df_complete[i,])[j]
    }
  }
}

ggplot(df_complete, aes(x=factor(gender), fill=ethnicity)) + geom_bar() + labs(title = "Glossier customers by Gender and Ethnicity")




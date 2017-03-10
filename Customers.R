# install.packages("ggraph")
# install.packages("googlesheets")

library(tidyverse)
library(googlesheets)
library(ggraph)
library(igraph)
library(ggvis)

Dat<-gs_title("Customers_AF.xlsx")
Dat<-Dat %>% gs_read("Customers")

head(Dat)
Dat<-Dat %>% 
  select(advisor, name, state, school, ID)

graph <- graph_from_data_frame(Dat)

# Not specifying the layout - defaults to "auto"

ggraph(graph) + 
  geom_edge_link() + 
  geom_node_label(aes(label=name))

ggplot(data, aes(aes)) + 
  geom_geom()

ggplot(Dat, aes(x=poo,y=j)) + 
  geom_point()



# Clean Universities ------------------------------------------------------
library(readr)
uni<-read_csv("~/Downloads/world-universities.csv",quote = F,col_names = F)
# uni<-read.csv("~/Downloads/world-universities.csv")

head(uni)
unique()
uniqchars <- function(x) unique(strsplit(x, "")[[1]]) 
chars<-NULL
for(i in uni$X2){
  chars<-c(chars,uniqchars(i))
}
a<-unique(chars)
a
library(stringr)
b<-unique(str_extract(a,"^(?!.*[a-zA-Z]).*$"))
bb=c(NA," ","and"," "," "," ","", "", " "," ", " ", " ","o","i","n","e","a","2","1","u","a","o","e","a","O","e","c","u","o", "a","A","o","U","E"," ","a","3","4","O"," ","B","6"," ","i", "8","9","5","o"," ", " ", " "," ","s","a","S","z","c"," ","i","8","I","S","l" )
poo<-data.frame(Spec=as.character(b),norm=bb)
poo$Spec<-as.character(poo$Spec)
poo$norm<-as.character(poo$norm)
poo$Spec[9]<-"\\("
poo$Spec[10]<-"\\)"
poo$Spec[11]<-"\\."
poo$Spec[35]<-"\\+"
uni<-read_csv("~/Downloads/world-universities.csv",quote = F,col_names = F)

for(i in 2:length(poo$Spec)){
  bob<-as.character(poo$Spec[i])
  uni$X2<-gsub(bob,poo$norm[i],uni$X2)
}
head(uni)
write.csv(uni,"world-universities.csv",row.names = F)

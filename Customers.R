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



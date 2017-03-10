
# Clean Universities ------------------------------------------------------
library(stringr)
library(readr)

uni<-read_csv("~/Downloads/world-universities.csv",quote = F,col_names = F)

head(uni)

# make function to find the unique characters in a string
uniqchars <- function(x) unique(strsplit(x, "")[[1]]) 

# Loop through all the university names and get all the unique characters in 
# each and make a long vector out of them
chars<-NULL
for(i in uni$X2){
  chars<-c(chars,uniqchars(i))
}

# Then get just the unique characters from the previous step
a<-unique(chars)
a
# use a regular expression to find all the characters that are NOT a-z or A-Z
b<-unique(str_extract(a,"^(?!.*[a-zA-Z]).*$"))
b
# make a vector of charcters that are in the same order as the vector b above
# These are what you will change the TO 
bb=c(NA," ","and"," "," "," ","", "", " "," ", " ", " ","o","i","n","e","a","2","1","u","a","o","e","a","O","e","c","u","o", "a","A","o","U","E"," ","a","3","4","O"," ","B","6"," ","i", "8","9","5","o"," ", " ", " "," ","s","a","S","z","c"," ","i","8","I","S","l" )
# Make a dataframe with Spec=Special Characters, norm=normal characters
# We will replace the Spec with the norm below
poo<-data.frame(Spec=as.character(b),norm=bb)
poo$Spec<-as.character(poo$Spec)
poo$norm<-as.character(poo$norm)

# add some escape characters for a few problem cases where they have meaning in the regexp
poo$Spec[9]<-"\\("
poo$Spec[10]<-"\\)"
poo$Spec[11]<-"\\."
poo$Spec[35]<-"\\+"

#  Loop through each special character and search and replace in the uniiversity names
for(i in 2:length(poo$Spec)){
  bob<-as.character(poo$Spec[i])
  uni$X2<-gsub(bob,poo$norm[i],uni$X2)
}

head(uni)

# Save it
write.csv(uni,"world-universities.csv",row.names = F)

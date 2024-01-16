# INDICE
# 1. VERIFY DATAFRAME STRUCTURE
# 2. DEFINE COLUMN TYPES
# 3. COLNAMES MANIPULATION
# 4. ROWNAMES MANIPULATION
# 5. DIVIDE NUMERIC AND NON NUMERIC VARIABLES
# 6. SUBSET A DATAFRAME
# 7. CREATE A NEW COLUMN BASED ON OTHER ONES
# 8. MISSING DATA OPERATIONS
# 9. ADD DATA TO THE DATAFRAME
# 10. MODIFY THE DATAFRAME
# 11. DIVISION IN TRAIN AND TEST DATASET










# operazioni prelminari

path <- "C:/Users/andre/OneDrive/Documenti/tuttooo/R/files/afl_stats.csv"
dataset <- as.data.frame(read.csv(path, stringsAsFactors = FALSE, header = TRUE))

X <- data.frame(a=1:4, sesso=c("M","F","F","M"))













# 1. VERIFY DATAFRAME STRUCTURE (verifica struttura generale del dataframe)

str(dataset)         # indicazioni su tipo di struttura, numero di righe e colonne,
                     # e per ognuna di queste nome, tipo di variabile e le prime obs 

dim(dataset)         # numero di colonne e di righe
length(dataset)      # numero di colonne
nrow(dataset)        # numero di righe
ncol(dataset)        # numero di colonne

head(dataset)        # prime 6 righe
tail(dataset)        # ultime 6 righe

summary(dataset)     # per alcune statistiche descrittive iniziali

library(dplyr)
glimpse(dataset)    # per un primo sguardo al dataset

table(dataset$var_qual)  # per tabella frequenze assolute di variabile fattoriale
table(data$var_qual1,data$var_qual2)

table(dataset$var_qual/count(var_qual))  # per tabella frequenze relative variabile fattoriale
prop.table(dataset$var_qual) # per tabella frequenze percentuali (anche con più variabili)

by(data$var_num,data$var_cat,summary) # per summary di confronto tra dummies di variabile categorica

library(table1)
library(kableExtra)
table1(~LEAK_STE | DIAGNOSI, data=DB) # opzione più bella graficamente, utile per tabelle contingenza

chisq <- chisq.test(table(data$x1, data$x2))
pvalue <- chisq$p.value

# Un'opzione interessante è data dal pacchetto skimr, che restituisce una panoramica generale del
# dataset iniziale con: nome del dataset, numero di righe e colonne, tipo e quantità di variabili,
# una panoramica delle statistiche descrittive per le variabili fattoriali (missing data con anche %,
# minimo, massimo, valori mancanti, valori unici, whitespaces) e per le variabili numeriche (missing 
# data con anche %, media, deviazione standard, minimo, massimo, 1°/2/3° quartile)

require(skimr)
skim_without_charts(dataset)


require(skimr)
Range <- function(x) {max(x) - min(x)}
my_skim <- skim_with(base = sfl(),
                     numeric = sfl(hist = NULL, range = Range))
my_skim(school)






which.max(data$x1) # per trovare la riga del massimo in base ad una colonna
which.min(data$x1) # per trovare la riga del minimo in base ad una colonna 

# Si possono calcolare alcune statistiche, come correlazione, covarianza

round(cor(x),3) # matrice correlazione
round(cov(x),3) # matrice varianza/covarianza

require(ggm)
round(parcor(x),3) # matrice correlazioni parziali


# modo più contorto per stat descrittive

summary <- NA
tot_summary <- rbind(summary,summary,summary,summary,summary,summary,summary)
for (i in 1:dim(numeric)[2]){
  Min <- min(numeric[,i])
  First_quartile <- quantile(numeric[,i],0.25)
  Median <- median(numeric[,i])
  Mean <- mean(numeric[,i])
  Third_quartile <- quantile(numeric[,i],0.75)
  Max <- max(numeric[,i])
  sd <- sd(numeric[,i])
  summary <- rbind(Min,First_quartile, Median, Mean, Third_quartile, Max, sd)
  tot_summary <- cbind(tot_summary,summary)
}
tot_summary <- tot_summary[,-1]
colnames(tot_summary)<-c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
rownames(tot_summary) <- c("Min","1st Qu.","Median","Mean","3rd Qu.","Max","sd")
print(tot_summary)
rm(i,summary,Min,First_quartile,Mean,Median,Max,sd,Third_quartile)

# coefficiente di variazione

cv <- function(x) {sd(x)/mean(x)}
round(apply(school, 2, cv), 2)


# per il calcolo del chi quadro usare la seguente funzione

library(plyr)
combos <- combn(ncol(qualit),2)
adply(combos, 2, function(x) {
  test <- chisq.test(qualit[, x[1]], qualit[, x[2]])
  tab  <- table(qualit[, x[1]], qualit[, x[2]])
  out <- data.frame("Row" = colnames(qualit)[x[1]]
                    , "Column" = colnames(qualit[x[2]])
                    , "Chi.Square" = round(test$statistic,3)
                    , "df"= test$parameter
                    , "p.value" = round(test$p.value, 3)
                    , "n" = sum(table(qualit[,x[1]], qualit[,x[2]])),
                    "Chi.Square norm"  =test$statistic/(sum(table(qualit[,x[1]], qualit[,x[2]]))* min(length(unique(qualit[,x[1]]))-1 , length(unique(qualit[,x[2]]))-1)) 
  )
  
  
  return(out)
  
})






# 2. DEFINE COLUMN TYPES (definire i tipi di variabili del dataset)

str(dataset)         # da qui informazioni utili al riguardo
colnames(dataset)    # per ottenere i nomi delle variabili/colonne
is.numeric(dataset$colonna_1) # per sapere se ? una variabile numerica o no
class(dataset$colonna_1)      # per sapere il tipo di variabile
names(dataset)       # per ottenere i nomi delle variabili/colonne

sapply(dataset, typeof) # per sapere i tipi delle colonne

library(dplyr)
dataset %>%  rename(match = partita) # cambiare nome alla colonna

data$colonna <- as.factor(data$colonna)
data$colonna <- as.array(data$colonna)
data$colonna <- as.character(data$colonna)
data$colonna <- as.Date(data$colonna)
data$colonna <- as.difftime(data$colonna)
data$colonna <- as.dist(data$colonna)
data$colonna <- as.double(data$colonna)
data$colonna <- as.integer(data$colonna)
data$colonna <- as.list(data$colonna)
data$colonna <- as.numeric(data$colonna)









# 3. COLNAMES MANIPULATION
# per modificare i nomi delle colonne si possono utilizzare i seguenti metodi
names(X) <- c("y","gruppo","numero")   # modificare tutti i nomi delle colonne
names(X[2]) <- "prova"                 # modificare il nome di una colonna

colnames(x)[c(6,9)] <- c("a","b","c","d")

colnames(data) <- c("a", "b", "d", "c", "e", "f")










# 4. ROWNAMES MANIPULATION

rownames(df) <- c("Row1","Row2","Row3","Row4")
row.names(x) <- c("a","b","c","d")

row.names(df)[2] <- "ModifiedSecond"  # per una singola riga specifica












# 5. DIVIDE NUMERIC AND NON NUMERIC VARIABLES

data_num <- as.numeric(data)












# 6. SUBSET A DATAFRAME

x1 <- x[,c(1:5)]

library(dplyr)
dataset_2 = dataset %>% filter(team == "Adelaide") # crea un secondo dataset con condizione
# si possono anche mettere più condizioni consecutive, ognuna dopo un %>%

library(dplyr)
dataset_2 = dataset %>% select(team, opposition, score) # crea un dataset selezionando solo alcune variabili










# 7. CREATE A NEW COLUMN BASED ON OTHER ONES

DB$new <- NA # per aggiungere una colonna vuota

DB$DIAGNOSI[DB$`FINAL DIAGNOSIS` == "CNV"] <- 1 # per modificare una colonna in base a condizione su altra
DB$DIAGNOSI[DB$`FINAL DIAGNOSIS` != "CNV"] <- 0

library(dplyr)
dataset_2 = dataset %>% mutate(match = str(team) + str(opposition)) 
# creare dataset con nuova colonna con condizione

df$new <- c(3, 3, 6, 7, 8, 12)
df['new'] <- c(3, 3, 6, 7, 8, 12)
df_new <- cbind(df, new)








# 8. MISSING DATA OPERATIONS

sapply(data, function(x)(sum(is.na(x))))  # verifica valori mancanti

is.na(data)
is.na(data$colonna_1)
which(is.na(data)) # quali righe hanno dati mancanti
sum(is.na(data)) # quante righe hanno dati mancanti
colSums(is.na(data)) # quanti dati mancanti in ogni colonna

mydata$v1[mydata$v1==99] <- NA # rendere i dati mancanti in una colonna in base ad una condizione

mean(x, na.rm=TRUE) # na.rm = TRUE nelle funzioni esclude le obs con dati mancanti dall'operazione

mydata[!complete.cases(mydata),] # per ottenere quali sono le righe senza missing data

newdata <- na.omit(mydata) # per ottenere un dataset con tutte le righe senza dati mancanti di un dataset










# 9. ADD DATA TO THE DATAFRAME
# per aggiungere dati al dataframe si pu? fare in modi differenti:

X$eta <-  c(2.5,3,5,6.2) #aggiungere una colonna (variabile) di nome eta

x5 <- c(5, "M",3)
X[5,]<- x5        # per aggiungere una nuova riga (osservazione) al dataframe

data <- rbind(data, new_row) # aggiungere riga sotto
data <- cbind(data, new_column) # aggiungere colonna a destra

library(tidyverse)
data %>% add_row(col1 = 49, col2 = "Nepal", col3 = "1.83%")  # aggiungere riga sotto













# 10. MODIFY THE DATAFRAME
# si può anche modificare il dataframe col comando edit()
X <- edit(X)  # giusto con pochi cambiamenti da fare. Per salvare il cambiamento bisogna
              # nominarlo

DB <- DB[, -4] # togliere una colonna
DB <- DB[-4, ] # togliere una riga
DB <- DB[-4, -4] # togliere una cella

DB <- DB[, -c(3,4)] # togliere più colonne
x_t <- select(x_t, ends_with("-A")) # selezionare colonne con condizione

DB[,4] <- lapply(DB[,4], factor) # modificare il tipo di una colonna
DB$REF <- as.integer(DB$REF)  # modificare il tipo di una colonna

x$var1 <- toupper(x$var1) # per rendere maiuscola la stringa
x$var1 <- tolower(x$var1) # per rendere minuscola la stringa










# 11. DIVISION IN TRAIN AND TEST DATASET

library(caret)
set.seed(1234)
split <- createDataPartition(y=data$risposta, p = 0.80, list = FALSE)
data_train <- data[split,]
data_test <- data[-split,]






# INDICE
# 1. CHANGE WORKING DIRECTORY 
# 2. SEE FILES INSIDE A WORKING DIRECTORY
# 3. IMPORT FILE .CSV
#   3.1 Con read.csv
#   3.2 Con readr della libreria readr
#   3.3 Con fread della libreria data.table
#   3.4 Con "import dataset" in alto a destra
#   3.5 Con read.table
#   3.6 Con file.choose()
# 4. IMPORT FILE .XML
# 5. IMPORT FILE .TXT
# 6. IMPORT FILE .JSON















# 1. CHANGE WORKING DIRECTORY (cambiare l'indirizzo sul pc da dove si lavora, e quindi
# da dove si prendono i file/datasets)

setwd("C:/Users/andre/OneDrive/Documenti/tuttooo/R/")


# con il path completo per modificare l'intero path, altrimenti si pu? anche selezionare una
# cartella presente nella cartella attuale aggiungendo solo il nome di quest'ultima

# si pu? anche fare da "Session" --> "Set Working Directory" --> "Choose Directory..."

getwd()      # per ottenere la directory su cui si sta lavorando, si pu? anche assegnare

# ricordarsi di usare sempre / come separatore su Windows

















# 2. SEE FILES INSIDE A WORKING DIRECTORY (vedere i files contenuti nella working directory)

list.files()         # valgono head(), count() e tail() per vedere i primi o gli ultimi 6 files


















# 3. IMPORT FILE .CSV (importare un file in formato .CSV)

path <- "C:/Users/andre/OneDrive/Documenti/tuttooo/R/files/afl_stats.csv"

#    3.1 Con read.csv
#    metodo che funziona meglio con dataset pi? piccoli, metodo meno veloce
#    stringsAsFactors = FALSE per non mettere le stringhe direttamente come fattori
#    header = TRUE per considerare la prima riga come intestazione del dataset
#    sep = "," per indicare la virgola come separatore nel file
#    dec = "." per indicare il carattere per i decimali
#    skip = 0 per il numero di righe da saltare prima di iniziare a leggere i dati
#    nrows = 1000000 per il numero di righe da considerare dall'inizio

dataset <- read.csv(path, stringsAsFactors = FALSE, header = TRUE, sep = ",", 
                    dec = ".", skip = 0, nrows = 1000000)

#    3.2 Con readr della libreria readr
#    pi? veloce di read.csv, pi? lento degli altri metodi

library(readr)
dataset <- read_csv(path)

#    3.3 Con fread della libreria data.table
#    pi? veloce di read.csv e di read_csv

library(data.table)
dataset <- fread(path)


#    3.4 Con "import dataset" in alto a destra (di fianco alla RAM allocata), richiede il formato

#    3.5 Con read.table 

dataset <- read.table(path)


# generalmente, si assegnano; inoltre, spesso si converte as.data.frame() per poi lavorarci

dataset <- as.data.frame(dataset)



#     3.6 Con file.choose()

dataset<-read.table(file.choose())











# 4. IMPORT FILE .XML (importare un file .xml)


# 5. IMPORT FILE .TXT



# 6. IMPORT FILE .JSON

library(jsonlite) 
library("rjson")
library(RJSONIO)

# per importare da json in html
Raw <- fromJSON("https://data.ny.gov/api/views/9a8c-vfzj/rows.json?accessType=DOWNLOAD")


# per un json già impostato come tabella/dataframe

result <- as.data.frame(fromJSON(file = "input.json"))

# per convertire in json da dataframe (o altri tipi di oggetti, come vettori, matrici...)

x <- toJSON(res1)
cat(x)

# per salvare il file creato come file json

write(jsonData, "result.json") 
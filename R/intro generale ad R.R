# INDICE
# 1. GENERAL INTRO
# 2. R AS A CALCULATOR
# 3. ASSIGN VALUES
# 4. REMOVE VALUES
# 5. BOOLEAN AND LOGIC VALUES
# 6. VECTORS
# 7. MATRICES
#    7.1 con la funzione matrix()
#    7.2 come concatenazione di vettori riga
#    7.3 come concatenazione di vettori colonna
# 8. LISTS
# 9. STRINGS
# 10. CONDITIONS AND CYCLES
#    10.1 ciclo IF
#    10.2 ciclo WHILE
#    10.3 ciclo FOR
# 11. FUNCTIONS
# 12. PACKAGES
# 13. DATAFRAMES
# 14. SAVE/LOAD IMAGE
# 15. ARRAY









# 1. GENERAL INTRO (introduzione generale)

# R è un ambiente, gratuito, destinato alla statistica computazionale

# E' un ambiente interattivo, ossia i comandi producono una risposta immediata

# R è case sensitive (lettere maiuscole e minuscole sono diverse tra di loro)

# In R un'analisi è fatta attraverso una serie di passi, con risultati intermedi che 
# sono immagazzinati in oggetti. Rispetto ad altri programmi (SPSS, ecc), fornisce un output 
# minimo.

# Una volta concluso il comando si digita il tasto 'Invio': se il comando è completo, 
# comparirà una nuova riga di comando con il simbolo di prompt (> ); altrimenti comparirà 
# una nuova riga di comando con il simbolo +, ovvero che il comando deve essere completato.

# tutti i valori, dataframe, file salvati sono presenti nel workspace, che si può salvare,
# esportare e importare in altri file. 

# Per accedere all'help di R relativamente ad una particolare funzione, oltre alla finestra 
# in basso a destra, si può fare in diversi modi:

`?`(mean)
help(mean)
example(mean) # mostra un esempio

# per modificare la quantità di RAM allocata ad R (OCCHIO)

memory.size()
memory.limit(size = 10000000)
memory.limit()









# 2. R AS A CALCULATOR (R come calcolatrice)
# R risponde a comandi semplici come operazioni matematiche comportandosi come una 
# calcolatrice

2+2
2-2
2*2
2/2
2^3

# ci sono anche alcune operazioni pi? complesse, come radici, funzioni trigonometriche 
# (seno, coseno, tangente, arcotangente, secante), valore assoluto, l'intero pi? grande,
# l'intero pi? piccolo, un numero senza decimali, un numero arrotondato, il logaritmo base 10,
# il logaritmo naturale, l'esponenziale, pigreco

sqrt(4)


sin(0)
cos(0)
tan(0)
acos(0)
asin(0)
atan(0)
atan2(0,1)

abs(-4)

ceiling(4.6)
floor(4.6)

trunc(21.813)

round(21.184, digits = 0)

log10(100)
log(10)

exp(2)

pi

# ci sono anche le versioni con gi? compreso il pi greco
cospi(1)
sinpi(0)
tanpi(1/3)

# permette di fare operazioni su pi? numeri, come massimo, minimo

max(1,4,6)
min(1,4,6)

# le funzioni possono anche essere abbinate fra loro in sequenza

sin(sqrt(4))

# ci sono anche funzioni statistiche, come il fattoriale, il coefficiente binomiale,
# funzioni come la gamma, la beta

factorial(3)

choose(5,2)

gamma(4)

beta(4,3)

# ci sono anche delle distribuzioni statistiche, come la normale

set.seed(1234)
z <- rnorm(1000, mean = 0, sd = 1)   # per creare 1000 determinazioni della distribuzione
d <- dnorm(1000, mean = 0, sd = 1)   # per creare 1000 valori della densità di distribuzione
qnorm(0.7, mean = 0, sd = 1)  # per calcolare il quantile della distribuzione
pnorm(1000, mean = 0, sd = 1)  # per calcolare la distribuzione cumulata ad un punto

require(mvtnorm)
sigma1 <- matrix(c(3,2,2,3), ncol=2)
x <- rmvnorm(1000, mean=c(0,0), sigma=sigma1) # per una normale bivariata

# in caso di numeri troppo elevati R riporta infinito come risultato

100^1000

# quando un'espressione non restituisce un risultato, da come output NaN, "Not a Number"

log(-1)

# invece numeri grandi ma non grandissimi vengono spesso definiti con notazione scientifica

10^9














# 3. ASSIGN VALUES (assegnare valori)
# un valore pu? essere assegnato con un nome particolare, in modo che questo possa essere
# richiamato, utilizzato in altri passaggi, modificato, aggiunto a dataframe...

a <- 1

# un valore salvato pu? essere richiamato semplicemente scrivendo il nome a cui ? assegnato

a

# per sapere di che tipo ? un oggetto, utilizziamo il comando typeof(), o il comando class

typeof(a)
class(a)

# Per vedere cosa contiene un oggetto, si pu? usare anche il comando attributes()

attributes(a)
















# 4. REMOVE VALUES (rimuovere valori)
# per rimuovere un valore (operazione non annullabile), basta usare rm(a)

rm(a)
remove(x)

# si possono anche rimuovere pi? valori per volta

a <- 2
b <- 3

rm(a,b)

# per rimuovere tutti gli oggetti (operazione non annullabile), si fa cos?

rm(list=ls())

# per rimuovere tutti gli oggetti (operazione non annullabile) con condizione, si fa cos?

rm(list=ls(pattern='ciao'))         # solo le cose che contengono ciao














# 5. BOOLEAN AND LOGIC VALUES (valori booleani)
# in alcuni casi possiamo avere la necessit? di utilizzare valori booleani, con output
# TRUE (paragonato al valore 1) o FALSE (paragonato al valore 0), per verificare condizioni 
# particolari

x <- 5
x < 0

# questi si ottengono spesso con le condizioni logiche, come maggiore, minore,
# diverso, maggiore o uguale, minore o uguale, uguale

x > 1
x < 1
x >= 1
x <= 1
x != 1
x == 1

# oppure ci possono essere condizioni logiche, come e, o (almeno una dei due)

x > 1 & x < 7
x > 1 | x < 7

# tutte queste si possono usare per variabili, stringhe, numeri, oggetti...

"ciao" == "cia"
c("ciao", 2, x) == c("ciao", 4, 5)

















# 6. VECTORS (vettori)
# un vettore ? una stringa di valori ordinati (concetto diverso dall'algebra lineare), hanno 
# una sola dimensione. 

# i vettori corrispondenti a variabili nominali sono di classe factor

x <- c(1,44.2, a, "ciao")
class(x)

# si possono creare vettori formati da valori consecutivi
x2 <- seq(1,11,by = 2)                   # sequenza di numeri da 1 a 11 ogni 2
x3 <- seq(1,12, length.out = 4)     # sequenza di 4 numeri da 1 a 11
x4 <- rep(10,6)                     # sequenza di 10 scritto 6 volte
x5 <- rep(seq(1, 5), times = 5)     # sequenza da 1 a 5, ripetuta tutta insieme 5 volte
x6 <- rep(0:4, each = 5)            # sequenza da 0 a 4, ripetuti di seguito, 5 volte ognuno

# si possono richiamare i singoli elementi di un vettore (primo elemento 1), o comunque
# alcuni elementi di un vettore, o elementi con una condizione particolare
x2[2]
x2[c(2,4)]
x2[seq(1,4)]
x2[x2>6]

# si pu? modificare uno o pi? elementi di un vettore, o aggiungerne, o toglierne, o trovare

x2[4] <- "ciao"
x2
x2[x2>6] <- 0
x2
x2[7] <- "boh"
x2
x2 <- x2[-7]
x2
x2[x2==1]


# si possono fare operazioni tra vettori: somma di vettori (stessa lunghezza o multiplo!!!), 
# differenza di vettori (stessa lunghezza o multipo!!!), prodotto di vettori (stessa 
# lunghezza o multiplo!!!), prodotto di un vettore per uno scalare

x2 <- seq(1,11,2)
x3 <- seq(3,13,2)

x2+x3
x2-x3
x2*x3
x2*3
x3/x2

# si possono ordinare gli elementi in un vettore di numeri, in ordine crescente o decrescente

x <- c(1,5,4,10,7)
x
sort(x, decreasing = FALSE)

# si possono fare alcune operazioni sui vettori, come la lunghezza (numero di elementi), la
# lunghezza con condizione, la somma, la somma cumulata, il prodotto, il prodotto cumulato, 
# massimo e minimo, il range di valori, la posizione in base a condizione, la posizione del 
# massimo e del minimo

length(x)                 # non fattibile con vettori di stringhe
length(x[x>0])

sum(x)
cumsum(x)
prod(x)
cumprod(x)

min(x)
max(x)

range(x)

which(x>0)
which.max(x)
which.min(x)

# si possono assegnare valori come factor in questo modo

Eta <- c("giovani", "adulti", "anziani")
Eta <- factor(Eta)

# si possono anche assegnare etichette ai fattori

fattore1 <- c(1, 4, 3, 3, 2)
fattore1 <- factor(fattore1)
levels(fattore1) <- c("A","C","D","B")

# si possono anche mettere vettori come factor con un ordine

Eta <- ordered (Eta , levels = c("giovani", "adulti", "anziani"))

















# 7. MATRICES (matrici)
# una matrice ? una collezione di elementi distribuiti in righe e colonne.
# in r possono essere definite in diversi modi:

#    7.1 con la funzione matrix()
# nrow e ncol definiscono rispettivamente numero di righe e di colonne
# con byrow = FALSE (o non specificato) valori in ordine per ogni intera colonna 
# da sinistra a destra, dall'alto al basso

A <- matrix(c(5, 1, 2, 4), nrow = 2, ncol = 2, byrow = FALSE)
B <- matrix(c(5, 1, 4, 2, 4, 7, 2, 4, 6), nrow = 3, ncol = 3, byrow = FALSE)
B_2 <- matrix (1:10, ncol=5)

#    7.2 come concatenazione di vettori riga

x_row <- matrix(c(1, 10, 3, 5), nrow = 1)
C <- rbind(x_row, x_row)

#    7.3 come concatenazione di vettori colonna

x_col <- matrix(c(1, 10, 3, 5), ncol = 1)
D <- cbind(x_col, x_col, x_col)

# una matrice colonna ? una matrice formata da un solo vettore colonna

x_col <- matrix(c(1, 10, 3, 5), ncol = 1)

# una matrice riga ? una matrice formata da un solo vettore riga
# simile al comando c(), ma con c() non fa calcolare le dimensioni con dim
x_row <- matrix(c(1, 10, 3, 5), nrow = 1)

# come per i vettori si possono estrarre valori particolari: cella/e, colonna/e o riga/e
B[1, 2] # Estrazione di elemento in posizione (1,2)
B[, 2] # Estrazione seconda colonna
B[c(1,2), ] # Estrazione prima e seconda riga
B[,-3] # Estrazione tutte tranne la terza colonna

# si possono fare alcune operazioni, come vedere le dimensioni, estrarre la diagonale, 
# calcolare la matrice trasposta, calcolare la somma di tutti gli elementi, il crossproduct
# o prodotto incrociato di due matrici, il prodotto tra matrici compatibili, la matrice
# inversa, il determinante, la somma delle righe o la somma delle colonne; o anche le operazioni 
# matematiche base (esponenziale, logaritmo, radici, prodotto con scalare), o le scomposizioni 
# di matrici (Cholesky, QR, spettrale)

dim(B)
diag(B)
t(B)
sum(B)
crossprod(x_col, x_col)
A %*% A
solve(A)
det(A)
rowSums(B_2)
colSums(B_2)

2*log(B)

chol(A)
qr(A)
eigen(A) # values sono gli eigenvalues (quanti eigen diversi da zero, tanto è il rank della matrice) 
         # la somma degli eigenvalues è pari alla traccia della matrice (somma diagonale principale)
         # ha elementi $values e $vectors














# 8. LISTS (liste)
# una lista ? una collezione di oggetti

lista <- list(A = matrix(c(4, 1, 1, 8), ncol = 2), x = c(1, 2, 6, 6, 9), 30, "ciao")

# come al solito si possono richiamare gli elementi nella lista

lista[[2]]
lista[c(2,4)]
lista[c(-1)]
lista$A

# si possono cambiare i nomi dei singoli elementi che fanno parte della lista col comando

names(lista) <- c("uno","due","tre","quattro")

# si possono aggiungere nuovi elementi, modificarne alcuni esistenti, o cancellarne alcuni

lista[5] <- "New element"
lista[5] <- NULL
lista[4] <- "updated element"

# si possono unire gli elementi di due liste con la concatenazione c()

listona <- c(lista, lista)

# si pu? anche convertire una lista in vettore
vettore <- unlist(lista)















# 9. STRINGS
# Le stringhe sono oggetti che contengono più caratteri alfanumerici. Possono essere 
# manipolate in modi differenti
a <- "ciao come va"
a

nchar(a) # lunghezza stringa (compresi gli spazi)
library(stringr)
str_length(c("a", "R for data science", NA)) # lunghezze più stringhe

substr("abcdef", 2, 4) # ottenere una sottostringa di una stringa, con inizio e fine definiti
library(stringr)
str_sub("abcdef", 2, 4) # ottenere una sottostringa di una stringa, con inizio e fine definiti

gsub("cd", "dc", "abcdef") # sostituire una parte (1°) della stringa (3°)con un'altra stringa (2°)
sub("cd", "dc", "abcdef") # sostituire una parte (1°) della stringa (3°)con un'altra stringa (2°)

grep("cd", "abcdef") # trova la prima occorrenza di una parte di stringa (1°) in una stringa (2°)
grepl("cd", "abcdef") # trova se c'è un'occorrenza di una parte di stringa (1°) in una stringa (2°)

strsplit("abcdef", "c") # divide una stringa (1°) in base ad uno o più caratteri dati (2°)
library(stringr)
str_split("MiXeD cAsE 123", " ") # divide una stringa (1°) in base ad uno o più caratteri dati (2°)

paste0(1:5, " ", "ciao") # stampa un risultato come stringa; di solito per concatenare stringhe
paste(1:12) # uguale a paste0

toupper("ciao") # rende tutto maiuscolo
tolower("CIAO") # rende tutto minuscolo
library(stringr)
str_to_upper("ciao") # rende tutto maiuscolo
str_to_lower("CIAO") # rende tutto minuscolo

str_to_title("ciao come va") # tutte le iniziali maiuscole
str_to_sentence("ciao come va? tutto bene") # tutte le iniziali di frase maiuscole

str_trim(" ciao come va  ") # elimina gli spazi ad inizio o fine stringa
str_squish(" ciao   come    va  ") # elimina gli spazi ad inizio, fine stringa e i ripetuti in mezzo

str_pad("Mela", 10, side = "both", pad = "-") # completa la stringa con caratteri (in pad )aggiunti ad 
                                              # inizio e/o fine (con side)

chartr("iXs", "why", "MiXeD cAsE 123") # sostituisce i primi caratteri da trovare (1°) con (2°) in (3°)
casefold("MiXeD cAsE 123", upper = TRUE) # per rendere tutto maiuscolo (con TRUE)/minuscolo (con FALSE)

sprintf("%s is %f feet tall\n", "Sven", 7.1) # per rendere la formattazione più semplice e veloce

library(stringr)
str_c("x", "y", "z", sep = ", ") # per combinare più stringhe (separatore facoltativo)

library(stringr)
str_sort(c("apple", "eggplant", "banana")) # per ordinare diverse stringhe in ordine alfabetico

library(stringr)
str_detect(c("apple", "eggplant", "banana"), "an") # vedere dove c'è una corrispondenza di caratteri

library(stringr)
str_count(c("apple", "eggplant", "banana"), "a") # contare le occorrenze di caratteri in una stringa















# 10. CONDITIONS AND CYCLES (condizioni e cicli)
# si possono creare cicli per verificare condizioni o eseguire linee di comando molte volte
# si possono inserire cicli all'intero di altri cicli (IF dentro FOR...)


#    10.1 ciclo IF
# L'istruzione di controllo IF consente di svolgere una determinata operazione solamente
# se una certa condizione ? verificata (TRUE/FALSE).
# L'istruzione di controllo (facoltativa) ELSE consente di svolgere un'operazione
# alternativa se la precedente condizione non ? verificata.
x <- 3
if(x<2) {
  ... # linee di codice
  } else {
  ... # linee di codice
  }

#    10.2 ciclo WHILE
# Il ciclo WHILE permettere di eseguire il codice dentro le graffe numerose volte, al
# verificarsi della condizione data

i <- 1
while (i < 10) {
  ... # linee di codice
  i <- i + 1 # incremento di i
}

# in questi casi  bisogna porre attenzione a non creare cicli infiniti che non terminano

#    10.3 ciclo FOR
# Il ciclo FOR, simile al WHILE, permettere di eseguire il codice dentro le graffe 
# numerose volte, al verificarsi della condizione data

vettore <- seq(0,50,5)
for (i in values) {
  ... #linee di codice da ripetere
}
  
# i cicli FOR tendono ad essere lenti in R, spesso possono essere sostituiti dall'uso
# della famiglia di funzioni *APPLY














# 11. FUNCTIONS (funzioni)
# R essendo un linguaggio di programmazione, prevede la definizione di funzioni, ovvero il
# caricamento di funzioni pre-esistenti (tutti i comandi) e la creazione di nuove funzioni.
# si pu? definire il nome della funzione, i parametri e l'output con return(out)
# se un parametro ha un valore predefinito, quando non indicato rimane quello.
# l'ordine degli argomenti ? importante solo per quelli che si possono non specificare
# si possono anche annidare funzioni una all'interno delle altre
# una funzione in R riporta un solo valore, se ne servono di pi? bisogna fare return con
# oggetti che contengono pi? valori (liste, dataframe, vettori...)


nome_funzione <- function(param1, param2 = 3) {
  out <- param1^3 + param2
  return(out)
}

nome_funzione(1,2)

# per verificare il tipo di un oggetto come una funzione, si esegue
class(nome_funzione)      # restituisce 'function'

# se vogliamo vedere gli argomenti di una funzione, ? sufficiente il seguente comando
args(nome_funzione)
str(nome_funzione)
















# 12. PACKAGES (pacchetti)
# R ? organizzato in pacchetti, al cui interno troviamo gruppi di funzioni diversi in 
# base alla nostra necessit?
# Si possono richiamare col seguente comando
library(nome_pacchetto)

# per sapere quali librerie sono installate, basta il seguente comando

library()

# Se un pacchetto non ? presente nel computer ? necessario installarlo.
# Si pu? usare la finestra "Packages" o il comando seguente, e poi successivamente
# chiamarlo con library()

install.packages("nome_pacchetto")

# possono esserci delle funzioni che richiedono altre funzioni per essere installate, in
# generale nel caso richiede lui e basta confermare

# ogni tanto pu? essere necessario fare l'aggiornamento dei pacchetti scaricati

update.packages("nome_pacchetto")

# per caricare l'help del pacchetto, si pu? usare il seguente comando

help("nome_pacchetto")
$$nome_pacchetto

# per sapere dove sono installati nel pc i file di un pacchetto

system.file(package = "nome_pacchetto")

# per rimuovere un pacchetto dal sistema (crea conflitti con altri pacchetti magari)

remove.packages("nome_pacchetto")

















# 13. DATAFRAMES
# Un oggetto R chiamato data.frame corrisponde alla matrice dei dati.
# Un data.frame assomiglia ad una matrice, ma ? pensato per l'analisi dei dati.
# Ad esempio, un data.frame pu? contenere anche valori non numerici, come per
# esempio le variabili qualitative o valori mancanti.

# Il modo pi? frequente di caricare un dataset in memoria ? importarlo da un file esterno.
# Se i dati hanno dimensioni piccole/medie (dimensione file < 3-4 Gb), sono spesso
# salvati in formato .csv oppure .txt, ma ? possibile importare i dati a partire da
# database relazionali come SQL.

# nell'ambiente un dataframe viene trattato come una lista.















# 14. SAVE/LOAD IMAGE

# si possono salvare tutti gli oggetti, funzioni, dataset creati in una sessione di lavoro,
# per ricaricarli un domani. 

save.image("C :://.../myfile.RData")
load("C :://.../myfile.RData")

# per avere un'idea di tutto quello che ? presente nell'immagine di lavoro, c'? il comando

ls()

# per cercare all'interno dell'immagine solo una parte di file, si fa cos?

ls(pattern='ciao')              # solo le cose che contengono ciao


















# 15. ARRAY
# gli array sono estensioni delle matrici, (un array 3*4*2 sono due matrici 3*4)
# 

a <-  array(1:24, dim =c(3,4,2))
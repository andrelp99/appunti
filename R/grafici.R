# INDICE
# 1. SIMPLE FUNCTION GRAPH
# 2. ISTOGRAMS
# 3. SCATTERPLOT
#    3.1 con la funzione ggplot
#    3.2 con la funzione plot
#    3.3 3d scatterplot
#    3.4 matrice scatterplot
# 4.  BAR CHART
#    4.1 con la funzione ggplot
#    4.2 con la funzione barplot
# 5. CONTOUR PLOT 
# 6. CORRELOGRAMMA
#    6.1 con la funzione corrplot
#    6.2 con la funzione ggcorr
#    6.3 con la funzione ellipse
#    6.4 con la funzione car
# 7. BOXPLOT
#    7.1 con la funzione boxplot
#    7.2 con la funzione geom_boxplot
# 8. VIOLIN PLOT
#    8.1 con la funzione geom_violin
#    8.2 con la funzione vioplot
# 9. DENSITY PLOT
# 10. HEATMAP
#    10.1 con la funzione heatmap
#    10.2 con la funzione geom_tile
#    10.3 con la funzione geom_tile, ggplotly e saveWidget per renderla interattiva
#    10.4 con la funzione levelplot
# 11. BUBBLE PLOT
#    11.1 con la funzione geom_point
#    11.2 con la funzione geom_point, ggplotly e saveWidget per renderla interattiva
# 12. DENDROGRAM
#    12.1 dendrogramma per dataset gerarchici
#    12.2 dendrogramma relativo a risultati di clustering
# 13. LOLLIPOP PLOT
# 14. DOUGHNUT PLOT
# 15. SPIDER/RADAR CHART
#    15.1 con un solo gruppo
#    15.2 con più gruppi
# 16. WORDCLOUD       (DA FARE)
# 17. CIRCULAR BARPLOT          (DA FARE)
# 18. TREEMAP
# 19. PIE PLOT
#    19.1 con la funzione pie
#    19.2 con la funzione coord_polar
# 20. LINE PLOT       (DA FARE)
# 21. MAPS          (DA FARE)






# 1.  SIMPLE FUNCTION GRAPH (semplici grafici di funzioni)
# si possono disegnare semplici grafici di funzioni con il comando curve
# from = 0 e to = 15 definiscono il dominio
# n = 30 definisce il numero di punti in cui visualizzare la funzione
# xlim = c(0,30) definisce l'intervallo di x in cui viene visualizzata la funzione
# ylim = c(0,30) definisce l'intervallo di y in cui viene visualizzata la funzione
# con xlab e ylab si definiscono i nomi degli assi
# con main si definisce il titolo


curve( (x^2)/ sin(x), from = 0, to = 15, n = 30, xlim = c(0,30), ylim = c(-200,+200),
       xlab = "prova", ylab = "boh", main = "titolo")



# Si possono anche mettere più grafici nella stessa schermata con la funzione:

par(mfrow=c(2,3)) # il primo n° sono le righe, il secondo le colonne

# si possono anche cambiare i margini della figura:

par(mar=c(5.1, 4.1, 4.1, 2.1)) # questi sono i valori default (sotto, sinistra, sopra, destra)
    
# si può cambiare anche il verso delle scritte in un grafico

par(las = 0) # 0 paralleli all'asse (default), 1 orizzontali, 2 perpendicolari all'asse, 3 verticali


# si possono mettere più grafici insieme anche così:
library(gridExtra)
grid.arrange(plot1, plot2, plot3, plot4, ncol=2, nrow = 2)


# si possono aprire i grafici in finestra esterna con

windows()

# si possono salvare i plot creati con ggplot vari con
ggsave("C:/Users/andre/Desktop/stage/definitivo/figure_definitive/UMAP_DBSCAN.jpeg", width = 12, height = 12, dpi = 300 )








# 2.  ISTOGRAMS (istogrammi)
# L'istogramma consente di rappresentare graficamente una distribuzione di frequenza.
# La base dei rettangoli rappresenta la lunghezza degli intervalli
# L'altezza dei rettangoli rappresenta le frequenze assolute

setwd("C:/Users/andre/OneDrive/Documenti/tuttooo/R/")
path <- "C:/Users/andre/OneDrive/Documenti/tuttooo/R/files/afl_stats.csv"
dataset <- read.csv(path, header = TRUE, sep = ",", dec = ".")
dataset <- as.data.frame(dataset)

hist(dataset$Height,
     freq = TRUE, # vengono usate le frequenze, non la densit? (default TRUE)
     breaks = 10,  # Utilizzo 10 sotto-intervalli
     right = FALSE, # intervalli left-open (col >=)(default TRUE)
     col = "green", # colore dei rettangoli (default NULL)
     border = "red", # colore dei bordi dei rettangoli (default NULL)
     axes = TRUE, # se vengono stampati o no gli assi (default TRUE)
     labels = TRUE, # stampa le frequenze sopra i rettangoli (default FALSE)
     main = "Istogramma di ...",  # titolo
     xlab = "Altezza",   # nome variabile
     ylab = "Frequenze assolute"  # (o densit? se freq = FALSE)
)


# breaks possono essere definiti in modi diversi:
# - con il numero di rettangoli richiesti (breaks = 6)
# - con i valori definiti in un vettore (breask = c(10,20,40,50))
# - con metodi predefiniti (breaks = "Sturges" per il default, breaks = "Scott", breaks = 
# "Freedman-Diaconis")
# - con una sequenza di valori (breaks = seq(10,30,3))


# se assegnata, ritorna una serie di valori, tra cui: $breaks (i valori a cui cambia barra),
# $counts (le frequenze assolute di ogni rettangolo), $density (la densità di ogni 
# rettangolo), $mids (i valori medi di ogni rettangolo), $xname (il nome della variabile), 
# $equidist (valore logico, TRUE se le barre sono a pari distanza)















# 3. SCATTERPLOT
# Uno scatterplot (grafico a dispersione in italiano) è un grafico con tanti punti in un
# sistema cartesiano con due coordinate.
# Può essere utilizzato per vedere il valore della correlazione tra variabili (positiva, 
# negativa o nulla), per vedere la forma di questa correlazione (lineare, esponenziale, ad 
# U), per vedere gruppi all'interno del dataset, per trovare outliers... 

# Ci sono diversi modi per fare bar charts:

#    3.1 con la funzione ggplot
# Prima bisogna richiamare la funzione ggplot
# Si può personalizzare con diverse opzioni aggiunte col + dopo il ggplot

# In ggplot si definisce il dataset, nell'aes dentro ggplot si definisce la variabile 
# su ascisse e su ordinate

library(ggplot2)
ggplot(dataset, aes(x=Height, y=Weight))+
        geom_point(size=2, shape=3, color = "blue") # definisce i punti nel grafico: 
                                    # size per dimensione punti, shape per forma punti, 
                                    # color per il colore, 


ggplot(dataset, aes(Height, Weight))+ 
        geom_point(aes(size=Kicks)) # definisce i punti nel grafico: dimensione in base 
                                    # ad una variabile


ggplot(dataset, aes(Height, Weight))+ 
        geom_point()  + 
        geom_text(label=dataset$Player) # col valore della variabile scritto sotto ogni
                                        # punto dello scatterplot; si possono definire
                                        # alcuni valori, come size (dimensione), font (1 ?
                                        # default, 2 grassetto, 3 corsivo, 4 grassetto e 
                                        # corsivo), family (famiglia del font, come Times 
                                        # New Roman), e alcune in base al gruppo con aes:
                                        # colour (colore), size (dimensione)


library(ggrepel)
set.seed(42)
dataset1 <- dataset[c(1:10),]
ggplot(dataset1, aes(Height, Weight))+ 
        geom_point()  + 
        geom_text_repel(label=dataset1$Player) # uguale a geom_text ma con testo non sopra
                                              # i rispettivi punti del grafico      


ggplot(dataset1, aes(Height, Weight))+ 
        geom_point()  + 
        geom_label(label=dataset$Player) # uguale a geom_text, ma con contorno


library(ggrepel)
set.seed(42)
dataset1 <- dataset[c(1:10),]
ggplot(dataset1, aes(Height, Weight))+ 
        geom_point()  + 
        geom_label_repel(label=dataset1$Player) # uguale a geom_label ma con testo non 
                                                # sopra i rispettivi punti del grafico


library(ggrepel)
set.seed(42)
dataset1 <- dataset[c(1:10),]
ggplot(dataset1, aes(Height, Weight))+ 
        geom_point()  + 
        geom_label_repel(aes(label=dataset1$Player, fill=factor(Position)))+
        theme(legend.position = "bottom")
# si possono anche colorare le barre in base ad una variabile, mettendo tutto in aes


ggplot(dataset, aes(Height, Weight))+ 
        geom_point()  +
        geom_smooth(method="lm", se=TRUE, fullrange=TRUE, level=0.95, color = "red", size=2, 
                    linetype="dashed")
# Con geom_smooth aggiungiamo la regressione. Alcuni valori da poter definire:
# - method: si possono usare lm, glm, gam, loess, rlm, auto (uguale a gam, default). 
# - se: se uguale a TRUE, fa vedere l'intervallo di confidenza
# - fullrange: se uguale a TRUE la regressione è larga come l'intero grafico
# - level: il livello dell'intervallo di confidenza da usare, default 0.95
# - color: colore, stringhe in inglese
# - size: spessore della linea
# - linetype: formato della linea, con stringhe come solid (continuo), twodash (punto linea),
#   longdash (tratteggiato lungo), dashed (tratteggiato), dotted (a punti), blank (vuoto), 
#   dotdash (punto linea leggero)


ggplot(dataset, aes(Height, Weight))+ 
        geom_point()  +
        geom_hline(yintercept=100, linetype="dashed", color = "red", size=2)
# con geom_hline invece si aggiunge una riga orizzontale in prossimità di un valore preciso:
# si può personalizzare con color (colore), linetype (linea continua, tratteggiata), size 
# (dimensione)...


ggplot(dataset, aes(Height, Weight))+ 
        geom_point()  +
        geom_vline(xintercept=100, linetype="dashed", color = "red", size=2)
# con geom_vline invece si aggiunge una riga verticale in prossimità di un valore preciso:
# si può personalizzare con color (colore), linetype (linea continua, tratteggiata), size 
# (dimensione)...


ggplot(dataset, aes(Height, Weight))+ 
        geom_point()  +
        geom_abline(intercept=100, slope=5, linetype="dashed", color = "red", size=2)
# con geom_abline invece si aggiunge una riga con intercetta e pendenza: si può 
# personalizzare con color (colore), linetype (linea continua, tratteggiata), size 
# (dimensione)...


ggplot(dataset, aes(Height, Weight))+ 
        geom_point()  +
        geom_segment(aes(x = 5, y = 30, xend = 3.5, yend = 25), linetype="dashed", 
                     color = "red", size=2, arrow = arrow(length = unit(0.5, "cm")))
# con geom_segment invece si aggiunge un segmento con coordinate di inizio e fine (in aes): 
# si può personalizzare con color (colore), linetype (linea continua, tratteggiata), size 
# (dimensione)...
# gli si può aggiungere una freccia con la parte di arrow


ggplot(dataset, aes(Height, Weight))+ 
        geom_point()  +
        geom_text(x=3, y=30, label="Scatter plot", color="red")
# con geom_text possiamo aggiungere testo in un punto particolare del grafico, e si può 
# personalizzare con opzioni come color, size, font, fontface


ggplot(dataset, aes(Height, Weight))+ 
        geom_point()  +
        annotate(geom="text", x=3, y=30, label="Scatter plot", color="red")
# anche con annotate aggiungiamo testo in un punto particolare del grafico



# modificando l'aes in ggplot si aggiunge una distinzione in base ad una terza variabile
ggplot(dataset1, aes(Height, Weight, colour=Position))+ 
        geom_point()
# questa distinzione si può fare per colore (colour), o per forma (shape), o per dimensione
# (size)


dataset2 <- dataset[c(1:1000),]
ggplot(dataset2, aes(Height, Weight, colour=Position))+ 
        geom_point()+ 
        geom_smooth(method=lm, aes(fill=Position))
# si possono aggiungere anche le singole regressioni per ogni gruppo


ggplot(dataset1, aes(Height, Weight, colour=Position))+ 
        geom_point()+
        scale_size_manual(values=c(3, 5, 7, 9))+  
        scale_shape_manual(values=c(3, 16, 17, 2))+ 
        scale_color_manual(values=c('red','blue', 'green', 'yellow'))+
        theme(legend.position="top")
# si possono aggiungere anche modificare forma, colore e dimensione manualmente 
# per ogni gruppo
# con theme(...) definiamo la legenda, e la posizione sopra/sotto/di lato al grafico

ggplot(dataset2, aes(Height, Weight, colour=Position))+ 
        geom_point()+
        scale_color_grey()
# Possiamo definire scale colore predefinite, con colori definiti nel RColorBrewer package.


ggplot(dataset2, aes(Height, Weight, colour=Position))+ 
        geom_point()+
        geom_rug()
# si possono aggiungere linee in corrispondenza dei valori sugli assi.


ggplot(dataset2, aes(Height, Weight, colour=Position))+ 
        geom_point()+
        labs(title="titolo", x="ascissa", y = "ordinata")
# si possono modificare i nomi del titolo e degli assi



#    3.2 con la funzione plot

plot(x=dataset2$Height,y=dataset2$Weight, type='p', main = "titolo", sub = "My subtitle", 
     xlab = "ascisse", ylab = "ordinata", pch=21, bg = "blue", col = "red", lwd = 3, 
     axes = TRUE, xaxt = "n", yaxt = "n", las = 0, #xlim = c(130,200), ylim = c(70,100), 
     col.main = "green", col.lab = "blue", col.axis = "green", fg = "orange")
axis(1, at = 130:200)
axis(2, at = seq(80,100,4))
library(Hmisc)
minor.tick(nx = 3, ny = 3, tick.ratio = 0.5)

# con i seguenti parametri:
# - x: variabile x
# - y: variabile y
# - type: forma dei punti (p per punti, l per linee, b oppure o per entrambi, h per la
#   densità, s per i gradini)
# - main: titolo grafico 
# - sub: sottotitolo
# - xlab: nome variabile in ascisse
# - ylab: nome variabile in ordinate
# - pch: tipo di forma dei punti
# - bg: colore interno
# - col: colore bordi
# - lwd: spessore punti
# - xaxt: per rimuovere i tick sull'asse x (con 'n')
# - yaxt: per rimouvere i tick sull'asse y (con 'n')
# - las: per definire l'inclinazione delle scritte sugli assi (0 default, 1 orizzontali, 2
#   perpendicolari agli assi, 3 verticali)
# - xlim: limite asse x
# - ylim: limite asse y
# - col.main: colore titolo
# - col.lab: colore nome assi
# - col.axis: colore tick assi
# - fg: colore assi
# - axes: se FALSE toglie gli assi; i due axis successivi sono facoltativi se si vogliono 
#   mettere assi solo per alcuni valori particolari (senza at, fa l'intero asse) e con 
#   intervalli particolari
# - minor.tick: per mettere lineette più piccole sugli assi; nx per il numero di intervalli
#   in cui dividere l'area tra i tick maggiori sull'asse x, ny per la stessa cosa sull'asse
#   y, tick.ratio per la frazione di tick minori rispetto ai maggiori

# al plot, all'interno del grafico, si possono aggiungere altre linee o funzioni (con le opzioni
# simili a quelle viste in plot, come lwd, col...):
# - con lines aggiungiamo delle linee, o continue o spezzate; 
# - con curve aggiungiamo delle curve in base alla funzione data;
# - con points aggiungiamo dei punti nel grafico;
# - con abline aggiungiamo un'intercetta, con valore di a per l'intercetta e b come pendenza;

plot(x, y)
lines(x, y, type='s', lwd=2, col="red")
curve(sin, from = 0, to = 6 * pi)
points(2,0)
abline(0,0.05)


# 3.3  3D scatterplot
# Si può anche fare uno scatterplot 3D, per funzioni bivariate

require(mvtnorm)
x1 <- x2 <- seq(-10, 10, length = 51)
sigma1 <- matrix(c(3,2,2,3), ncol=2)
dens <- matrix(dmvnorm(expand.grid(x1, x2), sigma = sigma1), ncol = length(x1))

require("scatterplot3d")

s3d <- scatterplot3d(x1, x2, seq(min(dens), max(dens), length = length(x1)), 
                     type = "n", grid = FALSE, angle = 70, zlab = expression(f(x[1], x[2])),
                     xlab = expression(x[1]), ylab = expression(x[2]),
                     main = "Distribuzione Normale Bivariata N(0,0,3,3,2)")
for(i in length(x1):1){s3d$points3d(rep(x1[i], length(x2)), x2, dens[i,], type = "l", col="red")}
for(i in length(x2):1){s3d$points3d(x1, rep(x2[i], length(x1)), dens[,i], type = "l", col="red")}


#    3.4 matrice scatterplot

# Si può ottenere la matrice di scatterplot che mostra ogni coppia 1v1 delle varie variabili di un dataset
pairs(ratings,
      panel = panel.smooth, # per aggiungere la linea di trend
      main = "Scatterplot matrix ",
      col = "red", # cambiare il colore dei punti
      pch = 18, # cambiare la dimensione dei punti
      )

# Si possono anche ottenere i pairs panels raggruppati in base ad una variabile definita  

group[data$x1 < 0.5] <- 1
group[data$x1 >= 0.5] <- 2

pairs(data[ , 1:3],
      col = c("red", "blue")[group],   # cambio colore by group
      pch = c(8, 18)[group],       # cambio punti by group
      labels = c("var1", "var2"))

# Si può fare la stessa cosa anche con ggpairs: oltre allo scatterplot (boxplot se fattoriale, barplot se 
# categorica), viene mostrata anche la correlazione e un istogramma per le singole distribuzioni.

library("ggplot2")                     
library("GGally") 
ggpairs(data,
        columns = 1:4, # per selezionare solo alcune colonne
        lower = list(continuous = "smooth"), # per aggiungere la smoothed line sugli scatterplot
        diag = list(continuous = "blankDiag"), # per escludere la diagonale principale 
        )














# 4.  BAR CHART
# Rispetto agli istogrammi, la differenza principale sta nel fatto che rappresentano 
# variabili categoriche, invece che numeriche (giorni della settimana, mesi, colori...). 

# Ci sono diversi modi per fare bar charts:

#    4.1 con la funzione ggplot
# Prima bisogna richiamare la funzione ggplot
# Si può personalizzare con diverse opzioni aggiunte col + dopo il ggplot

data <- data.frame(name=c("A","B","C","D","E") ,  value=c(3,12,5,18,45))
library(ggplot2)

ggplot(data, aes(x=name, y=value)) + 
  geom_bar(stat = "identity",
           width=0.2)+  # per definire la larghezza delle barre
  scale_fill_manual(values = c("red", "green", "blue") ) + # per definire manualmente i colori
  scale_fill_grey(start = 0.25, end = 0.75) + # per definire scala colori di grigi
  scale_fill_brewer(palette = "Set1") + # per definire i colori
  scale_fill_hue(c = 40) + # per definire i colori
  coord_flip()+ # per girare orizzontalmente
  geom_errorbar(aes(x=name, ymin=value-1, ymax=value+1), width=0.4, alpha=0.9, size=1.3) # per errori

#    4.2 con la funzione barplot

barplot(height=data$value, names=data$name,
        border="black", # colore bordi
        col="red", # colori dentro barre
        xlab="categories", ylab="values", main="My title", 
        horiz=T, # barplot con barre in orizzontale
        las=1, # orientamento scritte (0 parallele assi, 1 orizzontali, 2 perpendicolari assi, 3 verticali)
        space=c(0.1,0.2,3,1.5,0.3), # spazio tra le varie barre
        width=c(0.1,0.2,3,1.5,0.3), # larghezza diverse barre
        names.arg=c("group1","group2","group3","group4","group5"), # nomi gruppi
        font.axis=2, col.axis="orange", cex.axis=1.5 # personalizzazione scritte assi
        ) 
text(my_bar, data$average+0.4 , paste("n: ", data$number, sep="") ,cex=1) # per aggiungere n° obs












# 5.  Contour Plot
# In caso di grafici 3D, si possono visualizzare i livelli a cui vedere una distribuzione (in pratica,
# l'intersezione del grafico 3D con delle proiezioni ortogonali orizzontali)

require(mvtnorm)
x1 <- x2 <- seq(-10, 10, length = 51)
sigma1 <- matrix(c(3,2,2,3), ncol=2)
dens <- matrix(dmvnorm(expand.grid(x1, x2), sigma = sigma1), ncol = length(x1))
contour(x1, x2, dens, main = "Livelli della N(0,0,3,3,2)", col="blue", xlab = "x1", ylab = "x2")

# dall'ellisse che si ricava si possono apprendere alcune informazioni: in particolare,
# dall'orientamento dell'ellisse (per associazioni positive/negative delle variabili), dal centro 
# e dalla lunghezza dei due semiassi (semiassi con lunghezza simile vuol dire bassa correlazione tra
# le variabili; semiassi molto diversi vuol dire alta correlazione)














# 6. CORRELOGRAMMA
#    6.1 con la funzione corrplot
# Si può ottenere il correlogramma nel seguente modo

require(corrplot)
corrplot(cor(x), method="circle", # “circle”, “square”, “ellipse”, “number”, “shade”,“color”, “pie”.
         type =  "full", # "full", "upper", "lower"
         bg="lightblue", # colore di background
         col=brewer.pal(n=8, name="RdBu"), # per cambiare il colore
         tl.col="black", tl.srt=45, # per cambiare colore e inclinazione del testo
         addCoef.col = "black", # per aggiungere dentro al grafico la correlazione nelle singole celle
         diag=FALSE # per nascondere la diagonale
         )


#    6.2 con la funzione ggcorr
# Si può ottenere il correlogramma nel seguente modo

library("GGally")

ggcorr(data, name = "rho", 
       method = c("pairwise", "pearson"),
       label = TRUE, # per visualizzare i valori sul grafico
       label_color = "black",  # per il colore dei valori sul grafico
       ) 

# nei method si definiscono:
# - "everything", "all.obs", "complete.obs", "na.or.complete" or "pairwise.complete.obs" per la gestione
# della covarianza con valori mancanti;
# - "pearson", "kendall" or "spearman" per il tipo di correlazione da calcolare.

#    6.3 con la funzione ellipse

library(ellipse)
library(RColorBrewer)

my_colors <- brewer.pal(5, "Spectral")
my_colors <- colorRampPalette(my_colors)(100)
ord <- order(data[1, ])
data_ord <- data[ord, ord]
plotcorr(data_ord , col=my_colors[data_ord*50+50] , mar=c(1,1,1,1)  )

#    6.4 con la funzione car

library(car)
library(RColorBrewer)

my_colors <- brewer.pal(nlevels(as.factor(data$cyl)), "Set2")
scatterplotMatrix(~mpg+disp+drat|cyl, data=data , 
                  reg.line="" , smoother="", col=my_colors , 
                  smoother.args=list(col="grey") , cex=1.5 , 
                  pch=c(15,16,17) , 
                  main="Scatter plot with Three Cylinder Options")













# 7. BOXPLOT
# Un boxplot è un grafico a scatola che mostra la distribuzione di una o più variabili. Al suo interno
# sono contenute diverse informazioni, tra cui i valori di 1° e 3° quartile, la mediana (o 2° quartile), 
# il range interquartile (IQR), i valori massimo (3° quartile +1.5*IQR) e minimo (1° quartile -1.5*IQR) e
# l'eventuale presenza/assenza di outliers. 

# Si tratta di una delle visualizzazioni grafiche più usate. 

#    7.1 con la funzione boxplot

boxplot(x, 
        horizontal=TRUE, # per farlo orizzontale
        col = "blue",
        boxwex=0.4,
        frame=F)


#    7.2 con la funzione geom_boxplot

library(ggplot2)

p <- ggplot(data, aes(x=as.factor(x), y=y)) + # aggiungere un terzo tipo con fill=nome_var per grouped boxplot
  geom_boxplot(color="blue", # colore bordi
               fill="blue", # colore interno (non metterlo per non uniformare il colore di tutti)
               alpha=0.2, # quanto viene colorato in %
               notch=TRUE, # se mettere o meno il notch 
               notchwidth = 0.8, # larghezza notch rispetto al resto del boxplot
               outlier.colour="red", # colore bordo outliers
               outlier.fill="red", # colore outliers
               outlier.size=3, # dimensione outliers
               ) + 
  xlab("variabile x") + ylab("variabile y") + ggtitle("A boxplot with jitter") +
  scale_fill_brewer(palette="BuPu")+ # per eventuale palette di colore
  facet_wrap(~x)+ # se con 3 robe tra parentesi in ggplot, ~nome_var per grouped boxplot separati, ~x per ~x
  stat_summary(fun.y=mean, geom="point", shape=2, size=8, color="red")+ # per aggiungere media in boxplot
  geom_jitter(color="black", size=0.4, alpha=0.9) # per aggiungere scatterplot dei singoli boxplot

p1 <- ggMarginal(p, # per aggiungere distribuzione marginale
                 type="histogram", # "histogram", "density", "boxplot"
                 size=10, 
                 color="blue",
                 fill = "red",
                 xparams = list(  bins=10), # solo con "histogram", numero di barre
                 margins = 'x') # per fare solo sulla variabile x
  
  
  



# 8. VIOLIN PLOT

# I violin plot funzionano concettualmente come i boxplot
#    8.1 con la funzione geom_violin

library(ggplot2)

ggplot(data, aes(x=name, y=value, fill=name)) + # fill=name per colore automatico ad ogni gruppo
  geom_violin(width=2.1, size=0.2)+ 
  coord_flip() + # per farlo in orizzontale
  scale_fill_viridis(discrete=TRUE) + # per scale colori
  scale_color_viridis(discrete=TRUE) +
  ggtitle("titolo") +
  geom_boxplot(width=0.1, color="grey", alpha=0.2) # per comprendere boxplot dentro violin, eventuale


#    8.2 con la funzione vioplot

library(vioplot)

with(data , vioplot(value[treatment=="A"] , value[treatment=="B"], value[treatment=="C"],  
  col=rgb(0.1,0.4,0.7,0.7) , names=c("A","B","C")))















# 9. DENSITY PLOT

# Il density plot, in modo simile all'istogramma, mostra la distribuzione di una variabile numerica. 
# Si usa una funzione di ggplot.

library(ggplot2)
ggplot(data, aes(x=price)) +
  geom_density(fill="red", # colore riempimento
               color="blue", # colore bordi
               alpha=0.8) + # livello trasparenza
  ggtitle("Titolo")+ 
  ggMarginal(type="histogram") # per aggiungere eventuale distribuzione marginale sugli assi


# Si può usare anche per mettere a confronto due o più distribuzioni:
# - una sopra e una sotto, con l'asse x in comune (si può fare anche con istogrammi con geom_histogram)

library(ggplot2)
ggplot(data, aes(x=x) ) +
  geom_density( aes(x = var1, y = ..density..), fill="blue" ) +
  geom_label( aes(x=4.5, y=0.25, label="variable1"), color="blue") +
  geom_density( aes(x = var2, y = -..density..), fill= "red") +
  geom_label( aes(x=4.5, y=-0.25, label="variable2"), color="red")

# - con più distribuzioni sullo stesso grafico

library(ggplot2)
ggplot(data=diamonds, aes(x=price, group=cut, fill=cut)) +
  geom_density(adjust=1.5, alpha=.4) # con alpha per eventuale trasparenza

# - con più distribuzioni su grafici diversi nella stessa schermata

library(ggplot2)
ggplot(data=diamonds, aes(x=price, group=cut, fill=cut)) +
  geom_density(adjust=1.5) +
  facet_wrap(~cut) +
  theme(legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    axis.ticks.x=element_blank())














# 10. HEATMAP
# L'heatmap è un tipo di grafico dove i valori vengono mostrati come colori all'interno di una matrice. 

#    10.1 con la funzione heatmap

heatmap(as.matrix(data), 
        scale="column", # per normalizzare la matrice (sia righe che colonne si può fare), per vista migliore
        Colv = NA, Rowv = NA, # per non visualizzare i dendrogrammi sopra gli assi
        col = terrain.colors(256), # terrain.color(), rainbow(), heat.colors(), topo.colors() o cm.colors()
        xlab="variable", ylab="car", main="heatmap",
        )



#    10.2 con la funzione geom_tile

library(ggplot2)
ggplot(data, aes(X, Y, fill= Z)) + 
  geom_tile()+
  scale_fill_gradient(low="white", high="blue") # scalatura di colore


#    10.3 con la funzione geom_tile, ggplotly e saveWidget per renderla interattiva
library(ggplot2)
data <- data %>% mutate(text = paste0("x: ", x, "\n", "y: ", y, "\n", "Value: ",round(Z,2), "\n")) # testo
p <- ggplot(data, aes(X, Y, fill= Z, text=text)) + 
  geom_tile()
pp <- ggplotly(p, tooltip="text")

library(htmlwidgets) # questi per salvarla
saveWidget(pp, file=paste0( getwd(), "/HtmlWidget/ggplotlyHeatmap.html"))

#    10.4 con la funzione levelplot

library("lattice")
levelplot(Z ~ X*Y, data=data, xlab="X", main="",
          col = terrain.colors(256))# terrain.color(), rainbow(), heat.colors(), topo.colors() o cm.colors()











# 11. BUBBLE PLOT
# Un bubble plot è come se fosse uno scatterplot, con la differenza che esiste una terza dimensione che 
# viene mostrata grazie alla dimensione dei pallini.

# Volendo può essere aggiunta anche un'ulteriore dimensione, data dal colore dei pallini (occhio sempre
# a non rendere il grafico poco comprensibile e confuso). 

#    11.1 con la funzione geom_point

library(ggplot2)
ggplot(data, aes(x=gdpPercap, y=lifeExp, size = pop, color=continent)) +
  geom_point(alpha=0.7, shape=21, color="black")+ # trasparenza, forma e colore pallini
  scale_size(range = c(.1, 24), # per scalare la dimensione dei pallini
             name="Population (M)")+ # nuovo nome dimensione pallini
  scale_fill_viridis(discrete=TRUE, guide=FALSE, option="A") + # per colore pallini
  theme(legend.position="bottom") + ylab("Life Expectancy") + xlab("Gdp per Capita")

#    11.2 con la funzione geom_point, ggplotly e saveWidget per renderla interattiva

data <- data %>% mutate(text = paste0("x: ", x, "\n", "y: ", y, "\n", "Value: ",round(Z,2), "\n")) # testo
p <- ggplot(data, aes(x=gdpPercap, y=lifeExp, size = pop, color=continent, text = text)) +
  geom_point(alpha=0.7, shape=21, color="black")+ # trasparenza, forma e colore pallini
  
pp <- ggplotly(p, tooltip="text")

library(htmlwidgets) # questi per salvarla
saveWidget(pp, file=paste0( getwd(), "/HtmlWidget/ggplotlyHeatmap.html"))















# 12. DENDROGRAM          
# Un dendrogramma (o diagramma ad albero, o grafo) è una struttura a rete, costituita da nodi collegati 
# tra di loro da "rami". 

# Generalmente possono essere di due tipi:
# - quelli costruiti da dataset gerarchici
# - quelli costruiti in base ai risultati del clustering

#    12.1 dendrogramma per dataset gerarchici

library(ggraph)
library(igraph) # per creare grafo in vista del dendrogramma
library(tidyverse)

ggraph(mygraph, layout = 'dendrogram', 
       circular = FALSE) + # se false, normale dendrogramma; altrimenti dendrogramma circolare
  geom_edge_diagonal() + # se vogliamo gli edges curvi
  geom_edge_diagonal() + # se vogliamo gli edges diagonali
  geom_node_text(aes( label=name, filter=leaf) , angle=90 , hjust=1, nudge_y = -0.1) + # per nomi nodi
  geom_node_point(aes(filter=leaf, size=value, color=group) , alpha=0.6) + # per grafica nodi
  theme_void()


#    12.2 dendrogramma relativo a risultati di clustering

dist <- dist(data[ , c(4:8)] , diag=TRUE)  # matrice di distanze
hc <- hclust(dist)
plot(hc)

# oppure

dhc <- as.dendrogram(hc)
dL <- dendrapply(dhc, colLab)
plot(dL)

# oppure 

library(dendextend)

dhc <- as.dendrogram(hc)
dhc %>% set("branches_col", value = c("skyblue", "orange", "grey")) %>% # modifica bracci
  set("branches_lwd", 3) %>% 
  set("labels_col", "orange") %>% set("labels_cex", 0.8) %>% # modifica scritte foglie
  plot()

dhc %>% 
  set("nodes_pch", 19)  %>%    # modifica nodi
  set("nodes_cex", 0.7) %>% 
  set("nodes_col", "orange") %>% 
  plot()

dhc %>% 
  set("leaves_pch", 19)  %>%   # modifica foglie
  set("leaves_cex", 0.7) %>% 
  set("leaves_col", "skyblue") %>% 
  plot()

rect.dendrogram( dend, k=3, lty = 5, lwd = 0, x=1, col=rgb(0.1, 0.2, 0.4, 0.1) ) # per colorare un cluster

abline(v = 350, lty = 2) # per eventuale riga da aggiungere al taglio del dendrogramma














# 13. LOLLIPOP PLOT
# Un lollipop plot (o grafico a lecca lecca) è praticamente un grafico a barre, ma con una linea e un
# punto al posto della barra.

# Spiega una relazione tra una variabile numerica e una categorica. 

library(ggplot2)
ggplot(data, aes(x=x, y=y)) +
  geom_point(size=5, color="red", fill=alpha("orange", 0.3), alpha=0.7, shape=21, stroke=2) + # pallini
  geom_segment( aes(x=x, xend=x, y=0, yend=y), size=1, color="blue", linetype="dotdash") + # linee
  xlab("") + ylab("Value of Y") + main("") + 
  coord_flip() # per ruotare il grafico di 90°

# definendo la y con valore diverso da 0, il grafico cambia ed è a due direzioni (sopra e sotto quel valore)

















# 14. DOUGHNUT PLOT

# Un grafico a ciambella è un anello diviso in sezioni in base ad una proporzione in una distribuzione
# di una variabile. E' molto simile ad un diagramma a torta, ma col centro escluso.

library(ggplot2)

data$fraction = data$count / sum(data$count)
data$ymax = cumsum(data$fraction)
data$ymin = c(0, head(data$ymax, n=-1))

ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
  geom_rect() +
  geom_text( x=2, aes(y=labelPosition, label=label, color=category), size=6)+ # per valori dentro ciambella
  geom_label( x=3.5, aes(y=labelPosition, label=label), size=6) + # per valori sopra ciambella
  coord_polar(theta="y")  +
  xlim(c(2, 4))# per lo spessore della ciambella, il primo numero

# x in geom_text() controlla la posizione dentro/fuori la ciambella (2 dentro, 1 fuori)
















# 15. SPIDER/RADAR CHART

# Uno spider (o radar) chart è un grafico a 2 dimensioni per mostrare una serie di valori quantitativi
# relativi ad un aspetto di studio
  
#    15.1 con un solo gruppo

library(fmsb)

data <- rbind(rep(20,10) , rep(0,10) , data) # vanno aggiunti il massimo e il minimo di ogni topic

radarchart(data, 
           axistype=1, 
           pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , # poligono
           cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8, # griglia
           vlcex=0.8) # scritte


#    15.2 con più gruppi

library(fmsb)

data <- rbind(rep(20,5) , rep(0,5) , data) # vanno aggiunti il massimo e il minimo di ogni topic

colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )

radarchart(data, 
           axistype=1, 
           pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1, # poligono
           cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8, # griglia
           vlcex=0.8) # scritte

# se massimo e minimo non sono specificati, vengono autoimposti dal grafico

















# 16. WORDCLOUD       (DA FARE)
# 17. CIRCULAR BARPLOT          (DA FARE)
# 18. TREEMAP

# Una treemap spiega dati gerarchici con un insieme di rettangoli di area pari alla loro distribuzione

library(treemap)

treemap(data,
        index=c("group","subgroup"), # per specificare gruppi e sottogruppi
        vSize="value", # valore dei rettangoli
        type="index",
        fontsize.labels=c(15,12), fontcolor.labels=c("white","orange"),fontface.labels=c(2,1), # font
        inflate.labels=F, # se T, labels più grosse se gruppi più grandi
        border.col=c("black","white"), border.lwds=c(7,2), # opzioni dei bordi dei rettangoli
        title="My Treemap", fontsize.title=12)

















# 19. PIE PLOT
# Il grafico a torta è come il grafico a ciambella, ma con l'interno riempito: è un anello diviso 
# in sezioni in base ad una proporzione in una distribuzione di una variabile.

#    19.1 con la funzione pie

library(RColorBrewer)
pie(Prop, 
    labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E"), # per aggiungere le labels ai gruppi
    edges=10, # per renderlo come figura non rotonda
    density=10 , angle=c(20,90,30,10,0), # per il riempimento delle varie fette
    border="white", col = brewer.pal(5, "Set2")) # per aggiungere i colori

#    19.2 con la funzione coord_polar

library(ggplot2)

ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  theme_void() + # per tema senza cose superflue
  geom_text(aes(y = ypos, label = group), color = "white", size=6) # per aggiungere labels dentro















# 20. LINE PLOT       (DA FARE)
# 21. MAPS          (DA FARE)
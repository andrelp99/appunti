# INDICE
# 1. FUNZIONI PER CREARE DISTRIBUZIONI
# 2. BOOTSTRAP
# 3. MODELLO LINEARE SEMPLICE
# 4. MODELLO LINEARE MULTIPLO
#   4.1 grafici residui
#   4.2 altre statistiche residui
# 5. MODELLO NULLO
# 6. MODEL SELECTION
# 7. MODELLO REGRESSIONE LOGISTICA (RISPOSTA BINARIA)
# 8. MODELLO MULTINOMIALE LOGIT
# 9. MODELLO MISTO GAUSSIANO
# 10. PREVISIONI NUOVI VALORI









# 1. FUNZIONI PER CREARE DISTRIBUZIONI

# Ci sono diverse distribuzioni che si possono creare su R:
# - per la densità: dnorm
# - per la distribuzione cumulativa: pnorm
# - per il quantile: qnorm
# - per le pseudo-determinazioni di una distribuzione: rnorm

rnorm(n = 100, mean = 0, sd = 1) # n come numero di osservazioni generate
pnorm(130, mean = 140, sd = 6) # probabilità cumulativa che Y<=130
qnorm(0.975, mean = 140, sd = 6) # probabilità cumulativa Y<=q quantile 97.5%

# - distribuzione bivariata

require(mvtnorm)
sigma1 <- matrix(c(3,2,2,3), ncol=2); sigma1
x <- rmvnorm(n = 10 ,mean=c(0,0), sigma=sigma1); x
# cov(x) 
# cor(x)













# 2. BOOTSTRAP

B <- 1000
n <- length(x)
Tboot <- rep(0, B)
set.seed(16253)
for (i in 1:B) {
  Xstar <- sample(x,
                  n,
                  replace = TRUE)
  Tboot[i] <- e1071::skewness(Xstar)
}

head(Tboot)
summary(Tboot)
seTboot <- sd(Tboot); seTboot

hist(Tboot) # per istogramma

sB<- mean(Tboot)
Q <- quantile(Tboot, c(0.025, 0.975))
hist(Tboot)
abline( v = c(sk,sB,Q[1], Q[2]),
        col = c("red", "blue", "green", "green")) # per istogramma con intervallo di confidenza

# oppure anche con la libreria bootstrap

library(bootstrap)
B <- 1000
bootM <- bootstrap(x,
                   nboot= B,
                   e1071::skewness)

sd(bootM$thetastar)

# Bootstrap con clustering

mc <-Mclust(data, G = 3, modelNames = c("EII"))
plot(mc,"classification", xlab = "white cell", ylab = "haemoglobin")

bootClust <- MclustBootstrap(mc)
summary(bootClust, what = "se") # riporta gli errori standard stimati per ogni parametro
summary(bootClust, what = "ci") # riporta gli intervalli di confidenza stimati per ogni parametro











# 3. MODELLO LINEARE SEMPLICE
















# 4. MODELLO LINEARE MULTIPLO
# L'oggetto creato contiene:
# - la formula del modello di regressione (in sezione "call")
# - le stime dei residui del modello (in sezione "residuals")
# - le stime dei parametri (coefficienti di regressione parziale), gli errori standard (di ogni coefficiente
#   di regressione), i t-test del modello (statistica t-test dato dal valore del coefficiente stimato 
#   fratto l'errore standard), la Pr(>|t|) (p-value relativo all'area della coda per la distribuzione di t di 
#   Student sotto ipotesi nulla di coefficiente = 0) e le code di significatività (quando il p-value è maggiore
#   dei livelli di significatività: 3 stelle sono rifiuto dell'ipotesi nulla, 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1)
#   di regressione, compreso il valore per l'intercetta (in sezione "coefficients")
# - i valori fittati (con mod1$fitted)
# - i gradi di libertà
# - R^2 e R^2 aggiustato (per la qualità del modello fittato: quanta variabilità della risposta è spiegata dal
#   modello)
# - la statistica F (testa la nullità del modello)




mod1 <- lm(y~ x1 + x2, data = database)
mod2 <- lm(y~ ., data = database) # modello con tutte le covariate
mod3 <- lm(y~ ., data = database[-148,]) # modello con tutte le covariate e tolta un'osservazione

summary(lm1, digits=3) # per tutte le informazioni del modello
mod1$fitted # per i valori fittati
lm1$residuals # per i residui
skim_without_charts(lm1$res) # per i residui

summ<-summary(mod1)
(summ$sigma)^2 # stimatore varianza

confint(mod1, level=(1-0.10)) # intervalli di confidenza parametri del modello


#   4.1 grafici residui

# residui vs n° osservazione: vedere per eventuali pattern di dispersione dei punti, punti molto più distanti, 
# equilibrio tra residui positivi e negativi, 

plot(mod1$residuals,
     xlab = "Observation number",
     ylab = "Residual",
     ylim = c(-3.8, 3),
     xlim = c(0, 502),
     col="blue",
     pch=16,
     cex=0.4)
abline(h=0, col = "red")



# residui vs valori fittati: vedere dispersione dei punti rispetto al centroide, nessuna forma a U (se non c'è, 
# ipotesi di linearità rispettata)

plot(mod1$fitted,
     mod1$residuals,
     main = " ",
     xlab = "Fitted values",
     ylab = "Residuals",
     ylim = c(-3.8, 3),
     col = "blue",
     pch=16,cex=0.4)

# residui vs covariate: vedere se i punti sono dispersi intorno al centro di gravità, se non ci sono pattern
# particolari o associazioni lineari chiare, se non ci sono valori molto lontani dagli altri

par(mfrow=c(1,2))
plot(data$x1,
     mod1$residuals,
     main = " ",
     xlab = "Net revenues",
     ylab = "Residuals",
     col="blue",
     ylim = c(-3.8, 3),
     type="p",
     pch=16,cex=0.4)
plot(data$x2,
     mod1$residuals,
     main = " ",
     xlab = "Investments",
     ylab = "Residuals",
     ylim = c(-3.8, 3),
     col="red",
     type="p",
     pch=16,cex=0.4)


#   4.2 altre statistiche residui

# residui studentizzati

rT<-rstudent(mod1)
summary(rT)

# grafico confronto residui studentizzati - distribuzione empirica (deve seguire la linea teorica)

plot(ecdf(rT),
     main ='Empirical and theorical t(n-p-1)',
     col="blue")
curve(pt(x,497), # gradi di libertà 𝑛 − 𝑝 − 2 (n° oss. - n° parametri - 2)
      col='red',
      add=TRUE)



# punti di leva: grandi valori significano valori inusuali delle covariate

lev<-hatvalues(lm1)
require(skimr)
sum(lev) # pari al numero di parametri + 1

require(faraway)
halfnorm(hatvalues(lm1),
         ylab="Normalized leverage points")


# distanza di Cook: possono essere punti influenti quelli con valori maggiori di 1. 

cook <- cooks.distance(lm1)
summary(cook)

halfnorm(cook, ylab = "Cook distance", pch=16,
         cex=0.4)

# VIF: Variance Inflated Factor, quando ha valori > 10, c'è eccessiva collinearità (che porta a 
# alti errori standard dei coefficienti di regressione) per quella variabile. 
# Un valore di 2 vuol dire che l'errore standard stimato per il coefficiente della covariata di interesse è 
# 2 volte più grande di quanto sarebbe senza collinearità. 

library(car)
faraway::vif(mod1)
















# 5. MODELLO NULLO
# Il modello nullo include solo l'intercetta, dunque spiega la risposta ad un segnale più un errore. 

mod0 <- lm(y ~ 1, profits)
summary(mod0)



















# 6. MODEL SELECTION
# procedure automatiche di model selection, come quella basata sull'indice Akaike (AIC), ricercato con valori 
# bassi:

step(mod1, direction = "both") 
# direction può essere both (ovvero la stepwise, è la default), forward o backward








# 7. MODELLO REGRESSIONE LOGISTICA (RISPOSTA BINARIA)
# Si usa la libreria "glm"
# Si interpreta come un modello moltiplicativo, per i p/(1-p), ovvero gli odds.

library(glm)
mod1<-glm(Y ~ data$x1 + data$x2, family = binomial)

summary(mod1)

# se una variabile ha stima 0.0423, il ratio del gruppo è exp(0.0423) = 1.0432 per aumento unitario della 
# variabile stessa, e a parità delle altre variabili (fissate).  
# si cerca un modello con bassa devianza residua. 
# il p-value definisce il Wald-test (se le variabili nel modello sono statisticamente significative)

















# 8. MODELLO MULTINOMIALE LOGIT
# Si usa la libreria "nnet": il programma usa un metodo di ottimizzazione dal trainer di reti neurali per 
# calcolare la massima verosimiglianza. 

library(nnet)
mmod <- multinom(Y ~., data = data)


















# 9. MODELLO MISTO GAUSSIANO
# Si usa la libreria "Mclust" (Gaussian Mixture Modelling for Model-Based Clustering):

mod1 <- Mclust(datacol$cholst, G = 2, modelNames = "E")

# modelNames come E per modello omoschedastico (componenti con la stessa varianza), oppure V come modello
# eteroschedastico (componenti con varianza variabile)
# G definisce il numero di componenti del modello. 

summary(mod1, parameters = TRUE)

# le summary danno:
# - il valore della funzione di log-verosimiglianza
# - il numero di parametri del modello liberi di variare
# - probabilità miste pesate per ogni componente
# - medie di ogni cluster
# - stime delle varianze di ogni cluster

# Inoltre, viene creata anche una classificazione:
mod1$z
table(data$y, Cluster = mod1$classification )

predict(mod1, newdata = x, what = "dens")

# per la selezione delle variabili dentro al modello, si usa il Bayesian Information Criterion (BIC), 
# calcolato per modello misto con crescente numero di componenti. 
bayesinf <- mclustBIC(datacol$cholst)
bayesinf
# il modello migliore è quello col valore più basso di BIC; in generale, i tre modelli migliori sono quelli
# mostrati in basso, come i "Top 3 models"
plot(bayesinf)











# 10. PREVISIONI NUOVI VALORI

# Possiamo fare delle previsioni su nuovi valori 

xc<-c(1,38,68, 35, 95,101,59,18)
names(xc)<-c("int", "age", "height", "neck", "abdom", "hip", "thigh", "wrist")

predict(mod1, new=data.frame(t(xc)), interval = "prediction")
# trova la stima puntuale e l'intervallo di confidenza al 95% della singola variabile risposta

predict(mod1, new=data.frame(t(xc)), interval = "confidence")
# per trovare una stima della risposta media (stima puntuale uguale, riduce parecchio l'intervallo di confidenza)






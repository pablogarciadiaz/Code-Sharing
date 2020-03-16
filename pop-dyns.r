#### Example population dynamics model

set.seed(2013)

### Basic idea: N = A + J

################## Deterministic model
ad.surv<-0.81               ### Adult survival

pc.prod<-0.1               ### Productivity per capita

n.year<-100                 ### Years to simulate

#### Store the results in a matrix
out.pop<-matrix(0, ncol=2, nrow=n.year)

colnames(out.pop)<-c("Adults", "Juveniles")

out.pop

### Initial conditions - 1st year
out.pop[1, 1]<-100                              ### Adults first year

out.pop[1, 2]<-round(out.pop[1, 1]*pc.prod, digits=0)       ### Juveniles born first year

out.pop

#### Subsequent years
for (i in 2:n.year){

    out.pop[i, 1]<-round(out.pop[i-1, 1]*ad.surv, digits=0)+out.pop[i-1, 2]                     ### Number of adults

    out.pop[i, 2]<-round(out.pop[i, 1]*pc.prod, digits=0)        ### Number of juveniles born

}

out.pop

### Plot
max.ab<-max(c(unlist(out.pop)))

max.ab

plot(out.pop[ , 1]~c(1:n.year), type="l", xlab="Years", lwd=2, ylab="Abundance", ylim=c(0, max.ab))

lines(out.pop[ , 2]~c(1:n.year), lwd=2, col="blue")

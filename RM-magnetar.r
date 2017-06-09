
data1<-read.csv("/Users/gdesvignes/Documents/papers/gregory/GC_Magnetar/data/RM_2.5_3.2GHz.txt", sep=" ",header = FALSE, skip=1, comment.char = "#",col.names=c("MJD","Frequency", "RM","Error","ttt","min2","max2"))
data2<-read.csv("/Users/gdesvignes/Documents/papers/gregory/GC_Magnetar/data/RM_4.8GHz.txt", sep=" ",header = FALSE, skip=1, comment.char = "#",col.names=c("MJD","Frequency", "RM","Error","ttt","min2","max2"))

data<-rbind(data1,data2)

sat <- subset(data, select = c("MJD", "RM"))
error <-c(subset(data,select=c("Error")))
weights = 1/unlist(error)

sat2<-sat[28:40,]
weights2<-weights[28:40]

sat2<-tail(sat,14)
weights2<-tail(weights,14)

fit<-lm(RM~MJD, data=sat2, weights=weights2)
plot(sat, pch=19)
#arrows(data['MJD'], data['RM']-data['Error'], data['MJD'], data['RM']+data['Error'], length=0.05, angle=90, code=3)
arrows(unlist(data['MJD']), unlist(data['RM']-data['Error']), unlist(data['MJD']), unlist(data['RM']+data['Error']), length=0.05, angle=90, code=3)

abline(fit)
fit





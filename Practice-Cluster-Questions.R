sqrt(334.89)


(234-189)/sqrt(334.89)



180+(1.5*20)


bankDS


attach(bankDS)

sd(Avg_Credit_Limit)

Mu = mean(Total_visits_online)


sd = sd(Total_visits_online)


z.visistsonline = Total_visits_online


z.visistsonline

z.visistsonline1 = (z.visistsonline-Mu)/sd
z.visistsonline1

bankDS.Scaled = scale(bankDS[3:7])
print(bankDS.Scaled)


dist.mat = dist(x= bankDS.Scaled , method = "euclidean")
print(dist.mat)



cluster <- hclust(dist.mat, method = "average")
plot(cluster)



#install.packages("NbClust")
library(NbClust)
seed=1000
set.seed(seed)
nc = NbClust(bankDS[,c(-1, -2)], min.nc = 2 , max.nc = 5 , method = "kmeans")
table(nc$Best.nc[1,])


clust3 <- kmeans(x=bankDS.Scaled, centers =  3 , nstart = 5)
library(car)
library(cluster)
clusplot(bankDS.Scaled, clust3$cluster , color = TRUE , labels = 2 , lines = 1)



bankDS$cluster <- clust3$cluster
bankProfile <- aggregate(bankDS[,c(3:7)], list(bankDS$cluster), FUN = "mean")
print(bankProfile$Group.1)


loanStat
attach(loanStat)

names(loanStat)

summary(delinquent)
str(delinquent)

summary(loanStat)
as.factor(delinquent)



a =c (30,40,50)
Mu = mean(a)
Mu
sd = sd(a)
sd

zscore = (40 -Mu)/sd
zscore

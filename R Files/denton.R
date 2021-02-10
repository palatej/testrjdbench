library(rjdbench)

#read data
X<-read.csv('./Data/x_europe.csv')

fr<-ts(X$France, frequency = 12, start=c(1995,1))
eu<-ts(X$Union.europeenne, frequency = 12, start=c(1995,1))

EU<-rjdbench::aggregate(eu,1)

# Denton

eu_denton<-rjdbench::jd3_denton(fr, EU)

plot(ts.union(eu, eu_denton), plot.type = "single", type="l", col=c("gray", "black"))


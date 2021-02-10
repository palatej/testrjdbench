library(rjdbench)

sy<-rjdbench::aggregate(retail$BuildingMatAndSuppliesDealers, nfreq=1)
sm1<-jd3_denton(retail$BookStores, sy, mul=T)
sm2<-jd3_cholette(retail$BuildingMatAndGardenEquipAndSupp, sy, lambda = 0)
sm3bis<-jd3_cholette(3*retail$BookStores, window(sy, end=2008), lambda = 0.98, bias = "None")

sm4<-jd3_grp(retail$BuildingMatAndGardenEquipAndSupp, sy)
sm5<-jd3_cubicspline(retail$BuildingMatAndGardenEquipAndSupp, conversion="Sum", sy)


ts.plot(sm1, sm2, sm3bis, sm4, sm5, col=c("red", "blue", "gray", "green", "magenta"))

print(summary(rjdbench::aggregate(sm1, nfreq=1)-sy))
print(summary(rjdbench::aggregate(sm2, nfreq=1)-sy))
print(summary(rjdbench::aggregate(sm3bis, nfreq=1)-sy))
print(summary(rjdbench::aggregate(sm4, nfreq=1)-sy))

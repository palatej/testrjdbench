library(rjdbench)


sy<-aggregate(retail$BuildingMatAndSuppliesDealers, nfreq=1)
chowlin<-jd3_tempdisagg(sy, indicators = list(retail$BuildingMatAndGardenEquipAndSupp), rho.truncated = 0)
fernandez<-jd3_tempdisagg(sy, indicators = list(retail$BuildingMatAndGardenEquipAndSupp), model="Rw")
litterman<-jd3_tempdisagg(sy, indicators = list(retail$BuildingMatAndGardenEquipAndSupp), model="RwAr1")
modeli<-jd3_tempdisagg2(sy, indicator=retail$BuildingMatAndGardenEquipAndSupp, rho = 0.8)

sm1<-chowlin$estimation$disagg
sm2<-fernandez$estimation$disagg
sm3<-litterman$estimation$disagg

ts.plot(sm1, sm2, sm3, modeli, col=c("red", "blue", "gray", "magenta"))


summary(chowlin)
summary(fernandez)
summary(litterman)


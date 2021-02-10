library(rjdbench)

sy<-aggregate(retail$RetailSalesTotal, nfreq=1)

sm1<-jd3_denton2(12, sy, conversion="UserDefined", obsposition = 6)
sm2<-jd3_cubicspline(retail$WomensClothingStores, sy, conversion="UserDefined", 6)
sm3<-jd3_cubicspline2(12, sy, conversion="UserDefined", 6)
sm4<-jd3_grp(retail$WomensClothingStores, sy, conversion="UserDefined", obsposition = 6)

ts.plot(sm1, sm2, sm3, sm4, col=c("red", "blue", "gray", "green"))

tm1<-jd3_denton(retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum")
tm2<-jd3_cubicspline(retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum")
tm3<-jd3_grp(retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum")
tm4<-jd3_cholette(retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum", rho=.5, lambda=0.5)

ts.plot(tm1, tm2, tm3, tm4, col=c("red", "blue", "gray", "green"))



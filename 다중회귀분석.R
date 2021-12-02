data<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/데이터/data1.csv",header=T,sep=',')
head(data)

dly$YEAR<-as.factor(dly$YEAR)
dly$MONTH<-as.factor(dly$MONTH)
dly$DAY<-as.factor(dly$DAY)
dly$D_DLY<-as.factor(dly$D_DLY)
dly$A_DLY<-as.factor(dly$A_DLY)
dly$dep_arr3<-as.factor(dly$dep_arr3)
dly$DTT_T2<-as.factor(dly$DTT_T2)
dly$ATT_T2<-as.factor(dly$ATT_T2)

str(data)
temp<-data[,c(3,4,6,7,8,9,10,13,20,25,27)]
temp2<-data[,c(3,4,6,7,8,9,10,15,20,26,28)]

fit<-lm(D_DLY~.,data=temp)
summary(fit)
fit2<-lm(D_DLYT~.,data=temp2)
summary(fit2)

fit.con<-lm(D_DLY~1,data=temp)
fit.forward<-step(fit.con,scope=list(lower=fit.con,upper=fit),direction="forward")

out3=lm(formula=D_DLYT~Dep_AP+DTT_T2+FLO+MONTH+DAY_c+DAY+YEAR+Arr_AP+ATT_T2+FLT_TIME,data=temp2)
summary(out3) #0.07526

out4=lm(formula=D_DLYT~Dep_AP+DTT_T2+FLO+MONTH+DAY_c+DAY+YEAR+Arr_AP+ATT_T2,data=temp2)
summary(out4)

fit.backward<-step(fit2,scope=list(lower=fit.con,upper=fit2),direction="backward")








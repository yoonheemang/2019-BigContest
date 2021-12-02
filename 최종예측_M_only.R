dly<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/데이터/AFSNT_DLY1.csv",header=T,sep=',')
data<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/데이터/data1.csv",header=T,sep=',')
head(data)

temp<-data[,c(3,4,6,7,8,9,10,13,20,25,27)]
temp2<-data[,c(3,4,6,7,8,9,10,17,20,25,27)]
head(temp);head(temp2)
train<-temp[sample(nrow(temp),100000),] #랜덤하게 30만개 뽑음

dly_m<-subset(dly,FLO=='M')
dly_m$FLO<-as.factor(as.character(dly_m$FLO))
#dly_m$Dep_AP<-as.factor(as.character(dly_m$Dep_AP))
#dly_m$Arr_AP<-as.factor(as.character(dly_m$Arr_AP))
str(dly_m)
test_x<-dly_m[c("YEAR","MONTH","DAY","DAY_c","FLT_TIME","DTT_T1","ATT_T1")]
levels(test_x$YEAR)<-levels(temp$YEAR)
levels(test_x$MONTH)<-levels(temp$MONTH)
levels(test_x$DAY)<-levels(temp$DAY)


#library(randomForest)

###출발 지연확률
forest_m<-randomForest(D_DLY~YEAR+MONTH+DAY+DAY_c+FLT_TIME+DTT_T1+ATT_T1
		,data=temp,ntree=100,mtry=3,importance=T,keep.forest=TRUE)
forest_m

y_pred<-predict(forest_m,test_x)
dly_m$DLY.D<-y_pred
y_prob<-predict(forest_m,test_x,type='prob')
dly_m$DLY_RATE.D<-y_prob[,2]


#################################################################################
###도착 지연확률
forest_a<-randomForest(A_DLY~YEAR+MONTH+DAY+DAY_c+FLT_TIME+DTT_T1+ATT_T1
		,data=temp2,ntree=100,mtry=3,importance=T,keep.forest=TRUE)
forest_a

y_pred<-predict(forest_a,test_x)
dly_m$DLY.A<-y_pred
y_prob<-predict(forest_a,test_x,type='prob')
dly_m$DLY_RATE.A<-y_prob[,2]

write.csv(dly_m,"C:/Users/a/Desktop/공모전/빅콘테스트/결과/M_지연예측.csv")




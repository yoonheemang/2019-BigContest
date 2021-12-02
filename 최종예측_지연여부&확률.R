dly<-read.table("C:/Users/a/Desktop/°ø¸ğÀü/ºòÄÜÅ×½ºÆ®/µ¥ÀÌÅÍ/AFSNT_DLY1.csv",header=T,sep=',')

temp<-data[,c(3,4,6,7,8,9,10,13,20,25,27)]
head(temp)
train<-temp[sample(nrow(temp),300000),] #·£´ıÇÏ°Ô 30¸¸°³ »ÌÀ½

#library(randomForest)
forest_m<-randomForest(D_DLY~Dep_AP+Arr_AP+YEAR+MONTH+DAY+DAY_c+FLO+FLT_TIME+DTT_T1+ATT_T1
		,data=train,ntree=100,mtry=3,importance=T,keep.forest=TRUE)
forest_m

###Ãâ¹ß Áö¿¬È®·ü
test_x<-dly[c("Dep_AP","Arr_AP","YEAR","MONTH","DAY","DAY_c","FLO","FLT_TIME","DTT_T1","ATT_T1")]
y_pred<-predict(forest_m,test_x)
dly$DLY.D<-y_pred
y_prob<-predict(forest_m,test_x,type='prob')
dly$DLY_RATE.D<-y_prob[,2]
#train data set
dly_n<-data[data$D_DLY==0,]
dly_y<-data[data$D_DLY==1,]

head(dly_y)
head(dly_n)
nrow(dly_y);nrow(dly_n)

a1<-dly_y[sample(nrow(dly_y),7000),]
a2<-dly_n[sample(nrow(dly_n),10000),]
b1<-dly_y[sample(nrow(dly_y),4000),]
b2<-dly_n[sample(nrow(dly_n),10000),]

train2<-rbind(a1,a2)
test2<-rbind(b1,b2)


########################################################
library(randomForest)
forest_m<-randomForest(D_DLY~Dep_AP+Arr_AP+YEAR+MONTH+DAY+DAY_c+FLO+FLT_TIME+DTT_T1+ATT_T1
		,data=temp,ntree=100,mtry=3,importance=T,keep.forest=TRUE)
forest_m

#test데이터 생성
test_x<-test2[c("Dep_AP","Arr_AP","YEAR","MONTH","DAY","DAY_c","FLO","FLT_TIME","DTT_T1","ATT_T1")]
test_y<-test2$D_DLY

#성능평가
head(forest_m$votes) 
y_pred<-predict(forest_m,test,type='prob')

confusionMatrix(y_pred,test_y)
#install.packages('pROC')
library(pROC)

rf.roc<-roc(test2$D_DLY,forest_m$votes[,2])
plot(rf.roc)
auc(rf.roc)

###################
pr <- prediction(forest_m$votes[,2], train2$D_DLY)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)


#변수 중요도
importance(forest_m)


#모델 시각화
layout(matrix(c(1,2),nrow=1),width=c(4,1))
par(mar=c(4,3,3,0))
plot(forest_m)
par(mar=c(4,0,3,2))
plot(c(0,1),type="n",axes=F)
legend("top",colnames(forest_m$err.rate),col=1:3,cex=0.8,fill=1:3)






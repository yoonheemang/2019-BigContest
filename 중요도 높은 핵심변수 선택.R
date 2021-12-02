##데이터 준비
#install.packages('caret')
#install.packages('randomForest')
library(caret)
temp2<-data[,c(3,4,6,7,8,9,10,13,15,20,26,28)]
temp3<-temp2[,-5]

temp2<-temp2[sample(nrow(temp2),50000),]
#temp2<-data[sample(nrow(data),50000),]

rn<-createDataPartition(y=temp2$D_DLY,p=0.7,list=F)
train<-temp2[rn,]
test<-temp2[-rn,]

##중요도가 높은 핵심 변수 선택하기
#1. random Forest 모델 활용
library(randomForest)
forest_m<-randomForest(D_DLY~Dep_AP+Arr_AP+YEAR+MONTH+DAY+DAY_c+FLO+FLT_TIME+DTT_T1+ATT_T1
		,data=train,ntree=100,mtry=3,importance=T)
forest_m

#test데이터 생성
test_x<-test[c("Dep_AP","Arr_AP","YEAR","MONTH","DAY","DAY_c","FLO","FLT_TIME","DTT_T1","ATT_T1")]
test_y<-test$D_DLY

#성능평가
y_pred<-predict(forest_m,test_x)
confusionMatrix(y_pred,test_y)

#변수 중요도
importance(forest_m)


#모델 시각화
layout(matrix(c(1,2),nrow=1),width=c(4,1))
par(mar=c(4,3,3,0))
plot(forest_m)
par(mar=c(4,0,3,2))
plot(c(0,1),type="n",axes=F)
legend("top",colnames(forest_m$err.rate),col=1:3,cex=0.8,fill=1:3)






train<-temp[sample(nrow(data),300000),] #랜덤하게 30만개 뽑음

#dly여부
dly_n<-data[data$D_DLY==0,]
dly_y<-data[data$D_DLY==1,]
nrow(dly_n);nrow(dly_y) #원데이터 비율 16%정도

#출발 도착 둘 다 지연
dly_yy<-dly_y[dly_y$A_DLY==1,]
nrow(dly_yy)

dly_ny<-dly_n[dly_n$A_DLY==1,]
nrow(dly_ny)
head(dly_ny)

#도착지연시간과 출발지연시간의 차..
data$R_A_DLYT<-(data$A_DLYT-data$D_DLYT)
head(data)
table(data$R_A_DLYT)
table(data$D_DLYT)

#지연시간이 애매한 것 제외..?(25분과 35분 사이 삭제)
data2<-data[data$D_DLYT<=20|data$D_DLYT>=40,]

#다시 모델링
nrow(data2)
train<-data[sample(nrow(data),30000),] #랜덤하게 30만개 뽑음
test<-data[sample(nrow(data),10000),] #랜덤하게 15만개 뽑음
nrow(train);nrow(test)
model<-glm(D_DLYT~FLT_TIME+Dep_AP+FLO+DTT_T2+MONTH+DAY_c,data=train)
p<-predict(model,newdata=test)
a<-round(p)
a[a<=30]<-0;a[a>30]<-1
table(a,test$D_DLY)



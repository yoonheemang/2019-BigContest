data<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/데이터/지연사유재범주화.csv",header=T,sep=',')
data2<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/데이터/지연사유재범주화1.csv",header=T,sep=',')

head(data)
a<-data$D_DLYT-data$A_DLYT
a[a<0]
table(a[a<0])
data[which(a==-109),]

data1<-data
data$R_FLT_TIME<-data$FLT_TIME-data$D_DLYT+data$A_DLYT
head(data)
ncol(data)
data<-data[,c(1:20,23,21,22)]

write.csv(data,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/실제비행시간이상치제거.csv",row.names=F)

out=lm(A_DLYT~ D_DLYT,data=data); summary(out)
plot(A_DLYT~ D_DLYT,data=data)
abline(out,col='red')

summary(data$R_FLT_TIME)
plot(data$R_FLT_TIME)
data[which(data$R_FLT_TIME==min(data$R_FLT_TIME)),]
summary(data$R_FLT_TIME)
data<-data[-which(data$R_FLT_TIME<0),]
head(data)
nrow(data)
table(data$R_FLT_TIME)

##outlier제거 (IQR 이용)_lower이 이상함
UpperQ = fivenum(data$R_FLT_TIME)[4]
LowerQ = fivenum(data$R_FLT_TIME)[2]
IQR = UpperQ - LowerQ
upperOutlier = data$R_FLT_TIME[which(data$R_FLT_TIME > UpperQ+IQR*1.5)]
lowerOutlier = data$R_FLT_TIME[which(data$R_FLT_TIME < LowerQ-IQR*1.5)]
table(upperOutlier)
table(lowerOutlier)
data<-data[-which(data$R_FLT_TIME > UpperQ+IQR*3),]
data<-data[-which(data$R_FLT_TIME < LowerQ-IQR*3),]

#비행시간 0이하 제거 안한 데이터로 다시 outlier제거
UpperQ2 = fivenum(data2$R_FLT_TIME)[4]
LowerQ2 = fivenum(data2$R_FLT_TIME)[2]
IQR2 = UpperQ - LowerQ
upperOutlier2 = data2$R_FLT_TIME[which(data2$R_FLT_TIME > UpperQ+IQR*3)]
lowerOutlier2 = data2$R_FLT_TIME[which(data2$R_FLT_TIME < LowerQ-IQR*3)]
table(upperOutlier2)
table(lowerOutlier2)

data<-data[-which(data$R_FLT_TIME > UpperQ+IQR*3),]
data<-data[-which(data$R_FLT_TIME < LowerQ-IQR*3),]

boxplot(data$R_FLT_TIME)

#출발,도착공항 같은 것
sum(data1$Dep_AP==data1$Arr_AP)
data1[data1$Dep_AP==data1$Arr_AP,]

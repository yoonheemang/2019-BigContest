#결항제거
data<-subset(data,CNL=='N')
nrow(data) #979450
write.csv(data,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/결항제거.csv",row.names=F)
datestring1<-paste(data$date,data$STT)
datestring2<-paste(data$date,data$ATT)
x<-strptime(datestring1,"%Y %m %d %H:%M")
y<-strptime(datestring2,"%Y %m %d %H:%M")
head(x);head(y)

#날짜,시간 데이터 추가
data$date_D<-strptime(datestring1,"%Y %m %d %H:%M")
data$date_A<-strptime(datestring2,"%Y %m %d %H:%M")
data<-data[,-c(9,10,15)]
head(data)
data1<-data
data$dly_time<-data$date_A-data$date_D
data<-data[,-14]
write.csv(data,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/시간추가.csv",row.names=F)
table(data$dly_time/60)

#17년도 1/4분기
head(data$date_D)
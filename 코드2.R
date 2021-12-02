#운항실적 데이터(학습데이터)
data<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/2019빅콘테스트_퓨처스리그/AFSNT.csv",header=T,sep=',')
head(data)
nrow(data)

data_dly<-subset(data,DLY=='Y')
head(data_dly)
nrow(data_dly)
summary(data_dly)
plot(data_dly)
par(mfrow=c(1,2))
plot(data$STT)
plot(data_dly$STT)

#항공기별로 지연횟수비교
max(table(data_dly$REG))

#결항제거
delay_only<-data

#출발데이터
data_S<-subset(data,AOD=='D')
str(data_S)
table(data_S$AOD)

#지연데이터 (출발지연 : 85927, 도착지연 : 33010)
table(data_dly$AOD)




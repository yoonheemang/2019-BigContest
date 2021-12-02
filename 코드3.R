data<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/2019빅콘테스트_퓨처스리그/AFSNT.csv",header=T,sep=',')

#연,월,일 합치기
data$date_del<-paste(data$SDT_YY,data$SDT_MM,data$SDT_DD)
data<-data[,-c(1:3)]
head(data)

#출발,도착 데이터 나눠서 보기
data_D<-subset(data,AOD=='D')
data_A<-subset(data,AOD=='A')
nrow(data_D);nrow(data_A)

#지연데이터 중에서 출발,도착 나눠서 보기
data_dly<-subset(data,DLY=='Y')
dly_D<-subset(data_dly,AOD=='D')
dly_A<-subset(data_dly,AOD=='A')
nrow(dly_D);nrow(dly_A)

#지연데이터 중 출발,도착데이터 csv파일로 만들기
write.csv(dly_D,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/출발.csv",row.names=F)
write.csv(dly_D,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/도착.csv",row.names=F)

#출발데이터 일별로 지연횟수 구하기(년,월,일 합치기)
head(dly_D);nrow(dly_D)

#지연횟수 구하기
dly_D_count<-table(dly_D$date_del)
head(dly_D_count)
write.csv(dly_D_count,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/출발지연횟수.csv",row.names=F)
dly_A_count<-table(dly_A$date_del)
head(dly_A_count)
write.csv(dly_A_count,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/도착지연횟수.csv",row.names=F)


#지연확률 구하기(미완성)
table(data$date_del)
dly_D_freq<-dly_D_count/n
write.csv(dly_D_freq,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/출발지연횟수확률.csv",row.names=F)



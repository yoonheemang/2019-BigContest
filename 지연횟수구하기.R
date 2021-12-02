data<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/데이터/dly7.31.csv",header=T,sep=',')
head(data)
data9<-subset(data,MONTH==9)
data18<-subset(data9,YEAR==2018)
data17<-subset(data9,YEAR==2017)

head(data9)
write.csv(data9,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/9월데이터.csv",row.names=F)

#지연데이터 뽑기
dly<-subset(data9,D_DLY=='Y')
dly17<-subset(data17,D_DLY=='Y')
dly18<-subset(data18,D_DLY=='Y')
head(dly18)

#17,18데이터 합치기
d_17<-table(dly17$DAY)
d_18<-table(dly18$DAY)
d<-cbind(d_17,d_18)

#지연횟수 구하기
dly_D_count<-table(dly$DAY)
head(dly_D_count)
write.csv(d_18,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/9월출발지연횟수.csv",row.names=F)

table(data9$DAY_c)





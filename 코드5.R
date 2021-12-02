data<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/데이터/실제비행시간이상치제거.csv",header=T,sep=',')
data2<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/데이터/합친데이터_수정.csv",header=T,sep=',')
test<-read.table("C:/Users/a/Desktop/공모전/빅콘테스트/데이터/test_one.csv",header=T,sep=',')

#부정기편 삭제
data<-subset(data,IRR=='N')

head(data)
nrow(unique(data[,c(1,2)]))
nrow(data)
a<-data[duplicated(data[,c(1,2,5)]),]
b<-data[duplicated(data[,1:2])|duplicated(data[,1:2], fromLast=T),]

a1<-data[duplicated(data[,c(1,2,5)])|duplicated(data[,c(1,2,5)], fromLast=T),]
a2<-data2[duplicated(data2[,c(1,2,5)])|duplicated(data2[,c(1,2,5)], fromLast=T),]

a1
a2
nrow(a1);nrow(a2)

data1<-data
head(data1)
a<-substr(data$Dep_AP,4,5)
b<-substr(data$Arr_AP,4,5)
a<-as.numeric(a)
b<-as.numeric(b)

data1$dep_arr<-paste(a,',',b)
#data1$dep_arr2<-paste(data$Dep_AP,data$Arr_AP)
data1$dep_arr3<-(10*a+b)
head(data1)
data2<-data1

head(data2)
data2$dep_arr4<-(10*b+a)
data2$dep_arr5<-

#어디서 어디로 가는지 70종류(부정기편 제거 후 40종류)
length(unique(data1$dep_arr))

unique(data1$dep_arr2)
head(data)

table(data1$Dep_AP)
table(data1$Arr_AP)


head(data1)
write.csv(data1,"C:/Users/a/Desktop/공모전/빅콘테스트/데이터/data1.csv",row.names=F)







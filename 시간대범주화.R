##시간대 범주화 해보기
DTT_T<-as.integer(substr(train$DepTime,1,regexpr(':',train$DepTime)-1 ))
b_T<-DTT_T
b_T[(b_T>=5)&(b_T<=8)]<-1
b_T[(b_T>=9)&(b_T<=12)]<-2
b_T[(b_T>=13)&(b_T<=16)]<-3
b_T[(b_T>=17)&(b_T<=20)]<-4
b_T[((b_T>=21)&(b_T<=23))|(b_T==0)]<-5

table(b_T)
train$DTT_T1<-DTT_T
train$DTT_T2<-b_T

















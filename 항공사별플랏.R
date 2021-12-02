data<-data1
head(data)
nrow(data)
unique(data$Dep_AP)

dep1<-subset(data,Dep_AP=='ARP1')
table(dep1$Arr_AP)
fly1_2<-subset(dep1,Arr_AP=='ARP2')
fly1_3<-subset(dep1,Arr_AP=='ARP3')
fly1_4<-subset(dep1,Arr_AP=='ARP4')
fly1_5<-subset(dep1,Arr_AP=='ARP5')
fly1_6<-subset(dep1,Arr_AP=='ARP6')
fly1_7<-subset(dep1,Arr_AP=='ARP7')
fly1_8<-subset(dep1,Arr_AP=='ARP8')


plot(fly1_2$FLO,fly1_2$R_FLT_TIME);nrow(fly1_2)
plot(fly1_3$FLO,fly1_3$R_FLT_TIME);nrow(fly1_3)
plot(fly1_4$FLO,fly1_4$R_FLT_TIME);nrow(fly1_4)
plot(fly1_5$FLO,fly1_5$R_FLT_TIME);nrow(fly1_5)
plot(fly1_6$FLO,fly1_6$R_FLT_TIME);nrow(fly1_6)
plot(fly1_7$FLO,fly1_7$R_FLT_TIME);nrow(fly1_7)
plot(fly1_8$FLO,fly1_8$R_FLT_TIME);nrow(fly1_8)


dep2<-subset(data1,Dep_AP=='ARP2')
table(dep2$Arr_AP)
fly2_1<-subset(dep2,Arr_AP=='ARP1')
plot(fly2_1$FLO,fly2_1$R_FLT_TIME);nrow(fly2_1)
################################################################
table(data$Dep_AP)[order(-table(data$Dep_AP))]
dep3<-subset(data,Dep_AP=='ARP3')
table(dep3$Arr_AP)[order(-table(dep3$Arr_AP))]
fly3_1<-subset(dep3,Arr_AP=='ARP1')
fly3_2<-subset(dep3,Arr_AP=='ARP2')
fly3_15<-subset(dep3,Arr_AP=='ARP15')

par(mfrow=c(1,2))
plot(fly3_1$FLO,fly3_1$R_FLT_TIME,main='fly3to1');nrow(fly3_1)
plot(fly3_2$FLO,fly3_2$R_FLT_TIME,main='fly3to2');nrow(fly3_2)
plot(fly3_15$FLO,fly3_15$R_FLT_TIME,main='r_fly3to15');nrow(fly3_15)
plot(fly3_15$FLO,fly3_15$FLT_TIME,main='fly3to15');nrow(fly3_15)

dep1<-subset(data,Dep_AP=='ARP1')
table(dep1$Arr_AP)[order(-table(dep1$Arr_AP))]
fly1_3<-subset(dep1,Arr_AP=='ARP3')
fly1_2<-subset(dep1,Arr_AP=='ARP2')
plot(fly1_3$FLO,fly1_3$R_FLT_TIME,main='fly1to3');nrow(fly1_3)
plot(fly1_2$FLO,fly1_2$R_FLT_TIME,main='fly1to2');nrow(fly1_2)

dep2<-subset(data,Dep_AP=='ARP2')
table(dep2$Arr_AP)[order(-table(dep2$Arr_AP))]
fly2_3<-subset(dep2,Arr_AP=='ARP3')
fly2_1<-subset(dep2,Arr_AP=='ARP1')
plot(fly2_3$FLO,fly2_3$R_FLT_TIME,main='fly2to3');nrow(fly2_3)
plot(fly2_1$FLO,fly2_1$R_FLT_TIME,main='fly2to1');nrow(fly2_1)

table(data$FLT)
table(data$FLO)
table(data$D_DRR)



a<-data[which(data$FLT_TIME > UpperQ+IQR*3),]
b<-data[which(data$FLT_TIME < LowerQ-IQR*3),]
a
b












































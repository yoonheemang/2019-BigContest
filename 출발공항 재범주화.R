#출발공항 재범주화 (지연율 10%이하=1,사이=2,20%이상=3)
head(data)
head(dly_y)
aa<-table(dly_y$Dep_AP)/table(data$Dep_AP)
aa<-aa[order(-aa)]
aa #지연율이 0.2보다 큰,0.1보다 큰,0.1보다 작은
data$Dep_AP2<-recode(data$Dep_AP,"c('ARP13','ARP15','ARP3')=3;c('ARP8','ARP1','ARP6','ARP4','ARP2','ARP12')=2
						;c('ARP9','ARP14','ARP5','ARP7','ARP11')=1")
data1<-data
dat<-data1
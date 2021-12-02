head(data)
summary(data)

table(data$dep_arr2)
str(data)

nrow(data)
train<-data[sample(nrow(data),300000),] #랜덤하게 30만개 뽑음
test<-data[sample(nrow(data),150000),] #랜덤하게 15만개 뽑음
nrow(train);nrow(test)

data1<-data
data<-data1
table(data$D_DLY)
head(data)

#install.packages('car')
library(car)
#지연=1,지연x=0
data$D_DLY<-recode(data$D_DLY,"'N'=0;'Y'=1")
#data$D_DLY<-recode(data$D_DLY,"'Y'=1")
data$A_DLY<-recode(data$A_DLY,"'N'=0;'Y'=1")

model<-glm(D_DLY~Dep_AP+FLO+DTT_T2+MONTH+DAY_c,data=train,family="binomial")
summary(model)

anova(model,test="Chisq")
p<-predict(model,newdata=test,type='response')
round(p) #모든 것을 0으로 예측
table(round(p),test$D_DLY) #전부 0으로 예측했을때 정확도 85%

#모델평가
#install.packages('pscl')
library(pscl)
pR2(model) #모델이 train 데이터셋의 분산의 0.8%밖에 설명해주지 못한다.->완전x

#install.packages('ROCR')
library(ROCR)
p <- predict(model, newdata=test, type="response")
pr <- prediction(p, test$D_DLY)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

#AUC판단기준(excellent =  0.9~1,good = 0.8~0.9,fair = 0.7~0.8,poor = 0.6~0.7,fail = 0.5~0.6)
auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc #0.579 -> 즉, 실패(무작위로 예측한 모델과 다를바 없음)




head(data)

model<-glm(D_DLYT~FLT_TIME+Dep_AP+FLO+DTT_T2+MONTH+DAY_c,data=train)
summary(model)

anova(model,test="Chisq")
p<-predict(model,newdata=test)
round(p) #모든 것을 0으로 예측
table(round(p),test$D_DLYT) #전부 0으로 예측했을때 정확도 85%
a<-round(p)
a[a<=30]<-0;a[a>30]<-1
table(a)
table(a,test$D_DLY) #전부 0으로 예측했을때 정확도 85%

#예측 정확도
t_a<-table(a,test$D_DLY)
(t_a[1,1]+t_a[2,2])/length(a)

#틀리게 예측한 것들 추출(XXXXXX)
head(train)
train$DLY_p<-a
no<-train[train$D_DLY!=train$DLY_p,] #틀리게 예측한 것들=no
nrow(no)

head(no)
table(no$Dep_AP)/table(train$Dep_AP)

#예측이 틀린 데이터로의 모델
model_no<-glm(D_DLYT~FLT_TIME+Dep_AP+FLO+DTT_T2+MONTH+DAY_c,data=no)
p<-predict(model_no,newdata=train)
a<-round(p)
a[a<=30]<-0;a[a>30]<-1
table(a,train$D_DLY)
t_a<-table(a,train$D_DLY)
(t_a[1,1]+t_a[2,2])/length(a)


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




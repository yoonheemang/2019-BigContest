model<-glm(A_DLY~FLT_TIME+R_FLT_TIME+FLO,data=train2,family="binomial")
summary(model)

anova(model,test="Chisq")
p<-predict(model,newdata=test,type='response')
round(p) 
table(round(p),test$A_DLY) #예측 정확도 95%

#모델평가
#install.packages('pscl')
library(pscl)
pR2(model) #모델이 train 데이터셋의 분산의 4%밖에 설명해주지 못한다.->완전x

#install.packages('ROCR')
library(ROCR)
p <- predict(model, newdata=test2, type="response")
pr <- prediction(p, test2$A_DLY)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

#AUC판단기준(excellent =  0.9~1,good = 0.8~0.9,fair = 0.7~0.8,poor = 0.6~0.7,fail = 0.5~0.6)
auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc #0.637 -> 즉, poor(무작위로 예측한 모델과 다를바 없음)


#Read in the data
all_data <- read.csv("Obituaries_Dataset.csv", header = TRUE)

#load required libraries
library("survival")
library("survminer")

#Load survival data
survival_data <- read.csv("survival_data.csv", header = TRUE)

#Calculating the Kaplan-Meier estimate
KM_fit <- survfit(Surv(Age, Spouse_Alive_Status) ~ 1, data = survival_data)

#Checing survival times for certain groups
summary(KM_fit, times = c(70, 80))

ggsurvplot(KM_fit, data = survival_data)

plot(KM_fit, xlab = "Time to Death (Years)", ylab = "Survival Probability", 
     main = "Kaplan-Meier Estimate of S(t) for the Daily Nation Data")


##

#Create a Kaplan-meier survival curve using one of the following variables;
#gender, colour, fundraising, spouse alive, spouse gender. 
#Explain the difference/significance of the result. 
#oad libraries
library("survival")
library("splines")
library("lattice")
library("JM")

#Load data
data("aids", package = "JM")
data("aids.id", package = "JM")
data("pbc2.id", package = "JM")
data("lung", package = "survival")
data("stanford2", package = "survival")

lung$sex <- factor(lung$sex, levels = 1:2, labels = c("male", "female"))
lung <- with(lung, lung[complete.cases(time, status, sex, age, ph.karno), ])

KM_fit <- survfit(Surv(time, status) ~ 1, data = stanford2)
KM_fit

summary(KM_fit, times = c(1000, 2000))

plot(KM_fit, xlab = "Time to Death (days)", ylab = "Survival Probability", 
     main = "Kaplan-Meier Estimate of S(t) for the Stanford Data")


##Machine learning using Logistic 
#load data
task2_data = read.csv("survival_data.csv", header = TRUE)
#Creating Baseline model
table_ = table(task2_data$Fundraising_Status)
print(table_)

#Baseline accuracy in Percentage
baseline_acc = ((table_[1]/dim(task2_data)[1])*100)
print(baseline_acc)

#Using CaTools to randomly divide the data into Training and Test set
library(caTools)
set.seed(67)
split = sample.split(task2_data$Fundraising_Status, SplitRatio = 0.75)

task2_Train = subset(task2_data, split == TRUE)
task2_Test = subset(task2_data, split == FALSE)

# Logistic Regression Model
glm.fit = glm(Fundraising_Status ~  Age +No_of_Relatives,data=task2_Train, family=binomial)
summary(glm.fit)

#Making predictions on Training set
#Looking for threshold to use
glm.probs <- predict(glm.fit,type = "response")
glm.probs[1:5]
summary(glm.probs)

#I'll turn the probabilities into classifications by thresholding at 0.5.
#In order to do so, I use an ifelse() command
glm.pred <- ifelse(glm.probs > 0.65, 0, 1)

#Create confusion Matrix
attach(task2_Train)
table(glm.pred,Fundraising_Status)

mean(glm.pred == Fundraising_Status)

############

############
glm.probs <- predict(glm.fit,type = "response",newdata = task2_Test)
glm.pred <- ifelse(glm.probs > 0.65, 0, 1)
table(glm.pred,task2_Test$Fundraising_Status)
mean(glm.pred == task2_Test$Fundraising_Status)


### Finding Threshhold
predictTrain = predict(glm.fit, type="response")
summary(predictTrain)
tapply(predictTrain, task2_Train$Fundraising_Status, mean)
table(task2_Train$Fundraising_Status, predictTrain > 0.65)

library(ROCR)
ROCRpred = prediction(predictTrain, task2_Train$Fundraising_Status)
ROCRperf = performance(ROCRpred, "tpr", "fpr")
plot(ROCRperf)
plot(ROCRperf, colorize=TRUE)
plot(ROCRperf, colorize=TRUE, print.cutoffs.at=seq(0,1,by=0.1), text.adj=c(-0.2,1.7))
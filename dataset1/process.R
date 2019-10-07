r2 <- c()
for (i in 0:99) {
  filename <- sprintf("data%02d.txt",i)
  data <- read.table(filename, header=F)
  r2[i+1] <- summary(lm(data$V2~data$V1))$r.squared
  ##memo <- sprintf("%s: %f",filename,r2[i+1])
  ##print(memo)
}
max.r2 <-max(r2)
max.r2.index <- which.max(r2)-1
##memo <- sprintf(" The largest R2 value was %f in data file: data%02d.txt",max.r2, max.r2.index)
##print(memo)
filename <- sprintf("data%02d.txt",max.r2.index)
data <- read.table(filename, header=F)
png("R2hist.png")
hist(r2,breaks=20)
dev.off()
png("Bestfit.png")
model <- lm(data$V2~data$V1)
title <- sprintf("Fit for data in data%02d.txt, R^2=%f",max.r2.index,max.r2)
plot(data$V2~data$V1,main=title)
abline(model)
dev.off()

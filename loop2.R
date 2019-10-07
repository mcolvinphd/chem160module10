n <- 100000000
y <- vector(mode="numeric",length=n)
for (i in 1:n) {
    x<-rnorm(1)
    y[i]<-10*x
}
stdev<-sd(y)
cat("SD=",stdev,"\n")

#install.packages("RColorBrewer")
#install.packages("packHV")
library("RColorBrewer")
library("packHV")

colors = brewer.pal(n = 4, name = "Dark2")
temp = read.table("runtimes.csv", header=T, sep=",")

maximums = c(max(temp$Linear.Search.Sorted),max(temp$Linear.Search.Unsorted),max(temp$Binary.Search.Sorted),max(temp$Binary.Search.Unsorted))
maximums_noBSU = c(max(temp$Linear.Search.Sorted),max(temp$Linear.Search.Unsorted),max(temp$Binary.Search.Sorted))

## Display data as is
hist_boxplot(log(temp$Linear.Search.Sorted),col=colors[1],main="Linear Search Sorted")
hist_boxplot(log(temp$Linear.Search.Unsorted),col=colors[2],main="Linear Search Unsorted")
hist_boxplot(log(temp$Binary.Search.Sorted),col=colors[3],main="Binary Search Sorted")
hist_boxplot(log(temp$Binary.Search.Unsorted),col=colors[4],main="Binary Search Unsorted")


plot(temp$Linear.Search.Sorted,type = "p",col = colors[1], xlab = "Run Number", ylab = "Runtime in log(nanoseconds)", main = "Runtime for different algorithms",log = 'y',ylim=range(100,max(maximums_noBSU)))
abline(h=mean(temp$Linear.Search.Sorted),col = colors[1],lwd=3)
lines(temp$Linear.Search.Unsorted, type = "p", col = colors[2])
abline(h=mean(temp$Linear.Search.Unsorted),col = colors[2],lwd=3)
lines(temp$Binary.Search.Sorted, type = "p", col = colors[3])
abline(h=mean(temp$Binary.Search.Sorted),col = colors[3],lwd=3)
legend(0,500,c("Linear Search Sorted","Linear Search Unsorted","Binary Search Sorted"), lwd=c(5,2), col=colors, pch=c(15,19), y.intersp=1.5)

plot(temp$Linear.Search.Sorted,type = "p",col = colors[1], xlab = "Run Number", ylab = "Runtime in log(nanoseconds)", main = "Runtime for different algorithms",log = 'y',ylim=range(100,max(maximums)))
abline(h=mean(temp$Linear.Search.Sorted),col = colors[1],lwd=3)
lines(temp$Linear.Search.Unsorted, type = "p", col = colors[2])
abline(h=mean(temp$Linear.Search.Unsorted),col = colors[2],lwd=3)
lines(temp$Binary.Search.Sorted, type = "p", col = colors[3])
abline(h=mean(temp$Binary.Search.Sorted),col = colors[3],lwd=3)
lines(temp$Binary.Search.Unsorted, type = "p", col = colors[4])
abline(h=mean(temp$Binary.Search.Unsorted),col = colors[4],lwd=3)
legend(0,500,c("Linear Search Sorted","Linear Search Unsorted","Binary Search Sorted","Binary Search Unsorted"), lwd=c(5,2), col=colors, pch=c(15,19), y.intersp=1.5)

## calculate outliers
outliers <- boxplot(temp$Linear.Search.Sorted)$out
Linear.Search.Sorted.NoOutliers <- temp$Linear.Search.Sorted[-which(temp$Linear.Search.Sorted %in% outliers)]

outliers <- boxplot(temp$Linear.Search.Unsorted)$out
Linear.Search.Unsorted.NoOutliers <- temp$Linear.Search.Unsorted[-which(temp$Linear.Search.Unsorted %in% outliers)]

outliers <- boxplot(temp$Binary.Search.Sorted)$out
Binary.Search.Sorted.NoOutliers <- temp$Binary.Search.Sorted[-which(temp$Binary.Search.Sorted %in% outliers)]

outliers <- boxplot(temp$Binary.Search.Unsorted)$out
Binary.Search.Unsorted.NoOutliers <- temp$Binary.Search.Unsorted[-which(temp$Binary.Search.Unsorted %in% outliers)]

maximums_nooutliers = c(max(Linear.Search.Sorted.NoOutliers),max(Linear.Search.Unsorted.NoOutliers),max(Binary.Search.Sorted.NoOutliers),max(Binary.Search.Unsorted.NoOutliers))
maximums_nooutliers_noBSU = c(max(Linear.Search.Sorted.NoOutliers),max(Linear.Search.Unsorted.NoOutliers),max(Binary.Search.Sorted.NoOutliers))

## display data without outliers
hist_boxplot(Linear.Search.Sorted.NoOutliers,col=colors[1],main="Linear Search Sorted No Outliers")
hist_boxplot(Linear.Search.Unsorted.NoOutliers,col=colors[1],main="Linear Search Unsorted No Outliers")
hist_boxplot(Binary.Search.Sorted.NoOutliers,col=colors[3],main="Binary Search Sorted No Outliers")
hist_boxplot(Binary.Search.Unsorted.NoOutliers,col=colors[4],main="Binary Search Unsorted No Outliers")



plot(Linear.Search.Sorted.NoOutliers,type = "p",col = colors[1], xlab = "Run Number", ylab = "Runtime in log(nanoseconds) Outliers Removed", main = "Runtime for different algorithms",log = 'y',ylim=range(100,max(maximums_nooutliers_noBSU)))
abline(h=mean(Linear.Search.Sorted.NoOutliers),col = colors[1],lwd=3)
lines(Linear.Search.Unsorted.NoOutliers, type = "p", col = colors[2])
abline(h=mean(Linear.Search.Unsorted.NoOutliers),col = colors[2],lwd=3)
lines(Binary.Search.Sorted.NoOutliers, type = "p", col = colors[3])
abline(h=mean(Binary.Search.Sorted.NoOutliers),col = colors[3],lwd=3)
legend(0,500,c("Linear Search Sorted","Linear Search Unsorted","Binary Search Sorted"), lwd=c(5,2), col=colors, pch=c(15,19), y.intersp=1.5)



plot(Linear.Search.Sorted.NoOutliers,type = "p",col = colors[1], xlab = "Run Number", ylab = "Runtime in log(nanoseconds)", main = "Runtime for different algorithms",log = 'y',ylim=range(100,max(maximums_nooutliers)))
abline(h=mean(Linear.Search.Sorted.NoOutliers),col = colors[1],lwd=3)
lines(Linear.Search.Unsorted.NoOutliers, type = "p", col = colors[2])
abline(h=mean(Linear.Search.Unsorted.NoOutliers),col = colors[2],lwd=3)
lines(Binary.Search.Sorted.NoOutliers, type = "p", col = colors[3])
abline(h=mean(Binary.Search.Sorted.NoOutliers),col = colors[3],lwd=3)
lines(Binary.Search.Unsorted.NoOutliers, type = "p", col = colors[4])
abline(h=mean(Binary.Search.Unsorted.NoOutliers),col = colors[4],lwd=3)
legend(0,500,c("Linear Search Sorted","Linear Search Unsorted","Binary Search Sorted","Binary Search Unsorted"), lwd=c(5,2), col=colors, pch=c(15,19), y.intersp=1.5)
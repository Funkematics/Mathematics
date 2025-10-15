load("earnings10.dat")
load("earnings100.dat")
load("earnings1000.dat")

estimate_p <- function(earnings, n) {
  p <- (mean(earnings) + 9) / 24
  cat("Problem 2: n =", n, "p =", round(p, 4), "\n")
  p
}

p10 <- estimate_p(earnings10, 10)
p100 <- estimate_p(earnings100, 100)
p1000 <- estimate_p(earnings1000, 1000)

png("figures/problem2.png", width=1000, height=800, res=120)
par(mfrow=c(2,2), mar=c(4,4,3,1))
hist(earnings10, main="n=10", xlab="Earnings ($)", col="lightcoral", 
     breaks=seq(min(earnings10)-1, max(earnings10)+1, by=1))
abline(v=mean(earnings10), col="blue", lwd=2)
legend("topright", paste("p =", round(p10, 3)), cex=0.9, bty="n")

hist(earnings100, main="n=100", xlab="Earnings ($)", col="lightblue", breaks=20)
abline(v=mean(earnings100), col="blue", lwd=2)
legend("topright", paste("p =", round(p100, 3)), cex=0.9, bty="n")

hist(earnings1000, main="n=1000", xlab="Earnings ($)", col="lightgreen", breaks=30)
abline(v=mean(earnings1000), col="blue", lwd=2)
legend("topright", paste("p =", round(p1000, 3)), cex=0.9, bty="n")

barplot(c(p10, p100, p1000), names.arg=c("n=10", "n=100", "n=1000"),
        main="Estimated p", ylab="p", col=c("lightcoral", "lightblue", "lightgreen"), ylim=c(0, 1))
abline(h=0.5, col="gray", lty=2)
dev.off()

cat("\nBest estimate: p =", round(p1000, 4), "\n")

if (!dir.exists("figures")) dir.create("figures")

sample_sizes <- c(10, 25, 50, 100)

simulate_earnings <- function(n) {
  0.25 * rowSums(matrix(sample(1:6, 5*n, replace=TRUE), ncol=5))
}

theoretical_ev <- 4.375

png("figures/problem1b.png", width=1000, height=800, res=120)
par(mfrow=c(2,2), mar=c(4,4,3,1))
for(n in sample_sizes) {
  earnings <- simulate_earnings(n)
  hist(earnings, main=paste("n =", n), xlab="Earnings ($)", col="lightblue", breaks=15)
  abline(v=theoretical_ev, col="red", lwd=2, lty=2)
  abline(v=mean(earnings), col="blue", lwd=2)
  legend("topright", c(paste("Theoretical:", theoretical_ev), paste("Simulated:", round(mean(earnings), 3))), 
         col=c("red", "blue"), lty=c(2, 1), lwd=2, cex=0.7)
  cat("1b: n =", n, "Mean = $", round(mean(earnings), 4), "\n")
}
dev.off()

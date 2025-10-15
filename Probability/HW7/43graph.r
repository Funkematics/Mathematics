# Exercise 4.3(a)
png("exercise_4_3a.png", width=800, height=600, res=120)

p <- 0.6  # Example value
q <- 1 - p

y_vals <- c(-1, 0, 1, 2)
F_vals <- c(0, q, 1, 1)

plot(y_vals, F_vals, type="n", 
     xlab="y", ylab="F(y)", 
     main=paste("Bernoulli Distribution Function (p =", p, ")"),
     ylim=c(0, 1.1), xlim=c(-1, 2))

# Draw horizontal segments
segments(x0=-1, x1=0, y0=0, y1=0, lwd=2, col="blue")
segments(x0=0, x1=1, y0=q, y1=q, lwd=2, col="blue")
segments(x0=1, x1=2, y0=1, y1=1, lwd=2, col="blue")

# Add solid points at the left endpoints
points(c(0, 1), c(q, 1), pch=19, col="blue", cex=1.5)

# Add open points at the right endpoints
points(c(0), c(0), pch=1, col="blue", cex=1.5, lwd=2)

# Add labels
text(0.5, q, paste("q =", q), pos=3)
text(1.5, 1, "1", pos=3)

grid()

dev.off()

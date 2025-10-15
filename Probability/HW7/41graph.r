# Exercise 4.1(b)
png("exercise_4_1b.png", width=800, height=600, res=120)

y_vals <- c(-1, 1, 2, 3, 4, 5)
F_vals <- c(0, 0.4, 0.7, 0.9, 1.0, 1.0)

plot(y_vals, F_vals, type="n", 
     xlab="y", ylab="F(y)", 
     main="Distribution Function for Exercise 4.1",
     ylim=c(0, 1.1), xlim=c(-1, 5))

# Draw horizontal segments
segments(x0=-1, x1=1, y0=0, y1=0, lwd=2, col="blue")
segments(x0=1, x1=2, y0=0.4, y1=0.4, lwd=2, col="blue")
segments(x0=2, x1=3, y0=0.7, y1=0.7, lwd=2, col="blue")
segments(x0=3, x1=4, y0=0.9, y1=0.9, lwd=2, col="blue")
segments(x0=4, x1=5, y0=1.0, y1=1.0, lwd=2, col="blue")

# Add solid points at the left endpoints (closed circles)
points(c(1, 2, 3, 4), c(0.4, 0.7, 0.9, 1.0), pch=19, col="blue", cex=1.5)

# Add open points at the right endpoints (open circles)
points(c(1, 2, 3), c(0, 0.4, 0.7), pch=1, col="blue", cex=1.5, lwd=2)

grid()

dev.off()

png("exercise_4_19.png", width=1200, height=600, res=120)

par(mfrow=c(1,2))

# Distribution function F(y) - CONTINUOUS everywhere
y <- seq(-0.5, 5, length.out=1000)
F_y <- ifelse(y <= 0, 0,
              ifelse(y < 2, y/8,
                     ifelse(y < 4, y^2/16, 1)))

plot(y, F_y, type="l", lwd=2, col="blue",
     xlab="y", ylab="F(y)",
     main="Distribution Function F(y) - Continuous",
     ylim=c(0, 1.1))
abline(h=c(0, 1), col="gray", lty=2)
abline(v=c(0, 2, 4), col="gray", lty=2)
grid()

# Mark continuity at y=2
points(2, 1/4, pch=19, col="darkgreen", cex=1.5)
text(2, 1/4, "F continuous at y=2", pos=4, col="darkgreen")

# Density function f(y) - has a JUMP at y=2
y_dense <- seq(-0.5, 5, length.out=1000)

# Split into regions to show the jump
y1 <- seq(0.01, 1.99, length.out=100)
y2 <- seq(2.01, 3.99, length.out=100)

plot(c(-0.5, 5), c(0, 0.6), type="n",
     xlab="y", ylab="f(y)",
     main="Density Function f(y) - Jump at y=2")
abline(h=0, col="gray")
abline(v=c(0, 2, 4), col="gray", lty=2)
grid()

# Plot first piece: f(y) = 1/8 for 0 < y < 2
segments(0, 1/8, 2, 1/8, lwd=3, col="red")
points(0, 1/8, pch=1, col="red", cex=1.5, lwd=2)  # open circle
points(2, 1/8, pch=1, col="red", cex=1.5, lwd=2)  # open circle

# Plot second piece: f(y) = y/8 for 2 < y < 4
lines(y2, y2/8, lwd=3, col="red")
points(2, 2/8, pch=1, col="red", cex=1.5, lwd=2)  # open circle
points(4, 4/8, pch=1, col="red", cex=1.5, lwd=2)  # open circle

# Show the jump at y=2
arrows(2, 1/8, 2, 2/8, length=0.1, code=3, col="darkred", lwd=2)
text(2.3, 0.19, "Jump in density\nat y=2", col="darkred", cex=0.9)

# Label the two pieces
text(1, 1/8 + 0.03, "f(y) = 1/8", col="red", pos=3)
text(3, 3/8 + 0.03, "f(y) = y/8", col="red", pos=3)

dev.off()


# Exercise 4.17(c)
png("exercise_4_17c.png", width=1200, height=600, res=120)

par(mfrow=c(1,2))

# Density function f(y) = 3/2 * y^2 + y
y <- seq(-0.2, 1.2, length.out=1000)
f_y <- ifelse(y >= 0 & y <= 1, 1.5*y^2 + y, 0)

plot(y, f_y, type="l", lwd=2, col="blue",
     xlab="y (hours)", ylab="f(y)",
     main="Density Function f(y) = (3/2)y² + y",
     ylim=c(0, 2.7))
abline(h=0, col="gray")
abline(v=c(0, 1), col="gray", lty=2)
grid()

# Shade the area under the curve
y_shade <- seq(0, 1, length.out=100)
f_shade <- 1.5*y_shade^2 + y_shade
polygon(c(0, y_shade, 1), c(0, f_shade, 0), 
        col=rgb(0, 0, 1, 0.3), border=NA)

# Distribution function F(y) = y^2(y+1)/2
F_y <- ifelse(y < 0, 0, 
              ifelse(y <= 1, y^2*(y+1)/2, 1))

plot(y, F_y, type="l", lwd=2, col="red",
     xlab="y (hours)", ylab="F(y)",
     main="Distribution Function F(y) = y²(y+1)/2",
     ylim=c(0, 1.1))
abline(h=c(0, 1), col="gray", lty=2)
abline(v=c(0, 1), col="gray", lty=2)
grid()

# Mark F(0.5)
points(0.5, 0.5^2*(0.5+1)/2, pch=19, col="darkgreen", cex=1.5)
text(0.5, 0.5^2*(0.5+1)/2, "F(0.5) = 0.1875", pos=4, col="darkgreen")

dev.off()

# Exercise 4.11(c)
png("exercise_4_11c.png", width=1200, height=600, res=120)

par(mfrow=c(1,2))

# Density function f(y)
y <- seq(-0.5, 2.5, length.out=1000)
f_y <- ifelse(y >= 0 & y <= 2, y/2, 0)

plot(y, f_y, type="l", lwd=2, col="blue",
     xlab="y", ylab="f(y)",
     main="Density Function f(y) = y/2",
     ylim=c(0, 1.2))
abline(h=0, col="gray")
abline(v=0, col="gray")
grid()

# Shade the area under the curve
y_shade <- seq(0, 2, length.out=100)
f_shade <- y_shade/2
polygon(c(0, y_shade, 2), c(0, f_shade, 0), 
        col=rgb(0, 0, 1, 0.3), border=NA)

# Distribution function F(y)
F_y <- ifelse(y < 0, 0, ifelse(y <= 2, y^2/4, 1))

plot(y, F_y, type="l", lwd=2, col="red",
     xlab="y", ylab="F(y)",
     main="Distribution Function F(y) = y²/4",
     ylim=c(0, 1.1))
abline(h=c(0, 1), col="gray", lty=2)
abline(v=0, col="gray")
grid()

dev.off()

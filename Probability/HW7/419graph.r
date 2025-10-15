# Exercise 4.19 - Distribution and Density Functions
png("exercise_4_19.png", width=1200, height=600, res=120)

par(mfrow=c(1,2))

# Distribution function F(y)
y <- seq(-0.5, 5, length.out=1000)
F_y <- ifelse(y <= 0, 0,
              ifelse(y < 2, y/8,
                     ifelse(y < 4, y^2/16, 1)))

plot(y, F_y, type="l", lwd=2, col="blue",
     xlab="y", ylab="F(y)",
     main="Distribution Function F(y)",
     ylim=c(0, 1.1))
abline(h=c(0, 1), col="gray", lty=2)
abline(v=c(0, 2, 4), col="gray", lty=2)
grid()

# Mark important points
points(c(2, 4), c(2/8, 1), pch=19, col="red", cex=1.2)

# Density function f(y)
y_dense <- seq(-0.5, 5, length.out=1000)
f_y <- ifelse(y_dense > 0 & y_dense < 2, 1/8,
              ifelse(y_dense > 2 & y_dense < 4, y_dense/8, 0))

plot(y_dense, f_y, type="l", lwd=2, col="red",
     xlab="y", ylab="f(y)",
     main="Density Function f(y)",
     ylim=c(0, 0.6))
abline(h=0, col="gray")
abline(v=c(0, 2, 4), col="gray", lty=2)
grid()

# Shade regions
y1 <- seq(0.01, 1.99, length.out=50)
polygon(c(0, 2, 2, 0), c(0, 0, 1/8, 1/8), 
        col=rgb(1, 0, 0, 0.3), border=NA)

y2 <- seq(2.01, 3.99, length.out=50)
f2 <- y2/8
polygon(c(2, y2, 4), c(0, f2, 0), 
        col=rgb(1, 0, 0, 0.3), border=NA)

# Note about discontinuity at y=2
text(2, 0.3, "Discontinuity at y=2", pos=4, col="darkred")

dev.off()

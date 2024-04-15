####### 仮想データの生成 ######

#set.seed(3150)
x <- seq(-15, 15, len = 300)
#y <- c(rnorm(1, 0, 10))
#for (i in 1:(length(x) - 1)){
#  y <- c(y, rnorm(1, y[i], .1))
#}
y <- 6*sin(x + pi/2) - 5*cos(x/3) + log(tanh(x)^8 + 1) - .5*x + rnorm(length(x), 0, 3)
plot(x, y)

##### 普通の線形回帰 #####
formula <- y ~ x
model_ols <- lm(formula)
pred_ols <- predict(model_ols, data.frame(x))
plot(x, y)
lines(x, pred_ols, col = "springgreen", lwd = 3)
curve(6*sin(x + pi/2) - 5*cos(x/3) + log(tanh(x)^8 + 1) - .5*x, from = -15, to = 15, 
      add = T, col = "red", lwd = 3)

# 10次関数
formula <- y ~ x + I(x^2) + I(x^3) + I(x^4) + I(x^5) + I(x^6) + I(x^7) + I(x^8) + I(x^9) + I(x^10)
model_ols2 <- lm(formula)
pred_ols2 <- predict(model_ols2, data.frame(x))
plot(x, y)
lines(x, pred_ols2, col = "springgreen", lwd = 3)
curve(6*sin(x + pi/2) - 5*cos(x/3) + log(tanh(x)^8 + 1) - .5*x, from = -15, to = 15, 
      add = T, col = "red", lwd = 3)

# それっぽい線形予測子を立てる
formula <- y ~ sin(x) + cos(x) + log(tanh(x) + 1) + x
model_ols3 <- lm(formula)
pred_ols3 <- predict(model_ols3, data.frame(x))
plot(x, y)
lines(x, pred_ols3, col = "springgreen", lwd = 3)
curve(6*sin(x + pi/2) - 5*cos(x/3) + log(tanh(x)^8 + 1) - .5*x, from = -15, to = 15, 
      add = T, col = "red", lwd = 3)

##### ガウス基底関数のパワーを感じよう ######
# ガウス基底関数の定義
gauss_b <- function(x, mu, s){
  return( exp(-(x - mu)^2 / 2*s^2) )
}

# 基底関数を少しだけ用意
formula <- y ~ gauss_b(x, -10, 1) + gauss_b(x, 0, 1) + gauss_b(x, 10, 1)
base_model1 <- lm(formula)
pred_base1 <- predict(base_model1, data.frame(x))
plot(x, y)
lines(x, pred_base1, col = "cyan", lwd = 3)
curve(6*sin(x + pi/2) - 5*cos(x/3) + log(tanh(x)^8 + 1) - .5*x, from = -15, to = 15, 
      add = T, col = "red", lwd = 3)

# 基底関数を少しだけ用意
formula <- y ~ gauss_b(x, -15, 1) + gauss_b(x, -10, 1) + gauss_b(x, -5, 1) + 
  gauss_b(x, 0, 1) + gauss_b(x, 5, 1) + gauss_b(x, 10, 1) + gauss_b(x, 15, 1)
base_model2 <- lm(formula)
pred_base2 <- predict(base_model2, data.frame(x))
plot(x, y)
lines(x, pred_base2, col = "turquoise4", lwd = 3)
curve(6*sin(x + pi/2) - 5*cos(x/3) + log(tanh(x)^8 + 1) - .5*x, from = -15, to = 15, 
      add = T, col = "red", lwd = 3)

# 基底関数をたくさん用意
formula <- y ~ gauss_b(x, -15, 1) + gauss_b(x, -14, 1) + gauss_b(x, -13, 1) + gauss_b(x, -12, 1) +
  gauss_b(x, -11, 1) + gauss_b(x, -10, 1) + gauss_b(x, -9, 1) + gauss_b(x, -8, 1) + gauss_b(x, -7, 1) +
  gauss_b(x, -6, 1) + gauss_b(x, -5, 1) + gauss_b(x, -4, 1) + gauss_b(x, -3, 1) +gauss_b(x, -2, 1) + 
  gauss_b(x, -1, 1) + gauss_b(x, 0, 1) + gauss_b(x, 1, 1) +gauss_b(x, 2, 1) + gauss_b(x, 3, 1) + 
  gauss_b(x, 4, 1) + gauss_b(x, 5, 1) + gauss_b(x, 6, 1) + gauss_b(x, 7, 1) + gauss_b(x, 8, 1) + 
  gauss_b(x, 9, 1) + gauss_b(x, 10, 1) + gauss_b(x, 11, 1) + gauss_b(x, 12, 1) + gauss_b(x, 13, 1) + 
  gauss_b(x, 14, 1) + gauss_b(x, 15, 1)
# 回帰モデルを実行
base_model3 <- lm(formula)
pred_base3 <- predict(base_model3, data.frame(x))
plot(x, y)
lines(x, pred_base3, col = "royalblue", lwd = 3)
curve(6*sin(x + pi/2) - 5*cos(x/3) + log(tanh(x)^8 + 1) - .5*x, from = -15, to = 15, 
      add = T, col = "red", lwd = 3)

##### ガウス過程回帰 #####
formula <- y ~ x
fit <- kernlab::gausspr(formula, variance.model = T)
pred_gpr <- predict(fit, x)
plot(x, y)
lines(x, pred_gpr, col = "salmon", lwd = 3)
curve(6*sin(x + pi/2) - 5*cos(x/3) + log(tanh(x)^8 + 1) - .5*x, from = -15, to = 15, 
      add = T, col = "red", lwd = 3)
  
# それぞれのモデルの比較
plot(x, y)
lines(x, pred_ols2, col = "springgreen", lwd = 3)
lines(x, pred_base1, col = "cyan", lwd = 3)
lines(x, pred_base2, col = "turquoise3", lwd = 3)
lines(x, pred_base3, col = "royalblue", lwd = 3)
lines(x, pred_gpr, col = "salmon", lwd = 3)
curve(6*sin(x + pi/2) - 5*cos(x/3) + log(tanh(x)^8 + 1) - .5*x, from = -15, to = 15, 
      add = T, col = "red", lwd = 3)





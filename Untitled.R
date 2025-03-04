# ---------- 1. 生成模拟数据 ----------
set.seed(123)  # 固定随机种子，确保结果可重复

# 创建数据框：自变量X和因变量Y
n <- 100  # 样本量
X <- rnorm(n, mean = 10, sd = 2)  # 生成正态分布的X
Y <- 3*X + rnorm(n, mean = 0, sd = 5)  # Y = 3X + 噪声

# 将数据合并为数据框
my_data <- data.frame(X = X, Y = Y)

# 查看前6行数据
head(my_data)

# ---------- 2. 建立线性回归模型 ----------
model <- lm(Y ~ X, data = my_data)

# ---------- 3. 查看模型结果 ----------
summary(model)  # 输出系数、p值、R²等

# ---------- 4. 模型诊断图 ----------
par(mfrow = c(2, 2))  # 将画布分为2x2区域
plot(model)           # 绘制残差图、QQ图等
par(mfrow = c(1, 1))  # 恢复单图模式

# ---------- 5. 预测新数据 ----------
new_X <- data.frame(X = c(8, 12, 15))  # 新自变量值
predicted_Y <- predict(model, newdata = new_X)

# 输出预测值
print(predicted_Y)

model$coefficients


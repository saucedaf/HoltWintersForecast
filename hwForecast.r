
MCL = countForSeasonality$count
trend_customers_joining = ts(MCL,start=c(2013,1),end=c(2014,10),frequency=10)
trend_customers_joining
plot(trend_customers_joining)
s.decompose=decompose(trend_customers_joining)
plot(s.decompose)
s.decompose
r = s.decompose$seasonal
summary(r)

hw = HoltWinters(trend_customers_joining)
plot(hw)
hw$SSE
n=nrow(hw$fitted)
rmse=sqrt(hw$SSE/n)
rmse
forecast = predict(hw, n.ahead =2, prediction.interval = T, level = 0.95)
plot(hw, forecast)
forecast


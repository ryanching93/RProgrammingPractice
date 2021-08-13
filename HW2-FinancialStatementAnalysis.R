#Data: creating vectors
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
#additional vector 
month <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

#Solution
#profit for each month
profit <- revenue - expenses
names(profit) <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
profit

#profit after tax for each month (tax rate = 30%)
tax <- round(profit * 0.3, 2)
profit.after.tax <- profit - tax
names(profit.after.tax) <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
profit.after.tax

#profit margin for each month (equals to profit after tax/ revenue)
profit.margin <- round(profit.after.tax / revenue, 2) * 100 #multiplied by 100 to get %
names(profit.margin) <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
profit.margin

#good months - where the profit after tax was greater than the mean(average) for the year
#first, find the mean profit after tax for the year
mean.pat <- mean(profit.after.tax)
mean.pat

good.months <- profit.after.tax > mean.pat
month.name[good.months] 
#month.name is a built in constant

#bad months - where the profit after tax was less than the mean for the year
bad.months <- !good.months
month.name[bad.months]

#the best month - profit after tax was max for the year
best.month <- profit.after.tax == max(profit.after.tax)

#the worst month - profit after tax was min for the year 
worst.month <- profit.after.tax == min(profit.after.tax)

#rounding our numbers to thousands (no decimals)
revenue.1000 <- round(revenue/1000)
expenses.1000 <- round(expenses/1000)
profit.1000 <- round(profit/1000)
profit.after.tax.1000 <- round (profit.after.tax/1000) 

#creating a matrix and assign column names on it
#creating months
months <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)
colnames(M) <- c(months)

print(M)

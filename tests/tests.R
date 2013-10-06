# # Tests.
# 
# #- ABLINE
# 
# p <- qplot(wt, mpg, data = mtcars)
# 
# # Fixed slopes and intercepts
# p + geom_abline() # Can't see it - outside the range of the data
# 
# 
# #- BAR
# 
# # Generate data
# c <- ggplot(mtcars, aes(factor(cyl)))
# 
# # By default, uses stat="bin", which gives the count in each category
# c + geom_bar()
# 
# qplot(factor(cyl), data=mtcars, geom="bar", fill=factor(cyl))
# 
# ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar()
# 
# 
# #- BIN2D
# 
# d <- ggplot(diamonds, aes(x = x, y = y)) + xlim(4,10) + ylim(4,10)
# d + geom_bin2d()
# 
# 
# #- BOXPLOT
# 
# ggthemr('ginger', 'scientific', 1.6, type = 'inner')
# p <- ggplot(mtcars, aes(factor(cyl), mpg))
# p + geom_boxplot()
# p + geom_boxplot(aes(fill = factor(cyl)))
# 
# 
# # DOTPLOT
# 
# ggplot(mtcars, aes(x = 1, y = mpg)) + geom_dotplot(binaxis = "y", stackdir = "center")
# ggplot(mtcars, aes(x = factor(vs), fill = factor(cyl), y = mpg)) + geom_dotplot(binaxis = "y", stackdir = "center", position = "dodge")
# 
# 
# #- ERRORBAR
# 
# df <- data.frame(
#   trt = factor(c(1, 1, 2, 2)),
#   resp = c(1, 5, 3, 4),
#   group = factor(c(1, 2, 1, 2)),
#   se = c(0.1, 0.3, 0.3, 0.2)
# )
# p <- ggplot(df, aes(colour=group, y=resp, x=trt))
# p + geom_point() + geom_errorbar(aes(ymax = resp + se, ymin=resp - se), width=0.2)
# 
# p <- ggplot(df, aes(resp, trt, colour = group))
# p + geom_point() +
#   geom_errorbarh(aes(xmax = resp + se, xmin = resp - se))
# 
# 
# #- FREQPOLY
# 
# qplot(price, data = diamonds, geom = "freqpoly", binwidth = 1000)
# qplot(price, data = diamonds, geom = "freqpoly", binwidth = 1000, colour = color)
# 
# 
# #- HISTOGRAM
# 
# m <- ggplot(movies, aes(x=rating))
# m + geom_histogram()
# m + geom_histogram(aes(fill = ..count..))
# 
# 
# #- HLINE
# 
# p <- ggplot(mtcars, aes(x = wt, y=mpg)) + geom_point()
# p + geom_hline(aes(yintercept=mpg))
# p + geom_hline(aes(yintercept=mpg)) + coord_polar()
# 
# 
# # JIITER
# 
# p <- ggplot(mpg, aes(displ, hwy))
# p + geom_point()
# p + geom_jitter(aes(colour = cyl))
# 
# 
# # TEXT
# 
# ggplot(data.frame(A=1:10, B=1:10, C=sample(c(1:6), 10,T)), aes(A, B)) + 
#   geom_jitter(size=3) + ggtitle('Plot') + geom_text(aes(label = C))
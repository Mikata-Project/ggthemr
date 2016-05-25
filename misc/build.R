library(devtools)
library(knitr)
load_all('../')
ggthemr('earth')
preview_theme()
build('pre-build', 'builds')
install.packages('builds/ggthemr_1.0.2.tar.gz', repos=NULL, type='source')

setwd('../')
knit('README.Rmd', 'README.md')
setwd('misc/')

ggplot(data.frame())

ggthemr_reset()
ggplot(diamonds, aes(price, fill = factor(cut))) + 
  geom_histogram(binwidth = 850) + 
  xlab('Price (USD)') + 
  ylab('Count') + 
  scale_x_continuous(label = function(x) paste0(x / 1000, 'k'))
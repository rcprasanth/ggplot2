library(ggplot2)
library(ggrepel)
library(dplyr)
View(mtcars)

MilesDisp = ggplot(mtcars, aes(disp, mpg))+theme_bw()

MilesDisp + geom_point(aes(shape = factor(cyl)))

MilesDisp + geom_point(aes(shape = factor(cyl), color = qsec, size = wt))

MilesDisp + geom_point(aes(shape = factor(cyl), color = qsec, size = wt))+geom_text(label = rownames(mtcars), hjust=-0.2, vjust = 0.2)

PointFinal = MilesDisp + geom_point(aes(shape = factor(cyl), color = qsec, size = wt))+geom_text_repel(label = rownames(mtcars))


MilesDisp + geom_quantile()

PointFinal + geom_smooth(method = lm, se = FALSE)


TopFuelEfficient = mtcars

TopFuelEfficient$CarName = rownames(TopFuelEfficient)

TopFuelEfficient = head(arrange(TopFuelEfficient, desc(mpg)),10)

milespergallon = ggplot(TopFuelEfficient, aes(CarName, mpg))+theme_bw()

milespergallon + geom_bar(stat = "identity", fill = "steelblue")

milespergallon + geom_boxplot()


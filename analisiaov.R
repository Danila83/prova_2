


dt  <- read.csv("data.csv")

## Convert variables to factor
dt <- within(dt, {
  group <- factor(group)
  time <- factor(time)
  id <- factor(id)
})

par(cex = .6)

with(dt, interaction.plot(time, group, pulse,
                             ylim = c(5, 20), lty= c(1, 12), lwd = 3,
                             ylab = "mean of pulse", xlab = "time", trace.label = "group"))

dt.aov <- aov(pulse ~ group * time + Error(id), data = dt)
summary(dt.aov)


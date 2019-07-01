library(tidyverse)
library(ggplot2)
mpg %>% tbl_df
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = trans)) + 
  geom_point()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(colour = "red") + geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) + 
  geom_point() + geom_smooth(method = "lm", se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = factor(cyl))) + 
  geom_point() + geom_smooth()

ggplot(mpg, aes(x = displ, y = hwy, colour = factor(cyl))) + 
  geom_point() + geom_smooth(method = "lm", se = FALSE) +
  scale_x_log10(breaks = c(2, 3, 4, 5, 6, 7)) +
  scale_y_log10(breaks = c(20, 30, 40)) +
  labs(x = 'Displacement', y = 'MPG, highway', color = "Cylinders", title = "Fuel economy and engine size") +
  facet_wrap(~ year, labeller= as_labeller(c('1999' = 'Model year 1999', '2008' = 'Model year 2008')))

mpg2 <- mpg %>% select(c('manufacturer', 'model', 'displ', 'year', 'cyl', 'trans', 'cty', 'hwy'))
mpg3 <- mpg2 %>% mutate(displ2 = displ^2) %>% mutate(vol_per_cyl = round(displ/cyl, 2))
mpg4 <- mpg3 %>% arrange(desc(vol_per_cyl))

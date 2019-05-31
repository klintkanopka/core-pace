library(tidyverse)

d <- tibble(
  a = c(rep(1, 100), rep(2, 100)),
  b = c(rnorm(100), rnorm(100, 100, 100))
)
# standardize scores
d <- d %>%
  mutate(b_tot = scale(b)[,1]) %>%
  group_by(a) %>%
  mutate(c = scale(b)[,1]) %>%
  ungroup()

ggplot(d) +
  geom_point(aes(x=b, y=c))

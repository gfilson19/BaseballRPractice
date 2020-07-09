#This graph (included in this repository) ended up implying that hitters with lower BB-K ratios would see lower standard
#deviations with wRC+, which is mostly the opposite of what I thought I'd see, so
#maybe there's an error somewhere. My belief going in was that the closer to 1.00
#(i.e. Mike Trout) you get, the lower variance you see in their wRC+. Which is probably
#true if I computed something wrong along the way here. However, there does seem to be at least
#some of the graph following this trend.

FG3indvYearHitters <- fg_bat_leaders(x = 2017, y = 2019, league = "all", qual = 100, ind = 1)
FG3YearHitters <- fg_bat_leaders(x = 2017, y = 2019, league = "all", qual = 100, ind = 0)

wRCplusStDev <- FG3indvYearHitters %>%
  group_by(Name) %>%
  select(Name, wRC_plus) %>%
  mutate(wRCplusStDev2 = sd(wRC_plus)) %>%
  na.omit() %>%
  summarise((round(mean(wRCplusStDev2), 2)))

BB_KPct3yr <- FG3YearHitters %>%
  group_by(Name) %>%
  select(Name, BB_K) %>%
  na.omit()

wRCplusBB_K = merge(x = BB_KPct3yr, y = wRCplusStDev, by = "Name")

ggplot(wRCplusBB_K, aes(x = BB_K, y = `(round(mean(wRCplusStDev2), 2))`)) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=1) +
  scale_x_continuous("BB-K Ratio", expand = c(0, 0)) +
  scale_y_continuous("wRC+ Standard Deviation", expand = c(0, 0)) +
  ggtitle("2017-2019 wRC+ StDev with BB-K Ratio") +
  labs(subtitle = "Baseball Savant Data")

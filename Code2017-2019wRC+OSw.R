#Looking at Outside-Strike Zone Swing % as possibly a driver of year to 
#year variation in hitting ablity, using wRC+ from baseballr's Fangraphs leaderboards 
#(2017-2019)

FG3indvYearHitters <- fg_bat_leaders(x = 2017, y = 2019, league = "all", qual = 100, ind = 1)
FG3YearHitters <- fg_bat_leaders(x = 2017, y = 2019, league = "all", qual = 100, ind = 0)

wRCplusStDev <- FG3indvYearHitters %>%
  group_by(Name) %>%
  select(Name, wRC_plus) %>%
  mutate(wRCplusStDev2 = sd(wRC_plus)) %>%
  na.omit() %>%
  summarise((round(mean(wRCplusStDev2), 2)))

OswingPct3yr <- FG3YearHitters %>%
  group_by(Name) %>%
  select(Name, `O-Swing_pct`) %>%
  na.omit()

wRCplusOswing = merge(x = OswingPct3yr, y = wRCplusStDev, by = "Name")

#Charts! 

Scatter <- ggplot(wRCplusOswing, aes(x = `O-Swing_pct`, y = `(round(mean(wRCplusStDev2), 2))`)) +
  geom_point(alpha = 0.5) +
  geom_smooth() +
  ggtitle("2017-2019 wRCplus St.Dev & O-KZone SwPct") +
  scale_x_continuous("Outside Strike Zone Swing Pct") +
  scale_y_continuous("wRC+ Standard Deviation")

plot(Scatter)

Cluster <- ggplot(wRCplusOswing, aes(x = `O-Swing_pct`, y = `(round(mean(wRCplusStDev2), 2))`)) +
  geom_bin2d(aes(x = `O-Swing_pct`, y = `(round(mean(wRCplusStDev2), 2))`)) +
  ggtitle("2017-2019 wRCplus St.Dev & O-KZone SwPct") +
  scale_x_continuous("Outside Strike Zone Swing Pct") +
  scale_y_continuous("wRC+ Standard Deviation")

plot(Cluster)

Density <- ggplot(wRCplusOswing, aes(x = `O-Swing_pct`, y = `(round(mean(wRCplusStDev2), 2))`)) +
  geom_density2d(aes(x = `O-Swing_pct`, y = `(round(mean(wRCplusStDev2), 2))`)) +
  geom_smooth() +
  ggtitle("2017-2019 wRCplus St.Dev & O-KZone SwPct") +
  scale_x_continuous("Outside Strike Zone Swing Pct") +
  scale_y_continuous("wRC+ Standard Deviation")

plot(Density)
ColeFB <- SavantData19 %>%
  filter(pitcher == "543037", pitch_type == "FF", release_extension < 6.75)

ggplot(ColeFB, aes(x = release_extension, y = release_spin_rate)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white") +
  scale_x_continuous("Release Extension (ft.)") +
  scale_y_continuous("Spin Rate (rpm)") +
  ggtitle("Gerrit Cole Fastball Extension at Release with Spin Rate") +
  labs(subtitle = "2019 Baseball Savant Data")
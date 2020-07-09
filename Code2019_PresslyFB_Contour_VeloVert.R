PresslyFB <- SavantData19 %>%
  filter(pitcher == "519151", pitch_type == "FF")

ggplot(PresslyFB, aes(x = release_pos_z, y = release_speed)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white") +
  scale_x_continuous("Vertical Release Point (ft.)") +
  scale_y_continuous("Velocity (mph)") +
  ggtitle("Ryan Pressly Fastball Velocity with Vertical Release Point") +
  labs(subtitle = "2019 Baseball Savant Data")
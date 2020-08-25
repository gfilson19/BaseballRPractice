VladBB <- SavantData19 %>%
  filter(batter == "665489", type == "X")

ggplot(VladBB, aes(x = launch_angle, y = launch_speed)) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=-1) +
  scale_x_continuous("Launch Angle (degrees)", expand = c(0, 0)) +
  scale_y_continuous("Exit Velocity (mph)", expand = c(0, 0)) +
  ggtitle("Vladimir Guerrero 2019 Launch Angle with Exit Velocity") +
  labs(subtitle = "Baseball Savant Data")

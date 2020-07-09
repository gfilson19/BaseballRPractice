PresslyFB <- SavantData19 %>%
  filter(pitcher == "519151", pitch_type == "FF")

ggplot(PresslyFB, aes(x = release_pos_z, y = release_speed)) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=1) +
  scale_x_continuous("Vertical Release Point (ft.)", expand = c(0, 0)) +
  scale_y_continuous("Velocity (mph)", expand = c(0, 0)) +
  ggtitle("Ryan Pressly Fastball Velocity with Vertical Release Point") +
  labs(subtitle = "2019 Baseball Savant Data")
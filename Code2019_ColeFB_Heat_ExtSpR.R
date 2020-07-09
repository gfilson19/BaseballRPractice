ColeFB <- SavantData19 %>%
  filter(pitcher == "543037", pitch_type == "FF", release_extension < 6.75)

ggplot(ColeFB, aes(x = release_extension, y = release_spin_rate)) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=1) +
  scale_x_continuous("Release Extension (ft.)", expand = c(0, 0)) +
  scale_y_continuous("Spin Rate (rpm)", expand = c(0, 0)) +
  ggtitle("Gerrit Cole Fastball Extension at Release with Spin Rate") +
  labs(subtitle = "2019 Baseball Savant Data")

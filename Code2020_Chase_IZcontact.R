ggplot(IZcon, aes(x = oz_swing_percent, y = iz_contact_percent)) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=-1) +
  scale_x_continuous("Chase %", expand = c(0, 0)) +
  scale_y_continuous("In-Zone Contact %", expand = c(0, 0)) +
  ggtitle("Chase % with In-Zone Contact % (entering 9/13/20)") +
  labs(subtitle = "2020 Baseball Savant Data, min. 25 PAs")
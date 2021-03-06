FB_CB_Efficiency <- active_spin %>%
  select(last_name, first_name, active_spin_fastball, active_spin_curve) %>%
  filter(active_spin_curve & active_spin_fastball) %>%
  mutate(Full_Name = paste(last_name, first_name, sep = ", "))

Whiff_Perc <- WhiffPerc %>%
  select(whiff_percent, last_name, first_name) %>%
  mutate(Full_Name = paste(last_name, first_name, sep = ", "))

FB_CB_Effcncy_Whiff = merge(x = FB_CB_Efficiency, y = Whiff_Perc, 
                            by = "Full_Name")

FB_CB_Effcncy_WhiffPerc <- FB_CB_Effcncy_Whiff %>%
  subset(select = c(-last_name.x, -last_name.y, -first_name.x, -first_name.y)) %>%
  mutate(FB_CB_Difference = (active_spin_fastball - active_spin_curve))

ggplot(FB_CB_Effcncy_WhiffPerc, aes(x = FB_CB_Difference, y = whiff_percent)) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=-1) +
  scale_x_continuous("Difference between FB & CB Spin Efficiency", expand = c(0, 0)) +
  scale_y_continuous("Overall Whiff Percentage", expand = c(0, 0)) +
  ggtitle("Whiff Percentage with FB and CB Spin Efficiency Differential min. 250 Pitches") +
  labs(subtitle = "Pitchers with both a Fastball and a Curve (2019 Savant Data)")

ggplot(FB_CB_Effcncy_xwOBA, aes(x = active_spin_fastball, y = active_spin_curve)) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= "Spectral", direction=-1) +
  scale_x_continuous("Fastball Spin Efficiency (%)", expand = c(0, 0)) +
  scale_y_continuous("Curveball Spin Efficiency (%)", expand = c(0, 0)) +
  ggtitle("FB and CB Spin Efficiency % min. 250 Pitches") +
  labs(subtitle = "Pitchers with both a Fastball and a Curve (2019 Savant Data)")
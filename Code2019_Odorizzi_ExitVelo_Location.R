OdorizziEV19 <- SavantPitcherData18and19 %>%
  filter(pitcher == "543606", type == "X", pitch_name != "", grepl("2019", game_date)) %>%
  select(player_name, pitch_name, plate_x, plate_z, launch_speed)

plate_width <- 17 + 2 * (9/pi)

k_zone_plot <- ggplot(OdorizziEV19, aes(x = plate_x, y = plate_z)) +
  aes(color = pitch_name) +
  geom_point(aes(size = launch_speed), alpha = 0.7) +
  scale_radius() +
  ggtitle("Jake Odorizzi Exit Velo w/ Pitch Type 2019", "(Catcher's Perspective)") +
  geom_rect(xmin = -(plate_width/2)/12,
            xmax = (plate_width/2)/12,
            ymin = 1.5,
            ymax = 3.6, color = "black", alpha = 0) +
  coord_equal() +
  scale_x_continuous("Horizontal location (ft.)",
                     limits = c(-2, 2)) +
  scale_y_continuous("Vertical location (ft.)",
                     limits = c(0,5)) +
  guides(color = guide_legend("Pitch Type"),
         size = guide_legend("Exit Velocity"))

plot(k_zone_plot)
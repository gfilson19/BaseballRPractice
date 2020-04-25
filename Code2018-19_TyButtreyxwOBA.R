ButtreyxwOBALoc <- SavantPitcherData18and19 %>%
  filter(player_name == "Ty Buttrey", type == "X", pitch_name == "4-Seam Fastball" | 
           pitch_name == "Changeup" | pitch_name == "Slider") %>%
  select(player_name, pitch_name, plate_x, plate_z, estimated_woba_using_speedangle)

plate_width <- 17 + 2 * (9/pi)

k_zone_plot <- ggplot(ButtreyxwOBALoc, aes(x = plate_x, y = plate_z)) +
  aes(color = pitch_name) +
  geom_point(aes(size = estimated_woba_using_speedangle), alpha = 0.5) +
  ggtitle("Ty Buttrey Expected wOBA Balls in Play 2018/2019", "(Catcher's Perspective)") +
  geom_rect(xmin = -(plate_width/2)/12,
            xmax = (plate_width/2)/12,
            ymin = 1.5,
            ymax = 3.6, color = "black", alpha = 0) +
  coord_equal() +
  scale_x_continuous("Horizontal location (ft.)",
                     limits = c(-2, 2)) +
  scale_y_continuous("Vertical location (ft.)",
                     limits = c(0,5))

plot(k_zone_plot)

ButtreySwStrLoc <- SavantPitcherData18and19 %>%
  filter(player_name == "Ty Buttrey", description == "swinging_strike", pitch_name == "4-Seam Fastball" | 
           pitch_name == "Changeup" | pitch_name == "Slider") %>%
  select(player_name, pitch_name, plate_x, plate_z, release_spin_rate, description)


plate_width <-17+2*(9/pi) 

k_zone_plot <- ggplot(ButtreySwStrLoc, aes(x = plate_x, y = plate_z)) +
  aes(color = pitch_name) +
  geom_point(alpha = 0.7) +
  ggtitle("Ty Buttrey Whiffs 2018/2019", "(Catcher's Perspective)") +
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

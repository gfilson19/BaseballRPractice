Franmil_BIP <- SavantData18and19 %>%
  filter(player_name == "Franmil Reyes", type == "X")

guidelines <- tibble(
  launch_angle = c(10, 25, 50),
  launch_speed = 40,
  label = c("Ground balls", "Line drives", "Flyballs")
)

Franmil_Plot <- Franmil_BIP %>%
  sample_n(nrow(.) / 2) %>%
  ggplot(aes(x = launch_speed, y = launch_angle,
             color = estimated_woba_using_speedangle)) +
  geom_hline(data = guidelines, aes(yintercept = launch_angle),
             color = "black", linetype = 2) +
  geom_text(data = guidelines,
            aes(label = label, y = launch_angle - 4),
            color = "black", hjust = "left") +
  geom_point(alpha = 0.99) +
  ggtitle("Franmil Reyes xwOBA with EV/LA 2018/2019") +
  scale_color_gradient("xwOBA", low = "blue", high = "white") +
  scale_x_continuous("Exit velocity (mph)",
                     limits = c(40, 120)) +
  scale_y_continuous("Launch angle (degrees)",
                     breaks = seq(-75, 75, 25))

plot(Franmil_Plot)

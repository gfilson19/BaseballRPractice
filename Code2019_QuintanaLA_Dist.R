playerid_lookup(last_name = "Quintana", first_name = "Jose")

QuintanaBIPS <- SavantData19 %>%
  filter(pitcher == "500779", type == "X")

ggplot(QuintanaBIPS, aes(x = launch_angle)) +
  geom_histogram() +
  scale_x_continuous("Launch Angle") +
  scale_y_continuous("Count") +
  ggtitle("Jose Quintana 2019 LA Distribution")
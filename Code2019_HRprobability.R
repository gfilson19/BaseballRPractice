#Practicing with the book "Analyzing Baseball Data with R", here is an updated for 2019 
#contour graph of the fitted probability of a HR as a function of exit velo and LA using a 
#GAM

sc_bips_19 <- SavantHitterData19 %>%
  filter(type == "X") %>%
  mutate(HR = ifelse(events == "home_run", 1, 0))

library(mgcv)
fit <- sc_bips_19 %>%
  sample_n(nrow(.) / 2) %>%
  gam(HR ~ s(launch_speed, launch_angle),
      family = binomial, data = .)

ls_la_grid <- expand.grid(
  launch_speed = seq(90, 115, length.out = 50),
  launch_angle = seq(15, 45, length.out = 50))

library(broom)
hats <- fit %>%
  augment(type.predict = "response", newdata = ls_la_grid)

odd_values <- seq(from = 0.1, to = 0.9, by = 0.2)

hat_labels <- hats %>%
  filter(round(launch_angle) == 30) %>%
  group_by(hr_prob = round(.fitted, 1)) %>%
  summarize(N = n(),
            launch_speed = mean(launch_speed) + 1,
            launch_angle = mean(launch_angle)) %>%
  filter(as.character(hr_prob) %in% odd_values)

ggplot(hats, aes(x = launch_speed, y = launch_angle)) +
  geom_tile(aes(fill = .fitted)) +
  geom_contour(aes(z = .fitted), breaks = odd_values) +
  geom_text(data = hat_labels, aes(label = hr_prob)) +
  xlab("Exit velocity (mph)") +
  ylab("Launch angle (degrees)") +
  scale_fill_gradient("HR prob", low = "blue", high = "white")
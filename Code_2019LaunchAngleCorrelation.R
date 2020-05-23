# Huge shoutout to the book "Analyzing Baseball Data with R" for this terrific example
# of finding interesting correlation with launch angle aross 2 halves of a season. 
# I'm running it for myself to learn the process along the way. Updated with a year's 
# worth of 2019 statcast data

sc_bips <- SavantHitterData19 %>%
  filter(type == "X")

regulars <- sc_bips %>%
  group_by(batter, player_name) %>%
  summarize(N = n(),
            avg_la = mean(launch_angle, na.rm = TRUE),
            var_la = var(launch_angle, na.rm = TRUE)) %>%
  filter(N>300)

sc_regulars <- sc_bips %>%
  filter(!is.na(launch_angle)) %>%
  inner_join(regulars, by = "batter")

# Below is visual representation of launch angle distribution, including a line showing
# Wilson Ramos' distribution for context

la_plot <- ggplot(sc_regulars,
                  aes(x = launch_angle, group = batter)) +
  geom_density(size = 0.1, color = "darkgray") +
  scale_x_continuous("Launch Angle (degrees)") +
  ggtitle("2019 Launch Angle Distribution, min 300 BIP")
la_plot

#Below is where we highlight Ramos

highlight <- regulars %>%
  filter(avg_la < 1 | var_la < 482) %>%
  mutate(x_coord = ifelse(avg_la < 1, -45, 50),
         y_coord = ifelse(avg_la < 1, 0.01, 0.02))

highlight_regulars <- sc_regulars %>%
  filter(!is.na(launch_angle)) %>%
  inner_join(highlight, by = "batter")

library(ggrepel)
la_plot +
  geom_text_repel(data = highlight,
                  aes(x = x_coord, label = player_name,
                      y = y_coord), color = "blue") +
  geom_density(data = highlight_regulars, color = "blue")

# Now, back to finding correlation between launch angle in 1st half and 2nd half (July 1 as 
# an admittedly rough estimate) to see if its something of a repeatable skill

sc_split <- sc_regulars %>%
  mutate(split = game_date < "2019-07-01") %>%
  group_by(split, batter) %>%
  summarize(N = n(),
            avg_la = mean(launch_angle, na.rm = TRUE))
sc_split %>%
  arrange(batter)

sc_split_wide <- sc_split %>%
  select(-N) %>%
  spread(key = split, value = avg_la, sep = "_")
sc_split_wide

la_cor <- sc_split_wide %>%
  summarize(correlation = cor(split_TRUE, split_FALSE))

# A correlation of 0.792 is pretty strong. Also, the book found this with 2017 data, where
# it was 0.751. It appears launch angle is becoming more and more of a stable skill.

# Below is where we will make a scatterplot showing this relationship between 1st half
# and 2nd half launch angle

LAscatter <- ggplot(sc_split_wide, aes(x = split_TRUE, y = split_FALSE)) +
  geom_abline(slope = 1, intercept = 0,
              linetype = 2, color = "darkgray") +
  geom_point() +
  geom_smooth() +
  scale_x_continuous("Launch angle (first half)",
                     limits = c(-2, 24)) +
  scale_y_continuous("Launch angle (second half)",
                     limits = c(-2, 24)) +
  coord_fixed() +
  ggtitle("2019 Correlation 1st + 2nd Half Launch Angle min 300 BIP")

plot(LAscatter)
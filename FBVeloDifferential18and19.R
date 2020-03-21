# "Pitchers18" and "Pitchers19" are full season Statcast scrapes of 2018 and 2019
# This is looking at who increased their 4-seam fastball velocity the most from 2018 to 2019
# Let me know if you have any tips!

FastballVelo18 <- Pitchers18 %>%
  filter(pitch_type == "FF") %>%
  select(player_name, release_speed, pitch_type, pitcher) %>%
  group_by(player_name) %>% 
  filter(n() > 50) %>%
  summarise(FBAvgVelo18 = mean(release_speed)) 

  
FastballVelo19 <- Pitchers19 %>%
  filter(pitch_type == "FF") %>%
  select(player_name, release_speed, pitch_type, pitcher) %>%
  group_by(player_name) %>% 
  filter(n() > 50) %>%
  summarise(FBAvgVelo19 = mean(release_speed))

FBDifferential = merge(x = FastballVelo18, y = FastballVelo19, by = "player_name") %>%
  mutate(FBDiff = round((FBAvgVelo19 - FBAvgVelo18), 2)) %>%
  arrange(desc(FBDiff)) %>%
  top_n(100)
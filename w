TotalFBUp = SavantData1819 %>%
  filter(release_speed >= 94, zone == "1" | zone == "2" | zone == "3" | 
           zone == "11" | zone == "12") %>%
  select(player_name, description) %>%
  group_by(player_name) %>%
  summarise(TotFBUp = n())

SwStrFBUp = SavantData1819 %>%
  filter(release_speed >= 94, description == "swinging_strike", zone == "1" | 
           zone == "2" | zone == "3" | zone == "11" | zone == "12") %>%
  select(player_name, description) %>%
  group_by(player_name) %>%
  summarise(SwStrFBsUp = n())

SwStrFBUpPercentage = merge(x = TotalFBUp, y = SwStrFBUp, by = "player_name") %>%
  mutate(MLBavg = round(mean(SwStrFBsUp/TotFBUp), 4)*100) %>%
  filter(TotFBUp >= 75) %>%
  mutate(FBUpSwStrPct = round(SwStrFBsUp/TotFBUp, 3)*100) %>%
  arrange(desc(FBUpSwStrPct)) %>%
  top_n(n = 50)

TeamCodes = data.frame(
  home_team = c("STL", "MIL", "CHC", "CIN", "PIT", "ATL", "WSH", "NYM", "PHI", "MIA",
                "LAD", "ARI", "SF", "SD", "COL", "MIN", "CLE", "CHW", "KC", "DET", 
                "NYY", "TB", "BOS", "TOR", "BAL", "HOU", "OAK", "TEX", "SEA", "LAA"),
  venue = c("cardinals", "brewers", "cubs", "reds", "pirates", "braves", "nationals", "mets",
            "phillies", "marlins", "dodgers", "diamondbacks", "giants", "padres", "rockies",
            "twins", "indians", "white_sox", "royals", "tigers", "yankees", "rays",
            "red_sox", "blue_jays", "orioles", "astros", "athletics", "rangers", "mariners",
            "angels"),
  stringsAsFactors = F
  )


library(GeomMLBStadiums)

BIP = SavantData1819 %>% filter(type == "X")

BIP %>% filter(player_name == "Mike Trout") %>% mlbam_xy_transformation() %>%
  filter(release_speed >= 95) %>%
  ggplot(aes(x=hc_x_, y=hc_y_, color=bb_type)) +
  geom_spraychart(stadium_ids = "angels",
                  stadium_transform_coords = TRUE,
                  stadium_segments = "all") +
  theme_void() +
  coord_fixed() +
  ggtitle("Mike Trout at Angel Stadium vs. 95+ mph 2018/2019")
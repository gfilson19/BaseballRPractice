library(RSQLite)
library(DBI)

db = dbConnect(SQLite(), dbname = "Statcast.sqlite")

dbWriteTable(conn = db, name = "Statcast_Hitting", SavantData18and19, 
             overwrite = T, row.names = F)

SavantData1819 = dbGetQuery(conn = db, "SELECT * FROM Statcast_Hitting")

##### Given the current high fastball - low curveball trend, 
##### this is swinging strike % on pitches 94+ UP in the zone 
##### (Statcast Zones 1,2,3,11,and 12)

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

##### In this results table, I will also try to include the MLB average for 
##### swinging strike % on 94+ in these high zones

SwStrFBUpPercentage = merge(x = TotalFBUp, y = SwStrFBUp, by = "player_name") %>%
  mutate(MLBavg = round(mean(SwStrFBsUp/TotFBUp), 4)*100) %>%
  filter(TotFBUp >= 75) %>%
  mutate(FBUpSwStrPct = round(SwStrFBsUp/TotFBUp, 3)*100) %>%
  arrange(desc(FBUpSwStrPct)) %>%
  top_n(n = 50)

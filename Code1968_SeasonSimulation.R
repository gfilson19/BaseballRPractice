#Following along with the book "Analyzing Baseball Data with R", this is my practice 
#simulating a season, specifically the 1968 season

NL <- c("ATL", "CHN", "CIN", "HOU", "LAN", "NYN", "PHI", "PIT", "SFN", "SLN")
AL <- c("BAL", "BOS", "CAL", "CHA", "CLE", "DET", "MIN", "NYA", "OAK", "WS2")
teams <- c(NL, AL)
league <- c(rep(1, 10), rep(2, 10))

make_schedule <- function(teams, k) {
  n.teams <- length(teams)
  Home <- rep(rep(teams, each = n.teams), k)
  Visitor <- rep(rep(teams, n.teams), k)
  schedule <- tibble(Home = Home, Visitor = Visitor) %>%
    filter(Home != Visitor)
}
schedule <- bind_rows(make_schedule(NL, 9),
                      make_schedule(AL, 9))

s.talent <- 0.20
talents <- rnorm(20, 0, s.talent)
TAL <- tibble(Team = teams, League = league,
              Talent = talents)
SCH <- schedule %>%
  inner_join(TAL, by = c("Home" = "Team")) %>%
  rename(Talent.Home = Talent) %>%
  inner_join(TAL, by = c("Visitor" = "Team", "League")) %>%
  rename(Talent.Visitor = Talent)

SCH %>%
  mutate(prob.Home = exp(Talent.Home) /
           (exp(Talent.Home) + exp(Talent.Visitor))) -> SCH

#Simulating the regular season

SCH %>%
  mutate(outcome = rbinom(nrow(.), 1, prob.Home),
         winner = ifelse(outcome, Home, Visitor)) -> SCH

SCH %>%
  group_by(winner) %>%
  summarize(Wins = n()) %>%
  inner_join(TAL, by = c("winner" = "Team")) -> RESULTS

#Simulating the playoffs

win_league <- function(RR) {
  out <- RR %>%
    mutate(Winner.Lg = 0,
           prob = exp(Talent),
           outcome = sample(nrow(.), prob = prob)) %>%
    arrange(League, desc(Wins), outcome) %>%
    select(-outcome)
  out[1 + c(0, nrow(RR) / 2), "Winner.Lg"] <- 1
  out
}
RESULTS <- win_league(RESULTS)

ws_winner <- RESULTS %>%
  filter(Winner.Lg == 1) %>%
  mutate(outcome = rmultinom(1,7, prob),
         Winner.WS = ifelse(outcome > 3, 1, 0)) %>%
  filter(outcome > 3) %>%
  select(winner, Winner.WS)

RESULTS %>%
  left_join(ws_winner, by = c("winner")) %>%
  replace_na(list(Winner.WS = 0))

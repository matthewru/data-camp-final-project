library(tidyverse)
library(countrycode)


raw_player_data <- read_csv("player_overviews.csv")
raw_player_data_current <- read_csv("atp_players.csv", col_names = c("player_id", "first_name", "last_name", "hand", "birth_date", "country_code"))
clean_player_data_current <- raw_player_data_current %>% 
  mutate(birth_date = parse_datetime(as.character(birth_date), format = "")) %>% 
  mutate(country = countrycode(country_code, origin = "iso3c", destination = "country.name")) %>% 
  filter(!is.na(birth_date)) %>% 
  filter(!is.na(country))

clean_player_data <- subset(raw_player_data, weight_lbs != 0 | height_inches != 0)
clean_player_data <- clean_player_data %>% 
  drop_na(handedness) %>% 
  drop_na(height_inches) %>% 
  drop_na(weight_lbs)
clean_player_data <- subset(clean_player_data, weight_lbs != 1488)
clean_player_data <- subset(clean_player_data, height_inches != 0)
clean_player_data <- subset(clean_player_data, height_inches != 1)

write_csv(clean_player_data, "clean_player_data.csv")
write_csv(clean_player_data_current, "clean_player_data_current.csv")
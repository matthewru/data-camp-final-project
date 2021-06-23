library(tidyverse)
library(countrycode)


grouped_by_country <- clean_player_data_current %>% 
  group_by(country) %>% 
  summarize(total = n()) %>% 
  arrange(desc(total)) %>% 
  slice(1:10)

final_plot <- ggplot(data = grouped_by_country, 
       mapping = aes(x = reorder(country, total), y = total)) + 
  geom_col(fill = if_else(grouped_by_country$country == "United States","#5F8FF5" , "#1f61f0")) + 
  coord_flip() + 
  labs(title = "Top 10 Countries With the Largest Amount of Pro ATP Tennis Players", 
       subtitle = "USA easily takes the lead, followed by a few European Countries", 
       x = "Country (From Highest to Least)", 
       y = "Total Native Players", 
       caption = "Jeff Sackmann: ATP Players") + 
  theme_classic() + 
  scale_y_continuous(breaks = c(1000, 2000, 3000, 4000, 5000))

saveRDS(final_plot, "country.rds")
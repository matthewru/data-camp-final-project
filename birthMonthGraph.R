library(tidyverse)
library(lubridate)

grouped_by_month <- clean_player_data_current %>% 
  mutate(month = month.abb[month(birth_date)]) %>% 
  group_by(month) %>% 
  summarize(total = n()) %>% 
  arrange(desc(total))


final_plot <- ggplot(data = grouped_by_month, 
       mapping = aes(x = reorder(month, total), y = total)) + 
  geom_col(fill = "#ff6340") + 
  labs(title = "ATP Pro Tennis Player Birth Month Distribution", 
       subtitle = "The most common birth month is January,\nhowever the difference is not too drastically different.", 
       x = "Month", 
       y = "Number of ATP players", 
       caption = "Jeff Sackmann: ATP Players")

saveRDS(final_plot, "birthmonth.rds")
library(tidyverse)

final_graph <- ggplot(data = clean_player_data, 
       mapping = aes(x = height_inches, y = weight_lbs, color = handedness)) + 
  geom_jitter(size = 0.7) + 
  labs(title = "Distribution of Weight and Height of ATP Pro Tennis Players", 
       subtitle = "The most common weight is around 170 pounds\nand the most common height is around 6 feet", 
       x = "Height in Inches", 
       y = "Weight in Pounds", 
       color = "Hand Dominance", 
       caption = "Datahub.io: ATP Player Overview") + 
  theme_classic()

saveRDS(final_graph, "heightWeightHandednessPlot.rds")
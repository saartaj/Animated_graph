library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(gganimate)

df <- as.data.frame(datasets::USPersonalExpenditure)
df$type <- rownames(df)
rownames(df) <- NULL

df %>% 
 gather(group,  # Year Columns will be in it.
       expenditure, # All the values will be stored in this column
       '1940':'1960'  # Values will be taken from here
       )  -> newdf 
  
newdf %>% 
 ggplot(aes(type, expenditure, col = type)) + 
  geom_point(size=5)+
  geom_segment(aes(y=0, yend= expenditure, xend= type))+
  ggtitle('Expenditure Over time') +
  theme_dark() +
  theme(axis.text.x   = element_blank(),
        legend.position = 'bottom') +
  transition_states(group)






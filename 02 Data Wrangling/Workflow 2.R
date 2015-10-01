require("jsonlite")
require("RCurl")
require("ggplot2")

dfJ <- select(df, ID, DIST, CON, ABSMAG, MAG, LUM) %>% mutate(lum_percent = cume_dist(LUM)) %>% filter(lum_percent >= .99, CON != "null")
dfJ
summary(dfJ)

require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  #facet_wrap(~SURVIVED) +
  #facet_grid(.~CON, labeller=label_both) + # Same as facet_wrap but with a label.
  #facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Stars') +
  labs(x="Distance from Earth", y=paste("Luminosity Percentile")) +
  layer(data=dfJ, 
        mapping=aes(as.character(DIST), y=as.numeric(as.character(lum_percent)), color = CON), 
        stat="identity", 
        stat_params=list(), 
        geom="Point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )
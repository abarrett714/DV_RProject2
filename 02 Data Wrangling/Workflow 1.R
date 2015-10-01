require("jsonlite")
require("RCurl")
require("ggplot2")
require("dplyr")
require("tidyr")

df2 <- select(df, ID, DIST, CON, ABSMAG, MAG) %>% filter(MAG > 0, CON != "null") %>% arrange(CON, DIST)
#summary(df2)

require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  labs(title='Stars') +
  labs(x="Constellation", y=paste("Magnitude (relative to vega)")) +
  layer(data=df2, 
        mapping=aes(as.character(CON), y=as.numeric(as.character(MAG)), color=CON), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )
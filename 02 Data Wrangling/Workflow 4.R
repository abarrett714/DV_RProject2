require("jsonlite")
require("RCurl")
require("ggplot2")
require("dplyr")

dfm <- select(df, ID, DIST, CON, ABSMAG, MAG, RV, LUM, VX) %>% filter(RV != 0, VX  != 0) %>% arrange(CON, DIST)
dfm2 <- dfm %>% group_by(MAG) %>% summarise(n = n()) %>% arrange(n)
dfm2
  
  
require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  labs(title='Stars') +
  labs(x="Radial Velocity", y=paste("XVelocity"), color="Magnitude") +
  layer(data=dfm, 
        mapping=aes(as.character(RV), y=as.numeric(as.character(VX)), color=MAG),
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )
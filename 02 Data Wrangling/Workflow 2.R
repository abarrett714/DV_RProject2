require("jsonlite")
require("RCurl")
require("ggplot2")

df2 <- select(df, ID, DIST, CON, ABSMAG, MAG, LUM) %>% filter(CON == "Cet", LUM > 1000)
df2
summary(df2)

require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  #facet_wrap(~SURVIVED) +
  #facet_grid(.~CON, labeller=label_both) + # Same as facet_wrap but with a label.
  #facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Stars') +
  labs(x="Star in Cet", y=paste("Luminosity")) +
  layer(data=df2, 
        mapping=aes(x=as.numeric(as.character(ID)), y=as.numeric(as.character(LUM))), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )
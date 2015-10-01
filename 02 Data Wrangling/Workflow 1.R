require("jsonlite")
require("RCurl")
require("ggplot2")
tbl_df(df2)

df2 <- select(df, ID, DIST, CON, ABSMAG, MAG) %>% filter(MAG > 0, CON != "null") %>% arrange(CON, DIST)
df2
summary(df2)

require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  #facet_wrap(~SURVIVED) +
  #facet_grid(.~SURVIVED, labeller=label_both) + # Same as facet_wrap but with a label.
  #facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Stars') +
  labs(x="Constellation", y=paste("Distance from Earth (lightyears)")) +
  layer(data=df2, 
        mapping=aes(x=as.character(CON), y=as.numeric(as.character(DIST))), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )

require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  #facet_wrap(~SURVIVED) +
  #facet_grid(.~CON, labeller=label_both) + # Same as facet_wrap but with a label.
  #facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Stars') +
  labs(x="Constellation", y=paste("Distance from Earth (lightyears)")) +
  layer(data=df2, 
        mapping=aes(x=as.numeric(as.character(ID)), y=as.numeric(as.character(DIST))), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )

require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  #facet_wrap(~SURVIVED) +
  #facet_grid(.~CON, labeller=label_both) + # Same as facet_wrap but with a label.
  #facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Stars') +
  labs(x="Distance (parsecs)", y=paste("Magnitude")) +
  layer(data=df2, 
        mapping=aes(x=as.numeric(as.character(DIST)), y=as.numeric(as.character(MAG))), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )

require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  #facet_wrap(~SURVIVED) +
  #facet_grid(.~CON, labeller=label_both) + # Same as facet_wrap but with a label.
  #facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Stars') +
  labs(x="Constellation", y=paste("Magnitude")) +
  layer(data=df2, 
        mapping=aes(as.character(CON), y=as.numeric(as.character(MAG))), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )
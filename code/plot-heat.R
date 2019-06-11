#############
# Mujeres violencia
# June 2019
#############



library(tidyverse)


mujeres =  read.csv("Downloads/mujeres_asesinadas_por_vi (1).csv", sep = ";")

mujeres = mujeres %>%
  mutate(mes = fct_relevel(periodo, levels = c("Enero", "Febrero", "Marzo",
                                               "Abril", "Mayo", "Junio", "Julio", 
                                               "Agosto", "Septiembre", "Octubre",
                                               "Noviembre", "Diciembre")))

cols <- c("1" ="#eae8f3",
          "2" = "#e6e3f4",
          "3" = "#dad5f2", 
          "4" = "#c8bff2",
          "5" = "#bcb1ef",
          "6" = "#aa9dea",
          "7" = "#9587db",
          "8" = "#8172c9", 
          "9" = "#6a5baf",
          "10" = "#544596")


mujeres$victimas =  as.character(mujeres$victimas)


mujeres %>%
  ggplot(aes(ano, reorder(mes, desc(mes)))) +
  geom_tile(aes(fill = victimas), colour = "white", alpha = 0.92) + 
  scale_x_continuous(breaks = c(2014:2019)) + 
  scale_fill_manual(values = cols, limits = c("1","2","3",
                                              "4", "5", "6", "7", "8", "9", "10") ) + 
  coord_fixed(ratio = 0.85)  +
  theme_minimal(12, "Avenir") +
  labs(title = "Víctimas violencia género en España 2014 - 2019") + 
  labs( y = "", 
        x = "", 
        fill = "Mujeres asesinadas", 
        caption = "@EdudinGonzalo | www.epdata.es") +
  theme(panel.grid = element_blank(),
        legend.position = 'bottom', 
        legend.spacing.x = unit(0.5, 'cm'),
        legend.text = element_text(margin = margin(t = 10))) 






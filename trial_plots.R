research_plot <- select(avarage_research, unit,Mean)

ggplot(research_plot, aes(unit, Mean, fill = unit))+
  geom_bar(stat = "identity")+
  geom_text(aes(label = Mean), fontface = "bold")+
  theme(
    axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.y=element_text(colour = "#7F7F7F", size = 12, face = "bold"),
    axis.title.y = element_text(colour = "#FE6F88", size = 12, face = "bold"),
    legend.title = element_text(colour = "#FE6F88", size = 12, face = "bold"),
    legend.text = element_text(colour = "#7F7F7F", size = 9, face = "bold")
  )

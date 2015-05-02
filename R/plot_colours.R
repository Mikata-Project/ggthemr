plot_colours <- function(colour_vector, background_colour = 'white') {
  
  colour_vector <- colour_vector[is_colour(colour_vector)]
  
  if (length(colour_vector) < 1)
    stop('Need at least one colour to plot.')
  
  colour_df <- data.frame(Colours = factor(colour_vector, levels=rev(unique(colour_vector))))
  ggplot(colour_df, aes_string(x = factor(1), y = 'Colours', fill = 'Colours')) + geom_tile() + 
    scale_fill_manual(values=levels(colour_df$Colours), guide='none') +
    geom_text(aes_string(label = 'Colours'), colour='white', vjust=1.1, fontface='bold') +  
    geom_text(aes_string(label = 'Colours'), colour='black', vjust=-0.1, fontface='bold') + 
    theme(axis.title=element_blank(), 
          axis.text=element_blank(), 
          axis.line=element_blank(),
          axis.ticks=element_blank(),
          panel.background=element_blank(),
          plot.background=element_rect(fill=background_colour),
          panel.grid.major=element_blank(),
          panel.grid.minor=element_blank())  
  
}

layouts <- lapply(
  
  list(
    clean = list(
      plot.title = function(...) element_text(hjust=1,  face='bold', ...),
      axis.title = function(...) element_text(face='bold', ...),
      strip.text = function(...) element_text(face='bold', ...),
      axis.line.x = function(...) element_line(...),
      axis.line.y = function(...) element_line(...),
      axis.ticks = function(...) element_blank(),
      panel.grid.major = function(...) element_blank(),
      panel.grid.minor = function(...) element_blank()
    ),
    scientific = list(
      plot.title = function(...) element_text(face='bold', ...),
      axis.title = function(...) element_text(face='bold', ...),
      strip.text = function(...) element_text(face='bold', ...),
      axis.line.x = function(...) element_line(...),
      axis.line.y = function(...) element_line(...),
      axis.ticks = function(...) element_blank(),
      panel.grid.major = function(...) element_line(linetype='dashed', ...),
      panel.grid.minor = function(...) element_line(linetype='dotted', ...)
    ),
    plain = list(
      plot.title = function(...) element_text(face='bold', ...),
      axis.title = function(...) element_text(face='bold', ...),
      strip.text = function(...) element_text(face='bold', ...),
      axis.line.x = function(...) element_line(...),
      axis.line.y = function(...) element_line(...),
      axis.ticks = function(...) element_blank(),
      panel.grid.major = function(...) element_line(linetype='solid', ...),
      panel.grid.minor = function(...) element_blank()
    ),
    clear = list(
      plot.title = function(...) element_text(face='bold', ...),
      axis.title = function(...) element_text(face='bold', ...),
      strip.text = function(...) element_text(face='bold', ...),
      axis.line.x = function(...) element_line(...),
      axis.line.y = function(...) element_line(...),
      axis.ticks = function(...) element_blank(),
      panel.grid.major = function(...) element_line(linetype='dashed', ...),
      panel.grid.minor = function(...) element_blank()
    ),
    minimal = list(
      plot.title = function(...) element_text(hjust=1,  face='bold', ...),
      axis.title = function(...) element_text(...),
      strip.text = function(...) element_text(face='bold', ...),
      axis.line.x = function(...) element_blank(),
      axis.line.y = function(...) element_blank(),
      axis.ticks = function(...) element_blank(),
      panel.grid.major = function(...) element_blank(),
      panel.grid.minor = function(...) element_blank()
    ),
    pastel = list(
      plot.title = function(...) element_text(hjust=1,  face='bold', ...),
      axis.title = function(...) element_text(face='bold', ...),
      strip.text = function(...) element_text(face='bold', ...),
      axis.line.x = function(...) element_line(size=3, ...),
      axis.line.y = function(...) element_line(...),
      axis.ticks = function(...) element_blank(),
      panel.grid.major = function(...) element_line(linetype='dashed',  ...),
      panel.grid.minor = function(...) element_blank()
    )
  ), function(x) {
    class(x) <- 'ggthemr.layout'
    return (x)
  }
)

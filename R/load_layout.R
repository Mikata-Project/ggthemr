load_layout <- function(layout) 
  UseMethod('load_layout', layout)

load_layout.character <- function(layout) {
  layout_list <- names(layouts)
  
  if (!layout %in% layout_list)
    stop(paste0("No layout named '", layout, "'. Please choose one of ", paste(layout_list, collapse=', '), '.'), call.=FALSE)
  
  return (layouts[[layout]])
}

load_layout.ggthemr.layout <- function(layout) 
  return (layout)

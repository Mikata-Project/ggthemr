load_palette <- function(palette) 
  UseMethod('load_palette', palette)

load_palette.character <- function(palette) {
  palette_list <- names(palettes)
  
  if (!palette %in% palette_list)
    stop(paste0("No palette named '", palette, "'. Please choose one of ", paste(palette_list, collapse=', '), '.'), call.=FALSE)
  
  return (palettes[[palette]])
}

load_palette.ggthemr.palette <- function(palette) 
  return (palette)

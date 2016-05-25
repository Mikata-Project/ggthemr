library(stringr)

(function () {
  
  # List of theme files.
  themes_url <- 'https://github.com/chriskempson/base16-builder/tree/master/schemes'
  
  # Download themes.
  themes_list <- RCurl::getURL(themes_url)
  
  # Pull out the theme file names.
  themes <- unique(str_match_all(themes_list, '[a-z0-9\\-]*\\.yml')[[1L]])

  getFromPalette <- function (palette) 
    function (...) 
      paste0('#', unlist(palette[as.character(list(...))], FALSE, FALSE))
  
  get_theme <- function (name) {
    
    # Download the theme file.
    url <- paste0('https://raw.githubusercontent.com/chriskempson/base16-builder/master/schemes/', name)
    raw <- RCurl::getURL(url)
    
    # Extract the colour names and values.
    colours <- unlist(str_extract_all(raw, '([a-fA-F0-9]{6})'))
    names(colours) <- unlist(str_extract_all(raw, 'base0[0-9A-F]'))
    
    # Getter function by name.
    gp <- getFromPalette(colours)
    
    # Palette name.
    title <- str_replace(str_match(name, '([a-z0-9 \\-]*)\\.yml')[, 2], '-', ' ')
    
    # The Base16 default is called 'default'. Have to rename that.
    if (title == 'default') title <- 'base16'
    
    tryCatch({
      light_theme <- define_palette(swatch = c(gp('base02'), theme_swatch), 
                                  background = gp('base07'), 
                                  line = gp('base05', 'base05'),
                                  text = gp('base02', 'base03'),
                                  gridline = gp('base06'),
                                  gradient = gp('base0A', 'base08'))
    
      dark_theme <- define_palette(swatch = c(gp('base07'), theme_swatch), 
                                 background = gp('base00'), 
                                 line = gp('base02', 'base02'),
                                 text = gp('base03', 'base07'),
                                 gridline = gp('base03'),
                                 gradient = gp('base0A', 'base08'))
    
      # Make a dark and light palette.
      setNames(list(light_theme, dark_theme), paste(title, c('light', 'dark')))
      
    }, error = function (e) NULL)
    
  }
  
  # Generate a dark and light palette for every theme. 
  palettes <- unlist(lapply(themes, get_theme), FALSE)
  
  # Save palettes.
  dump('palettes', 'R/palettes_base16.R')
  
})()

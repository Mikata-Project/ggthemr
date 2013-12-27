


ggthemr
========================================================

Themes for ggplot2. The idea of this package is that you can just set the theme and then forget about it. You shouldn't have to change any of your existing code. There are several parts to a theme:
* Colour palette for the background, axes, gridlines, text etc. 
* Layout of axes lines and gridlines.
* Spacing around plot and between elements (i.e. axes titles to axes lines etc). You can set the spacing to determine how compact or spread out a plot is.
* Text size.

There are a number of preset palettes and layouts, and methods to create your own colour schemes.


Installation
-------------------------

This package is still under development and isn't too stable yet, but can be installed using [devtools](http://cran.r-project.org/web/packages/devtools/index.html).


```r
devtools::install_github("ggthemr", "cttobin")
```



Palettes
-------------------------

The palette determines the colours of everything in a plot including the background, layers, gridlines, title text, axes lines, axes text and axes titles. The *swatch* is the the name given to the set of colours strictly used in styling the geoms/layer elements (e.g. the points in *geom_point()*, bars in *geom_bar()* etc.). At least six colours have been supplied in each palette's swatch. 

There are a wide variety of themes in this package (and more on the way). Some of them serious business... others are delibrately stylish and might not be that good for use in proper publications. 

### camoflauge
  
  ![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

### carrot
  
  ![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 

### chalk
  
  ![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

### citrus
  
  ![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 

### copper
  
  ![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 

### dust
  
  ![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 

### earth
  
  ![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 

### fresh
  
  ![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10.png) 

### grape
  
  ![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11.png) 

### grass
  
  ![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-12.png) 

### greyscale
  
  ![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13.png) 

### light
  
  ![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14.png) 

### lilac
  
  ![plot of chunk unnamed-chunk-15](figure/unnamed-chunk-15.png) 

### pale
  
  ![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-16.png) 

### sea
  
  ![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-17.png) 

### sky
  
  ![plot of chunk unnamed-chunk-18](figure/unnamed-chunk-18.png) 

### solarized
  
  ![plot of chunk unnamed-chunk-19](figure/unnamed-chunk-19.png) 

### solarized dark
  
  ![plot of chunk unnamed-chunk-20](figure/unnamed-chunk-20.png) 


Layouts
-------------------------

The layout of a theme controls the appearance and position of the axes, gridlines and text. Some folk prefer both major and minor gridlines, others prefer none or something in between. 

### Clean
  
  ![plot of chunk unnamed-chunk-21](figure/unnamed-chunk-21.png) 

### Clear
  
  ![plot of chunk unnamed-chunk-22](figure/unnamed-chunk-22.png) 

### Minimal
  
  ![plot of chunk unnamed-chunk-23](figure/unnamed-chunk-23.png) 


### Plain
  
  ![plot of chunk unnamed-chunk-24](figure/unnamed-chunk-24.png) 

### Scientific
  
  ![plot of chunk unnamed-chunk-25](figure/unnamed-chunk-25.png) 


Spacing
-------------------------

Plot margins and space between axes titles and lines etc. is controlled with the *spacing* parameter. Lower values will make plots more compact, higher values will give them more padding. Compare the plots below where the spacing has been set to 0, 1 and 2 respectively.

![plot of chunk unnamed-chunk-26](figure/unnamed-chunk-26.png) 


![plot of chunk unnamed-chunk-27](figure/unnamed-chunk-27.png) 


![plot of chunk unnamed-chunk-28](figure/unnamed-chunk-28.png) 


Type
-------------------------

The *type* parameter can be set to either *inner* or *outer*. When *inner*, the background colour of a plot will not extend past the plot area. *outer* will colour the entire plot and background. 


```r
ggthemr("sea", type = "inner")
example_plot
```

![plot of chunk unnamed-chunk-29](figure/unnamed-chunk-29.png) 



```r
ggthemr("sea", type = "outer")
example_plot
```

![plot of chunk unnamed-chunk-30](figure/unnamed-chunk-30.png) 



Adjustments
-------------------------

Most of the time you'll probably just want to set the theme and not worry about it. There may be times though where you'll want to make some small adjustment, or manually change what items appear as what colour in a plot. If you just set a theme using ggthemr() normally, it doesn't actually return anything. However, set the *static* parameter to *FALSE* and the theme will be returned:


```r
themr <- ggthemr("dust", static = FALSE)
```


Now you can edit the theme stored in *themr*. For example, here's a plot:


```r
mpg_plot <- ggplot(mpg[mpg$drv != "4", ], aes(factor(cyl), cty, fill = drv)) + 
    geom_boxplot() + labs(x = "Cylinders", y = "City MPG", fill = "Drive Type") + 
    theme(legend.position = "bottom")
mpg_plot
```

![plot of chunk unnamed-chunk-32](figure/unnamed-chunk-32.png) 


For some reason you decide you want to change those colours. Front-wheel drive vehicles should be purple. Rear-wheelers should be that orange colour. You could change the order of the levels of your fill variable, but you shouldn't have to do that. You just want to switch those colours but you have no idea what they are. *swatch()* will give you the colours in a ggthemr palette. 


```r
swatch(themr)
```

```
## [1] "#555555" "#db735c" "#EFA86E" "#9A8A76" "#F3C57B" "#7A6752" "#2A91A2"
## [8] "#87F28A" "#6EDCEF"
## attr(,"class")
## [1] "ggthemr.swatch"
```


So you can manually swap the two colours around.


```r
to_swap <- swatch(themr)[2:3]
mpg_plot + scale_fill_manual(values = rev(to_swap))
```

![plot of chunk unnamed-chunk-34](figure/unnamed-chunk-34.png) 


**Note:** the first colour in a swatch is a special one. It is reserved for outlining boxplots, text etc. 

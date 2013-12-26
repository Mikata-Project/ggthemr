palettes <- lapply(

  list(
      
#     blank = list(
#       background = '#', 
#       text = list(inner = '#', outer = '#'), 
#       line = '#',
#       gridline = '#',
#       swatch = c(
#         '#', '#', 
#         '#', '#', 
#         '#', '#',
#         '#', '#'),
#       gradient = list(low = '#', high = '#')
#     ),
    
    citrus = list(
      background = '#fcd30d', 
      text = c(inner = '#d22d24', outer = '#d22d24'), 
      line = c(inner = '#BC9E0A', outer = '#BC9E0A'),
      gridline = '#ffffff',
      swatch = structure(c(
        '#2C2C2C', 
        '#d22d24', '#2fb797',
        '#6a6959', '#008533', 
        '#3D3303', '#104D85',
        '#85120B', '#CDD93B'), class = 'ggthemr.swatch'),
      gradient = c(low = '#2fb797', high = '#3D3303')
    ),
    
    carrot = list(
      background = '#EC7C47', 
      text = c(inner = '#6C3921', outer = '#222222'), 
      line = c(inner = '#AC5B34', outer = '#AC5B34'),
      gridline = '#D26F3F',
      swatch = structure(c(
        '#6C3921', 
        '#45764A', '#63AB5E',
        '#ffffff', '#B05D34', 
        '#6C4F41', '#EFAE90',
        '#109F92', '#47ECDD'), class = 'ggthemr.swatch'),
      gradient = c(low = '#', high = '#')
    ),
    
    pale = list(
      background = '#ffffff', 
      text = c(inner = '#444444', outer = '#444444'), 
      line = c(inner = '#d1d1d1', outer = '#eaeaea'),
      gridline = '#eaeaea',
      swatch = structure(c(
        '#444444',
        '#de6757', '#EB9050', 
        '#3262AB', '#FF8D7D', 
        '#C8E370', '#C45B4D',
        '#41a65c', '#5E2C25', 
        '#78695F'), class = 'ggthemr.swatch'),
      gradient = c(low = '#C8E370', high = '#de6757')
    ),
    
    # Complete.
    copper = list(
      background = '#e1965d', 
      text = c(inner = '#e1965d', outer = '#f2f0ee'), 
      line = c(inner = '#614128', outer = '#f4d7c1'),
      gridline = '#e9b288',
      swatch = structure(c(
        '#0d0905',
        '#614128', '#AE7448', 
        '#f2f0ee', '#E6C1A4', 
        '#EE6C56', '#208794',
        '#37AE79', '#5DD2E1', 
        '#4B37AE', '#78E676'), class = 'ggthemr.swatch'),
      gradient = c(low = '#f2f0ee', high = '#614128')
    ),
    
#     clear = list(
#       background = '#e8ece5', 
#       text = list(inner = '#6b3241', outer = '#6b3241'), 
#       line = '#bbb8ab',
#       gridline = '#bbb8ab',
#       swatch = c(
#         '#9b3950', '#f79b57', 
#         '#6b3241', '#e65e62', 
#         '#9e7587', '#4C8659',
#         '#6B6C69', '#0b0e0a'),
#       gradient = list(low='#e5c8cf', high='#6b3241')
#     ),
    
    # Complete.
    peach = list(
      background = '#e8ece5', 
      text = c(inner = '#6b3241', outer = '#6b3241'), 
      line = c(inner = '#bbb8ab', outer = '#bbb8ab'),
      gridline = '#bbb8ab',
      swatch = structure(c(
        '#0b0e0a',
        '#9b3950', '#f79b57', 
        '#6b3241', '#e65e62', 
        '#9e7587', '#4C8659',
        '#6B6C69', '#0b0e0a'), class = 'ggthemr.swatch'),
      gradient = c(low='#e5c8cf', high='#6b3241')
    ),
    
#     hacker = list(
#       background = '#212a19', 
#       text = list(inner = '#212a19', outer = '#87a46b'), 
#       line='#5d7347',
#       gridline = '#4c5e3a',
#       swatch = c(
#         '#87a46b', '#', 
#         '#', '#', 
#         '#', '#'),
#       gradient = list(low='#', high='#')
#     ),
    
    # Complete.
    light = list(
      background = '#f6f1eb', 
      text = c(inner = '#706f6f', outer = '#706f6f'), 
      line = c(inner = '#dadada', outer = '#785d37'),
      gridline = '#dadada',
      swatch = structure(c(
        '#785d37',
        '#62bba5', '#ffb84d', 
        '#aaa488', '#b2432f', 
        '#3a6589', '#9b5672', 
        '#908150', '#373634'), class = 'ggthemr.swatch'),
      gradient = c(low = '#62bba5', high = '#373634')
    ),
    
#     pink = list(
#       background = '#ECE5CE',
#       text = list(inner = '#774F38', outer = '#774F38'),
#       line = '#774F38',
#       gridline = '#d0ae9a',
#       swatch = c(
#         'red', '#50798e',
#         '#56a076')
#     ),
    
#     book = list(
#       background = '#ffffff',
#       text = list(inner = '#000000', outer = '#000000'),
#       line = '#000000',
#       gridline = '#d0ae9a',
#       swatch = c(
#         a = '#000000'
#       )
#     ),
    
    sky = list(
      background = '#bfeaf8', 
      text = c(inner = '#739EAB', outer = '#59595c'), 
      line = c(inner = '#739EAB', outer = '#ffffff'),
      gridline = '#ffffff',
      swatch = structure(c(
        '#59595c', 
        '#739EAB', '#2C3639', 
        '#36555E', '#f99e93', 
        '#c43d31', '#', 
        '#', '#'), class = 'ggthemr.swatch'),
      gradient = c(low = '#f99e93', high = '#2C3639')
    ),
    
    solarized = list(
      background = '#fdf6e3', 
      text = c(inner = '#586e75', outer = '#586e75'), 
      line = c(inner = '#073642', outer = '#073642'),
      gridline = '#eee8d5',
      swatch = structure(c(
        '#073642', 
        '#268bd2', '#dc322f',
        '#859900', '#d33682', 
        '#cb4b16', '#2aa198',
        '#859900', '#6c71c4'), class = 'ggthemr.swatch'),
      gradient = c(low = '#dc322f', high = '#268bd2')
    ),
    
    'solarized dark' = list(
      background = '#073642', 
      text = c(inner = '#586e75', outer = '#eee8d5'), 
      line = c(inner = '#073642', outer = '#586e75'),
      gridline = '#586e75',
      swatch = structure(c(
        '#fdf6e3', 
        '#268bd2', '#dc322f',
        '#859900', '#d33682', 
        '#cb4b16', '#2aa198',
        '#859900', '#6c71c4'), class = 'ggthemr.swatch'),
      gradient = c(low = '#dc322f', high = '#268bd2')
    ),
    
    # Complete.
    grass = list(
      background = '#64a756', 
      text = c(inner = '#2F4D28', outer = '#2F4D28'), 
      line = c(inner = NA, outer = '#d6eecb'),
      gridline = '#a4d98b',
      swatch = structure(c(
        '#4A3D4F',
        '#CEF3C6', '#ded42f', 
        '#B45454', '#3E6735', 
        '#be1d2d', '#57826F'), class = 'ggthemr.swatch'),
      gradient = c(low='#ded42f', high='#B45454')
    ),
    
#     deadpool = list(
#       background = '#070300', 
#       text = list(inner = '#070300', outer = '#fcfbf9'), 
#       line = '#d6b196', 
#       gridline = '#98623b',
#       swatch = c(
#         '#da1f0c', '#7e6c6c', 
#         '#b66c17', '#E7019E', 
#         '#1A59A7', '#008D41'),
#       gradient = list(low='#E05D50', high='#da1f0c')
#     ),
    
    
    # Complete.
    sea = list(
      background = '#27a4f8', 
      text = c(inner = '#27a4f8', outer = '#fcfbf9'), 
      line = c(inner = NA, outer = '#b9c8c3'), 
      gridline = '#b9c8c3',
      swatch = structure(c(
        '#135078',
        '#f0f0f0', '#F1F14C', 
        '#135078', '#F94240', 
        '#cbe9fd', '#F9A765', 
        '#092639', '#C5430B',
        '#C5C40B', '#8acefb'), class = 'ggthemr.swatch'),
      gradient = c(low='#f0f0f0', high='#092639')
    ),
    
    earth = list(
      background = '#686848', 
      text = list(inner = '#4f4f4e', outer = '#f6f6f6'), 
      line = list(inner = '#1f201f', outer = '#353525'), 
      gridline = '#4E4E36',
      swatch = c(
        '#F4F4A9', 
        '#6d9a58', '#e5ca28', 
        '#4E4E36', '#f6f6f6', 
        '#c8cc9f', '#353525'),
      gradient = list(low='#F4F4A9', high='#6d9a58')
    )
#     
#     grey = list(
#       background = '#eaeaea', 
#       text = list(inner = '#555555', outer = '#555555'), 
#       line = '#d1d1d1', 
#       gridline = '#ffffff',
#       swatch = c(
#         '#6d9a58', '#e5ca28', 
#         '#9b5949', '#f6f6f6', 
#         '#c8cc9f', '#'),
#       gradient = list(low='#E05D50', high='#da1f0c')
#     ),
#     
#     rob = list(
#       background = '#36312C', 
#       text = list(inner = '#555555', outer = '#F8F8F0'), 
#       line = '#F8F8F0', 
#       gridline = '#7A7267',
#       swatch = c(
#         '#DB784D', '#95CC5E', 
#         '#7A7267', '#E84646', 
#         '#F8BB39', '#E1AA93', 
#         '#2B338E'),
#       gradient = list(low='#7A7267', high='#DB784D')
#     ), #2A33A8 
#     
#     robl = list(
#       background = '#ffffff', 
#       text = list(inner = '#555555', outer = '#F8F8F0'), 
#       line = '#BAA188', 
#       gridline = '#BAA188',
#       swatch = c(
#         a = '#448048', b = '#0E18A1', 
#         c = '#D45C28', d = '#33111E', 
#         e = '#7D6852', f = '#1EE69C', 
#         g = '#80445B'),
#       gradient = list(low='#7A7267', high='#DB784D')
#     )
    
  ), function(x) {
    class(x) <- 'ggthemr.palette'
    x
  })

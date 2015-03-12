plosbioplottheme <- function()
{
theme_bw() + 
  theme(text = element_text(size=12, family='Arial')) + 
  #eliminates background, gridlines, and chart border
  theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
  ) +
  #draws x and y axis line
  theme(axis.line = element_line(color = 'black')) 
}
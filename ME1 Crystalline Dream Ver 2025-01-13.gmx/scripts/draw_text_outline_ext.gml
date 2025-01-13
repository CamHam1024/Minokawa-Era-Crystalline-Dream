///draw_text_outline_ext(x, y, text, textColor, outlineColor, Width, Font, Alpha, Xscale, Yscale, Rotation)
 
var xx= argument0
var yy= argument1
var text= argument2
var tcolor= argument3
var ocolor= argument4
var width= argument5
var font= argument6
var Alpha= argument7
var Xscale= argument8
var Yscale= argument9
var Rotation= argument10

var pcolor=draw_get_color()
var palpha=draw_get_alpha()
 

draw_set_color(ocolor)
draw_set_alpha(Alpha)
draw_set_font(font)
draw_text_transformed(xx-width, yy, text, Xscale, Yscale, Rotation)
draw_text_transformed(xx+width, yy, text, Xscale, Yscale, Rotation)
draw_text_transformed(xx, yy-width, text, Xscale, Yscale, Rotation)
draw_text_transformed(xx, yy+width, text, Xscale, Yscale, Rotation)

draw_text_transformed(xx-width, yy+width, text, Xscale, Yscale, Rotation)
draw_text_transformed(xx+width, yy-width, text, Xscale, Yscale, Rotation)
draw_text_transformed(xx+width, yy+width, text, Xscale, Yscale, Rotation)
draw_text_transformed(xx-width, yy-width, text, Xscale, Yscale, Rotation)
 
draw_set_color(tcolor)
draw_text_transformed(xx, yy, text, Xscale, Yscale, Rotation)

draw_set_alpha(palpha)
draw_set_color(pcolor)

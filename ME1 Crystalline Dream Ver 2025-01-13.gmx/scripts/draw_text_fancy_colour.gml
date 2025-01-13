///draw_text_outline(x, y, text, textColor, OutlineColor, OutlineSize, Font, Alpha)
 
var xx= argument0
var yy= argument1
var text= argument2
var tcolor= argument3
//var ocolor = argument4
//var width = argument5
var font= argument4
var Alpha= argument5

var pcolor=draw_get_color()
var palpha=draw_get_alpha()
 
draw_set_alpha(Alpha)
draw_set_font(font)
//draw_set_color(ocolor)

//draw_text_transformed(xx, yy, text, 1+width, 1+width, 0)

draw_set_color(tcolor)

draw_text(xx, yy, text)

draw_set_alpha(palpha)
draw_set_color(pcolor)

///draw_text_outline(x, y, text, textColor, outlineColor, Width, Font, Alpha)
 
var xx= argument0
var yy= argument1
var text= argument2
var tcolor= argument3
var ocolor= argument4
var width= argument5
var font= argument6
var Alpha= argument7

var pcolor=draw_get_color()
var palpha=draw_get_alpha()
 
draw_set_color(ocolor)
draw_set_alpha(Alpha)
draw_set_font(font)
draw_text(xx-width, yy, text)
draw_text(xx+width, yy, text)
draw_text(xx, yy-width, text)
draw_text(xx, yy+width, text)

draw_text(xx-width, yy+width, text)
draw_text(xx+width, yy-width, text)
draw_text(xx+width, yy+width, text)
draw_text(xx-width, yy-width, text)
 
draw_set_color(tcolor)
draw_text(xx, yy, text)

draw_set_alpha(palpha)
draw_set_color(pcolor)

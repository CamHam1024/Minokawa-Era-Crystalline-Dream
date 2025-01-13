///draw_text_outline_coloured(x, y, text, TC1, TC2, TC3, TC4, OC, Width, Font, Alpha)
 
var xx= argument0
var yy= argument1
var text= argument2
var tcolor1= argument3
var tcolor2= argument4
var tcolor3= argument5
var tcolor4= argument6
var ocolor= argument7
var width= argument8
var font= argument9
var Alpha= argument10

var pcolor=draw_get_color()
var palpha=draw_get_alpha()
 
draw_set_color(ocolor)
draw_set_alpha(Alpha)
draw_set_font(font)

/*draw_text_colour(xx-width, yy, text, ocolor, ocolor, ocolor, ocolor, Alpha)
draw_text_colour(xx+width, yy, text, ocolor, ocolor, ocolor, ocolor, Alpha)
draw_text_colour(xx, yy-width, text, ocolor, ocolor, ocolor, ocolor, Alpha)
draw_text_colour(xx, yy+width, text, ocolor, ocolor, ocolor, ocolor, Alpha)

draw_text_colour(xx-width, yy+width, text, ocolor, ocolor, ocolor, ocolor, Alpha)
draw_text_colour(xx+width, yy-width, text, ocolor, ocolor, ocolor, ocolor, Alpha)
draw_text_colour(xx+width, yy+width, text, ocolor, ocolor, ocolor, ocolor, Alpha)
draw_text_colour(xx-width, yy-width, text, ocolor, ocolor, ocolor, ocolor, Alpha)*/

draw_text(xx-width, yy, text)
draw_text(xx+width, yy, text)
draw_text(xx, yy-width, text)
draw_text(xx, yy+width, text)

draw_text(xx-width, yy+width, text)
draw_text(xx+width, yy-width, text)
draw_text(xx+width, yy+width, text)
draw_text(xx-width, yy-width, text)

draw_set_alpha(palpha)
draw_set_color(pcolor)

draw_text_colour(xx, yy, text, tcolor1, tcolor2, tcolor3, tcolor4, Alpha)



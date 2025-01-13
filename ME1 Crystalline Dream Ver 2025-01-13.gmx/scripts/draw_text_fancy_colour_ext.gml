///draw_text_outline_coloured(x, y, text, TC1, TC2, TC3, TC4, Font, Alpha)
 
var xx= argument0
var yy= argument1
var text= argument2
var tcolor1= argument3
var tcolor2= argument4
var tcolor3= argument5
var tcolor4= argument6
//var ocolor= argument7
//var width= argument8
var font= argument7
var Alpha= argument8

draw_set_font(font)
draw_text_colour(xx, yy, text, tcolor1, tcolor2, tcolor3, tcolor4, Alpha)

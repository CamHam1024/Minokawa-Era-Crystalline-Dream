///draw_primative_ring(x, y, steps, maxrad, minrad, angle, texture, colour  alpha)

var xx = argument0 // OriginX
var yy = argument1 // OriginY
var steps = argument2 // Steps
var RingMax = argument3 // Ring max rad
var RingMin = argument4 // Ring Min rad
var angle = argument5 //angle of ring
var Texture = argument6 // texture
var Colour = argument7 // Blend Colour
var Alpha = argument8 // alpha

//Mystery variables
var TexStartx = 0
var TexStarty = 0
var RadiusAlter = 0

//ring start
if Alpha = 1
{
    draw_enable_alphablend(false)
}else{
    draw_enable_alphablend(true)
}

//texture set
draw_primitive_begin_texture(pr_trianglestrip, surface_get_texture(Texture))

xAlt = xx + lengthdir_x(RingMin, angle * 0 / steps)
yAlt = yy + lengthdir_y(RingMin , angle * 0 / steps)

for(var i = 0; i <= steps+2; i += 1)
{
    draw_vertex_texture_colour(xAlt, yAlt, xAlt/room_width, yAlt/room_height, Colour, Alpha)
    
    if RadiusAlter = 0
    {
        xAlt = xx + lengthdir_x(RingMax, angle * i / steps)
        yAlt = yy + lengthdir_y(RingMax, angle * i / steps)
    }
    else
    {                        
        xAlt = xx + lengthdir_x(RingMin, angle * (i-1) / steps)
        yAlt = yy + lengthdir_y(RingMin, angle * (i-1) / steps)
    }
    
    RadiusAlter =! RadiusAlter
}

draw_primitive_end()
draw_enable_alphablend(true)
draw_set_alpha(1)

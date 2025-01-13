draw_sprite_ext(spr_HaijiProp4, 1, 1024/2, 768/2, 1.5, 1.5, rotation, c_white, ActiveAlpha-0.2)

rotation += 0.1
rotation = rotation % 360

//Ffeathers
NoOfFeathers = 10

Spin += 0.5
Spin = Spin % 360

repeat(NoOfFeathers)
{
    draw_sprite_ext(spr_featherprop1, 0, 512 + lengthdir_x(Length1,Dir+Spin), 386 + lengthdir_y(Length1,Dir+Spin), 1, 1, Dir+90, c_white, ActiveAlpha-0.7)
    draw_sprite_ext(spr_featherprop1, 0, 512 + lengthdir_x(Length2,Dir-Spin), 386 + lengthdir_y(Length2,Dir-Spin), 1, 1, Dir+90, c_white, ActiveAlpha-0.7)
    draw_sprite_ext(spr_featherprop1, 0, 512 + lengthdir_x(Length3,Dir+Spin), 386 + lengthdir_y(Length3,Dir+Spin), 1, 1, Dir+90, c_white, ActiveAlpha-0.7)
    draw_sprite_ext(spr_featherprop1, 0, 512 + lengthdir_x(Length4,Dir-Spin), 386 + lengthdir_y(Length4,Dir-Spin), 1, 1, Dir+90, c_white, ActiveAlpha-0.7)
    draw_sprite_ext(spr_featherprop1, 0, 512 + lengthdir_x(Length5,Dir+Spin), 386 + lengthdir_y(Length5,Dir+Spin), 1, 1, Dir+90, c_white, ActiveAlpha-0.7)
    draw_sprite_ext(spr_featherprop1, 0, 512 + lengthdir_x(Length6,Dir-Spin), 386 + lengthdir_y(Length6,Dir-Spin), 1, 1, Dir+90, c_white, ActiveAlpha-0.7)
    Dir += 360/NoOfFeathers
}

Dir = 0

Length1 -= 1
if Length1 < 0
{
    Length1 = 600
}

Length2 -= 1
if Length2 < 0
{
    Length2 = 600
}

Length3 -= 1
if Length3 < 0
{
    Length3 = 600
}

Length4 -= 1
if Length4 < 0
{
    Length4 = 600
}

Length5 -= 1
if Length5 < 0
{
    Length5 = 600
}

Length6 -= 1
if Length6 < 0
{
    Length6 = 600
}
//Silluette
draw_sprite_ext(sppr_GinkeiSillProp, 0, 512, 386, 1, 1, 0, c_white, ActiveAlpha)

//Static effect
image_speed = 0.3
draw_sprite_ext(spr_GinkeiStatic, -1, 512, 386, 1, 1, 0, c_white, ActiveAlpha-0.9)

//Alpha Activation
if global.SpellcardType = "Spellcard" or global.SpellcardType = "TimeOut"
{
    if ActiveAlpha < 1 {ActiveAlpha += 0.05 }
}else{
    if ActiveAlpha > 0 {ActiveAlpha -= 0.05 }
}

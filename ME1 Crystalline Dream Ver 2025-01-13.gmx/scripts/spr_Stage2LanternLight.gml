//===========================
//Lantern Light surface

if !surface_exists(global.S2Light)
{
    global.S2Light = surface_create(1024, 768)
}

//Background froot
if instance_exists(obj_LocustFruit)
{
    with(obj_LocustFruit)
    {
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha)
    }
}

//Background TV
if instance_exists(obj_TV1)
{
    with(obj_TV1)
    {
        draw_sprite_ext(spr_TVframe, 0, x, y, image_xscale, image_yscale, TVRot, c_black, TVAlphaHidden)
        draw_sprite_ext(spr_TVScreen, TVFrameHidden + TVAnim, x, y, image_xscale, image_yscale, TVRot, c_white, TVAlphaHidden)
    }
}



surface_set_target(global.S2Light) 

//===Draw sprites go here===

scr_Stage2Background(c_white) //<--- All the sprites

//draw_sprite_ext(spr_Lanternglow, 0, xx, yy, 2, 2, 0, c_white, 0.1)

if instance_exists(obj_LocustFruit)
{
    with(obj_LocustFruit)
    {
        draw_self()
    }
}

//==========================
surface_reset_target()


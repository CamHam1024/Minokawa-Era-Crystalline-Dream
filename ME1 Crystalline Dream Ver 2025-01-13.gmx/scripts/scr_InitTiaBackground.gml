#define scr_InitTiaBackground
///Tia Spell Background

//Init variables
//scr_InitStage2BackgroundAlt()

GlowAlpha1 = 1
GlowAlpha1Switch = false
TiaXscroll = 0 

//Fake Background
FakeBlinkTime = 200
FakeGlowSwitch = 0
FakeGlow = 0

FakespeedMult = 1
FakeSt2TreeScroll = 1000
FakeTreeVer = 0
FakeLS = 0

FakeTS1 = 0

#define scr_TiaBackground
//Alpha setup
obj_BackgroundHandler.alphaBlended = false
draw_clear_alpha(c_black, 0)

//Stage background behind spellbackground 
script_execute(Stage2BackgroundFAKED)

//Spellbackground
//Background
draw_sprite_ext(spr_TiaFarback, 1, 0, 0, 1, 1, 0, c_white, 1)

draw_sprite_ext(spr_Zigzag, 0, 100, 0 + TiaXscroll, 1, 1, 90, c_white, 0.5)
draw_sprite_ext(spr_Zigzag, 0, 100, 1024 + TiaXscroll, 1, 1, 90, c_white, 0.5)

//draw_sprite_ext(spr_TiaFarback, 0, 0, 0, 1, 1, 0, c_gray, GlowAlpha1)
draw_sprite_ext(spr_TiaSill, 1, 1024/2, 768/2, 1, 1, 0, c_white, 0.6)

//Moving plane
draw_sprite_ext(spr_Zigzag, 1, 0 + TiaXscroll, 0, 1, 1, 0, c_white, 0.1)
draw_sprite_ext(spr_Zigzag, 1, -1024 + TiaXscroll, 0, 1, 1, 0, c_white, 0.1)

draw_sprite_ext(spr_TiaVignette, 1, 0, 0, 1, 1, 0, c_white, 0.8)

draw_sprite_ext(spr_tiaCcrack, 1, 0, 0, 1, 1, 0, c_white, 1)

TiaXscroll += 3
TiaXscroll = TiaXscroll % 1024


//Cracks glow handler
if GlowAlpha1Switch = false
{
    if GlowAlpha1 <= 1
    {
        GlowAlpha1 += 1/120
    }
    else
    {
        GlowAlpha1Switch = true
    }
}
else
{
    if GlowAlpha1 >= 0
    {
        GlowAlpha1 -= 1/120
    }
    else
    {
        GlowAlpha1Switch = false
    }
}
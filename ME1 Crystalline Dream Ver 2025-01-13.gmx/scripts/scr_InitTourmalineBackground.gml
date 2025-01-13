#define scr_InitTourmalineBackground
///AlexandraSpellBackground
StageBackground = 0
BossSpellBackground = 0

ActiveAlpha = 0

Amspin = 0

SBGRotation1 = 0
SBGRotation2 = 0
SBGYScroll = 0

ChainMovement = 0
ChainMovement1 = 0

#define scr_TourmalineBackground
//Alphasetup
obj_BackgroundHandler.alphaBlended = false

draw_sprite(spr_TourmyBackground, 109, 14, 0)

NoOfSpellAmulets = 7
AmDirection = 0
AmDirection1 = 0
repeat(NoOfSpellAmulets)
{
    draw_sprite_ext(spr_TourmalineCloud, 1, 1024/2 + lengthdir_x(400, AmDirection-Amspin), 768/2 + lengthdir_y(400, AmDirection-Amspin), 1, 1, AmDirection-Amspin+90, c_white, 0.8)
    AmDirection += 360/NoOfSpellAmulets
}

repeat(NoOfSpellAmulets)
{
   draw_sprite_ext(spr_TourmalineCloud, 0, 1024/2 + lengthdir_x(500, AmDirection1+Amspin), 768/2 + lengthdir_y(500, AmDirection1+Amspin), 1, 1, AmDirection1+Amspin-90, c_white, 0.5)
    
    AmDirection1 += 360/NoOfSpellAmulets
}


Amspin += 0.05
Amspin = Amspin % 360

//draw_sprite_ext(spr_MiddyProp, 1, 512, 768/2, 1, 1, 0, c_white, 0.8)

//draw_sprite_ext(spr_MidnightBackground1, 1, 512, 386, 5, 5, -SBGRotation1, c_white, 0.5)

//Alpha Activation
SBGRotation1 = SBGRotation1 mod 360
SBGRotation1 += 1

SBGRotation2 = SBGRotation2 mod 360
SBGRotation2 += 5

SBGYScroll = SBGYScroll mod 267
SBGYScroll += 1
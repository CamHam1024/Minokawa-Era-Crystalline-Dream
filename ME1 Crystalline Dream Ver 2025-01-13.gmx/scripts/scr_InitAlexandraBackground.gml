#define scr_InitAlexandraBackground
///AlexandraSpellBackground
StageBackground = 0
BossSpellBackground = 0

ActiveAlpha = 0

SBGSpinX = 0
SBGSpinY = 0

SBGRotation1 = 0
SBGRotation2 = 0

SBGXScroll = 0
SBGYScroll = 0


#define scr_AlexandraBackground
//Alphasetup
obj_BackgroundHandler.alphaBlended = false

draw_sprite_ext(spr_AlexandraBG2, 1, 512, 386, 0.7, 0.7, -SBGRotation1, c_white, 1)
draw_sprite_ext(spr_AlexSill, 0, 550, 386, 1, 1, 0, c_black, 0.5)
draw_sprite_ext(spr_AlexandraBG1, 1, 512, 386, 0.7, 0.7, SBGRotation1, c_white, 1)


//Alpha Activation
SBGRotation1 = SBGRotation1 mod 360
SBGRotation1 += 0.1

SBGYScroll = SBGYScroll mod 267
SBGYScroll += 1
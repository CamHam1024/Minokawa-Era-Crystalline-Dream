#define scr_InitLilliBackground
///AlexandraSpellBackground
//StageBackground = 0
//BossSpellBackground = 0

ActiveAlpha = 0

SBGRotation1 = 0
SBGRotation2 = 0

SBGXScroll = 0
SBGYScroll = 0

BG3XLen = 0
BG3YLen = 0


#define scr_LilliBackground
//Alphasetup
obj_BackgroundHandler.alphaBlended = false

draw_sprite(spr_TourmyBackground, 109, 14, 0)
// BG 3 Init
BG3X1 = 512 + lengthdir_x(BG3XLen, SBGRotation1 + 45)
BG3Y1 = 386 + lengthdir_y(BG3YLen, SBGRotation1 + 45)

BG3X2 = 512 + lengthdir_x(BG3XLen, SBGRotation1 + 45 + 90)
BG3Y2 = 386 + lengthdir_y(BG3YLen, SBGRotation1 + 45 + 90)

BG3X3 = 512 + lengthdir_x(BG3XLen, SBGRotation1 + 45 + 180)
BG3Y3 = 386 + lengthdir_y(BG3YLen, SBGRotation1 + 45 + 180)

BG3X4 = 512 + lengthdir_x(BG3XLen, SBGRotation1 + 45 + 270)
BG3Y4 = 386 + lengthdir_y(BG3YLen, SBGRotation1 + 45 + 270)

BG3XLen += 1
BG3XLen = BG3XLen % 300

BG3YLen = BG3XLen

//BG Sprites
draw_sprite_ext(spr_LilliBackground1, 1, 512, 386, 1, 1, 0, c_white, 1)

draw_sprite_ext(spr_LilliBackground3, 1, 512, 386, 1, 1, SBGRotation1 , c_white, 0.7)
draw_sprite_ext(spr_LilliBackground3, 1, 512, 386, 1, 1, SBGRotation1 + 90, c_white, 0.7)
draw_sprite_ext(spr_LilliBackground3, 1, 512, 386, 1, 1, SBGRotation1 + 180, c_white, 0.7)
draw_sprite_ext(spr_LilliBackground3, 1, 512, 386, 1, 1, SBGRotation1 + 270, c_white, 0.7)

draw_sprite_ext(spr_LilliBackground3, 1, BG3X1, BG3Y1, 1, 1, SBGRotation1 + 45 , c_white, 0.7)
draw_sprite_ext(spr_LilliBackground3, 1, BG3X2, BG3Y2, 1, 1, SBGRotation1 + 45 + 90, c_white, 0.7)
draw_sprite_ext(spr_LilliBackground3, 1, BG3X3, BG3Y3, 1, 1, SBGRotation1 + 45 + 180, c_white, 0.7)
draw_sprite_ext(spr_LilliBackground3, 1, BG3X4, BG3Y4, 1, 1, SBGRotation1 + 45 + 270, c_white, 0.7)

draw_sprite_ext(spr_LilliBackground2, 1, 512, 386, 1, 1, SBGRotation1, c_white, 1)
draw_sprite_ext(spr_Lilli, 1, 512, 768/2, 1, 1, 0, c_white, 0.5)

//draw_sprite_ext(spr_LilliBackground3, 1, BG3X1, BG3Y1, 1, 1, SBGRotation1 + 45, c_white, ActiveAlpha)


//Alpha Activation
SBGRotation1 = SBGRotation1 mod 360
SBGRotation1 += 0.1

SBGYScroll = SBGYScroll mod 267
SBGYScroll += 1
#define scr_InitMidnightBackground
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

#define scr_MidnightBackground
//Alphasetup
obj_BackgroundHandler.alphaBlended = false

draw_sprite_ext(spr_MidnightBackground1, 1, 512, 386, 2, 2, SBGRotation1, c_white, 0.2)

NoOfSpellAmulets = 15
AmDirection = 0
repeat(NoOfSpellAmulets)
{
    draw_sprite_ext(spr_SpellcardProp2, 1, 1024/2 + lengthdir_x(300, AmDirection+Amspin), 768/2 + lengthdir_y(300, AmDirection+Amspin), 1, 1, AmDirection+Amspin-90, c_white, 0.3)
    AmDirection += 360/NoOfSpellAmulets
}

Amspin += 0.1
Amspin = Amspin % 360

draw_sprite_ext(spr_MiddyFull, 1, 512, 768/2, 1, 1, 0, c_black, 0.5)

NoOfChains = 20
DrawnChains = 0
DrawnChains1 = 0

ChainMovement += 1
ChainMovement = ChainMovement % 65

ChainMovement1 += 1
ChainMovement1 = ChainMovement1 % 130
repeat(NoOfChains)
{
    draw_sprite_ext(spr_MiddyChain, 1, 0+DrawnChains1+ChainMovement1, 14, 2, 2, 0, c_white, 0.2)
    draw_sprite_ext(spr_MiddyChain, 1, 0+DrawnChains1-ChainMovement1, 768-16, 2, 2, 0, c_white, 0.2)
    draw_sprite_ext(spr_MiddyChain, 1, 192, 0+DrawnChains1-ChainMovement1, 2, 2, 90, c_white, 0.2)
    draw_sprite_ext(spr_MiddyChain, 1, 1024-192, 0+DrawnChains1+ChainMovement1, 2, 2, 90, c_white, 0.2)
    
    draw_sprite_ext(spr_MiddyChain, 1, 192+30, 0+DrawnChains+ChainMovement, 1, 1, 90, c_white, 0.1)
    draw_sprite_ext(spr_MiddyChain, 1, 1024-192-30, 0+DrawnChains-ChainMovement, 1, 1, 90, c_white, 0.1)
    draw_sprite_ext(spr_MiddyChain, 1, 0+DrawnChains-ChainMovement, 14+30, 1, 1, 0, c_white, 0.1)
    draw_sprite_ext(spr_MiddyChain, 1, 0+DrawnChains+ChainMovement, 768-16-30, 1, 1, 0, c_white, 0.1)
    DrawnChains += 65
    DrawnChains1 += 130
}

draw_sprite_ext(spr_MidnightBackground1, 1, 512, 386, 5, 5, -SBGRotation1, c_white, 0.5)

//Alpha Activation
SBGRotation1 = SBGRotation1 mod 360
SBGRotation1 += 1

SBGRotation2 = SBGRotation2 mod 360
SBGRotation2 += 5

SBGYScroll = SBGYScroll mod 267
SBGYScroll += 1
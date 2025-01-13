#define scr_InitStage1Background
MainPathScroll = 0
TreeScroll1 = 0
TreeScroll2 = 0

LanternY = 0

PGlowFlux = 0
PGlowFluxSwitch = true
S1PGlowInc = 1

GlowSpin = random(360)
GlowRad = 0.5
GlowRadSwitch = true

PortDirection = 0

Ymovement = 0

ScrollSpeed = 1

FireflyInt1 = 0 
FireflyInt2 = 0 
PinkFireflies = false

EndOfStage = false


#define scr_Stage1Background
//main Path
MainPathScroll += 1.234 * ScrollSpeed
MainPathScroll = MainPathScroll mod 768

draw_sprite(spr_FillerPath1, 0, 512, 0 + MainPathScroll)
draw_sprite(spr_FillerPath1, 0, 512, -768 + MainPathScroll)

//Lanterns
//System
LanternY += 1.234 * ScrollSpeed
for (var ly = LanternY % 600 - 500; ly < room_height + 500; ly += 600)
{
    //Lanterns
    draw_sprite(spr_Stage1Lantern, 0, 350, ly)
    draw_sprite(spr_Stage1Lantern, 0, 1024 - 350, 300 + ly)

    draw_sprite_ext(spr_Lanternglow, 0, 350, ly, GlowRad, GlowRad, 0, c_white, 0.8)
    draw_sprite_ext(spr_Lanternglow, 0, 1024 - 350, ly + 300, GlowRad, GlowRad, 0, c_white, 0.8)
}

//Lantern glow
//System
GlowSpin += 3 
GlowSpin = GlowSpin mod 360
if GlowRad > 1 {GlowRadSwitch = false}
if GlowRad < 0.9 {GlowRadSwitch = true}
if GlowRadSwitch = false {GlowRad -= 0.1/60}
if GlowRadSwitch = true{GlowRad += 0.1/60}

//PortalGlowy 
if PGlowFlux > 1 {PGlowFluxSwitch = false}
if PGlowFlux < 0 {PGlowFluxSwitch = true}
if PGlowFluxSwitch = false {PGlowFlux -= 1/240}
if PGlowFluxSwitch = true{PGlowFlux += 1/240}

PortX = lengthdir_x(200, PortDirection)
PortDirection += 0.3
PortDirection = PortDirection % 360

draw_sprite_ext(spr_DreamEnergy, 0, 512+PortX, 0, 1, 1, 0, c_white, PGlowFlux - S1PGlowInc)

//Trees1
TreeScroll1 += 1.634 * ScrollSpeed
TreeScroll1 = TreeScroll1 mod 768

draw_set_alpha(1)
draw_sprite(spr_Stage1Path2aBottom, 0, 120, 0 + TreeScroll1)
draw_sprite(spr_Stage1Path2aBottom, 0, 120 , -768 + TreeScroll1)
draw_sprite(spr_Stage1Path2bBottom, 0, 1024 - 120, 0 + TreeScroll1)
draw_sprite(spr_Stage1Path2bBottom, 0, 1024 - 120, -768 + TreeScroll1)
draw_set_alpha(1)

//Trees2
TreeScroll2 += 2.134 * ScrollSpeed
TreeScroll2 = TreeScroll2 mod 768

draw_set_alpha(0.5)
draw_sprite(spr_Stage1Path2aTop, 0, 70, 0 + TreeScroll2)
draw_sprite(spr_Stage1Path2aTop, 0, 70, -768 + TreeScroll2)
draw_sprite(spr_Stage1Path2bTop, 0, 1024-70, 0 + TreeScroll2)
draw_sprite(spr_Stage1Path2bTop, 0, 1024-70, -768 + TreeScroll2)
draw_set_alpha(1)

//Filter
draw_sprite(spr_Filter1, 0, 0, 0)

//Start Fade In Ymovement
if Ymovement < 1200
{
    Ymovement += 20
}

//draw_sprite_ext(spr_StagerHaze, 0, 512, 768 + Ymovement, 1, -1, 0, c_white, 1)

///Fireflies
FireflyInt1 += 1
FireflyInt1 = FireflyInt1 % 20

if FireflyInt1 = 1
{
        instance_create(x, y, obj_Stage1Fireflies1)
}

if PinkFireflies = true
{
    FireflyInt2 += 1
    FireflyInt2 = FireflyInt2 % 40

    if FireflyInt2 = 1
    {
        instance_create(x, y, obj_Stage1Fireflies2)
    }
}
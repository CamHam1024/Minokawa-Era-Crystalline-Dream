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
    draw_sprite(spr_Stage1Lantern, 0, 300, ly)
    draw_sprite(spr_Stage1Lantern, 0, 724, 300 + ly)

    draw_sprite_ext(spr_Lanternglow, 0, 300, ly, GlowRad, GlowRad, GlowSpin, c_white, 0.8)
    draw_sprite_ext(spr_Lanternglow, 0, 724, ly + 300, GlowRad, GlowRad, GlowSpin, c_white, 0.8)
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
draw_sprite_ext(spr_PortalGlow1, 0, 512, 0, 1, PGlowFlux, 0, c_white, PGlowFlux - S1PGlowInc)

if PGlowFlux > 1 {PGlowFluxSwitch = false}
if PGlowFlux < 0 {PGlowFluxSwitch = true}
if PGlowFluxSwitch = false {PGlowFlux -= 1/240}
if PGlowFluxSwitch = true{PGlowFlux += 1/240}

//Trees1
TreeScroll1 += 1.634 * ScrollSpeed
TreeScroll1 = TreeScroll1 mod 768

draw_set_alpha(1)
draw_sprite(spr_Stage1Path2aBottom, 0, 100 - 20, 0 + TreeScroll1)
draw_sprite(spr_Stage1Path2aBottom, 0, 100 - 20, -768 + TreeScroll1)
draw_sprite(spr_Stage1Path2bBottom, 0, 1024 - 100 + 20, 0 + TreeScroll1)
draw_sprite(spr_Stage1Path2bBottom, 0, 1024 - 100 + 20, -768 + TreeScroll1)
draw_set_alpha(1)

//Trees2
TreeScroll2 += 2.134 * ScrollSpeed
TreeScroll2 = TreeScroll2 mod 768

draw_set_alpha(0.7)
draw_sprite(spr_Stage1Path2aTop, 0, 0 + 20, 0 + TreeScroll2)
draw_sprite(spr_Stage1Path2aTop, 0, 0 + 20, -768 + TreeScroll2)
draw_sprite(spr_Stage1Path2bTop, 0, 1024 - 20, 0 + TreeScroll2)
draw_sprite(spr_Stage1Path2bTop, 0, 1024 - 20, -768 + TreeScroll2)
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

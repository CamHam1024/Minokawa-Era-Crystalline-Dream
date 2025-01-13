//main Path spr_Backgroundplants
var FakespeedMult = 3;

// Glow
draw_sprite_ext(spr_St2Glow, 0, 0, 0, 1, 1, 0, c_white, FakeGlow)

if FakeGlowSwitch = 0
{
    FakeGlow += 1/FakeBlinkTime
}
else
{
    FakeGlow -= 1/FakeBlinkTime
}

if FakeGlow = 0
{
    FakeGlowSwitch = 0
}

if FakeGlow = 1
{
    FakeGlowSwitch = 1
}

//==============

//Back trees

FakeLS += 0.3*FakespeedMult
FakeLS = FakeLS % 1024

for (var FakeSt4LF = -2; FakeSt4LF < 4; FakeSt4LF += 1)
{
    draw_sprite_ext(spr_Backtrees, 0, FakeLS+(1024*FakeSt4LF), 384-150, 1, 1, 0, c_black, 1)
}

//==============

// forest trees 1 (far front trees)

var TreeSize = 614;

FakeTS1 += 1*FakespeedMult
FakeTS1 = FakeTS1 % TreeSize

for (var FakeT1x = -2; FakeT1x < 4; FakeT1x += 1)
{
    draw_sprite_ext(spr_Fortrees1, 0, 0-FakeTS1+(TreeSize*FakeT1x), 384, 0.6, 0.8, 0, c_black, 1)
}

//==========================

draw_sprite(spr_PeerlessDark, 0, 0, 0)

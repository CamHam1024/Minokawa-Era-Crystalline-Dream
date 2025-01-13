#define scr_InitStage2Background
BlinkTime = 60*5
GlowSwitch = 0
Glow = 0
speedMult = 3

FunSwitch = false
FunSwitch1 = false
FunColour = 0
FunColour1 = 0
FunVal = random(100)
FunVal1 = random(100)

St2TreeScroll = 1000
TreeVer = 0
LS[0] = 0
LS[1] = 0
LS[2] = 0
LS[3] = 0
LS[4] = 0
LS[5] = 0
LS[6] = 0
TS1 = 0
TS2 = 0

LC[0] = 0
LC[1] = 0

#define scr_Stage2Background
///scr_Stage2Background(BlackOutColour)
BlackOutColour = c_black

if argument_count >= 1
{
    BlackOutColour = argument0
}

//main Path spr_Backgroundplants

// Glow

draw_sprite_ext(spr_St2Glow, 0, 0, 0, 1, 1, 0, c_white, Glow)

if GlowSwitch = 0
{
    Glow += 1/BlinkTime
}
else
{
    Glow -= 1/BlinkTime
}

if Glow = 0
{
    GlowSwitch = 0
}

if Glow = 1
{
    GlowSwitch = 1
}

//==============

//Back trees

LS[6] += 0.3*speedMult
LS[6] = LS[6] % 1024

for (var St4LF = -2; St4LF < 4; St4LF += 1)
{
    draw_sprite_ext(spr_Backtrees, 0, LS[6]+(1024*St4LF), 384-150, 1, 1, 0, BlackOutColour, 1)
}

//====================================

// Leaves Layer 3
LS[5] += 0.1*speedMult
LS[5] = LS[5] % 511

for (var St22LF = -2; St22LF < 4; St22LF += 1)
{
    draw_sprite_ext(spr_St2Leaves, 0, 30-LS[5]+(511*St22LF), 384-180, 1, 1, 0, BlackOutColour, 1)
}

LS[4] += 0.3*speedMult
LS[4] = LS[4] % 511

for (var St3LF = -2; St3LF < 4; St3LF += 1)
{
    draw_sprite_ext(spr_St2Leaves, 0, 30-LS[4]+(511*St3LF), 384-150, 1, 1, 0, BlackOutColour, 1)
}

// ===========================

// forest prop 2 (Mushrooms)

TS2 += 0.5*speedMult
TS2 = TS2 % 2048

for (var T2x = 0; T2x < 3; T2x += 1)
{
    if T2x = 1
    {
        draw_sprite_ext(spr_Backgroundplants, FunColour, -TS2+(1024*T2x), 384, 1, 1, 0, BlackOutColour, 1) //BlackOutColour
    }
    else
    {
        draw_sprite_ext(spr_Backgroundplants, FunColour1, -TS2+(1024*T2x), 384, 1, 1, 0, BlackOutColour, 1)
    }
    
    if TS2 >= 1024 //the second panel change
    {
        if FunSwitch = false
        {
            FunVal1 = ceil(random(100)) //Secret value
            FunColour1 = ceil(random_range(-1, 4))
            
            if FunVal1 >= 90 //when Secret Value reaches 90 and above trigger the secret
            { 
                FunColour1 = 5
            }
            
            FunSwitch = true
            
        }
    }
    
    if TS2 >= 2000 //first and third panel change
    {
        if FunSwitch1 = false
        {
            FunVal = ceil(random(100))
            
            FunColour = ceil(random_range(-1, 4))
            
            if FunVal >= 90
            { 
                FunColour = 5
            }
            
            FunSwitch1 = true
        }
    }
    
    if TS2 < 1024
    {
        FunSwitch = false
        FunSwitch1 = false
    }
}

draw_sprite(spr_PeerlessDark, 0, 0, -50)

//==========================

// Leaves Layer 2
LS[3] += 0.7*speedMult
LS[3] = LS[3] % 511

for (var St21LF = -2; St21LF < 4; St21LF += 1)
{
    draw_sprite_ext(spr_St2Leaves, 0, 30-LS[3]+(511*St21LF), 384-130, 1, 1, 0, BlackOutColour, 1)
}

LS[2] += 0.9*speedMult
LS[2] = LS[2] % 511

for (var St2LF = -2; St2LF < 4; St2LF += 1)
{
    draw_sprite_ext(spr_St2Leaves, 0, 30-LS[2]+(511*St2LF), 384-80, 1, 1, 0, BlackOutColour, 1)
}

// ===========================

// forest trees 1 (far front trees)

var TreeSize = 614;

TS1 += 1*speedMult
TS1 = TS1 % TreeSize

for (var T1x = -2; T1x < 4; T1x += 1)
{
    draw_sprite_ext(spr_Fortrees1, 0, 0-TS1+(TreeSize*T1x), 384, 0.6, 0.8, 0, BlackOutColour, 1)
}

//==========================

//forest leaves (far front)

LS[1] += 1.1*speedMult
LS[1] = LS[1] % 511

for (var St11LF = -2; St11LF < 4; St11LF += 1)
{
    draw_sprite_ext(spr_St2Leaves, 0, 30-LS[1]+(511*St11LF), 384-50, 1, 1, 0, BlackOutColour, 1)
    draw_sprite_ext(spr_St2Leaves, 1, 30-LS[1]+(511*St11LF), 50, 1, 1, 0, BlackOutColour, 1)
}

LS[0] += 1.2*speedMult
LS[0] = LS[0] % 511

for (var St1LF = -2; St1LF < 4; St1LF += 1)
{
    draw_sprite_ext(spr_St2Leaves, 0, 0-LS[0]+(511*St1LF), 384-14, 1, 1, 0, BlackOutColour, 1)
    draw_sprite_ext(spr_St2Leaves, 1, 0-LS[0]+(511*St1LF), 14, 1, 1, 0, BlackOutColour, 1)
}
//===========================

draw_sprite(spr_PeerlessDark, 0, 0, 0)

//draw_text_outline(200, 200, FunVal, c_white, c_black, 2, ft_YuTextSM, 1)
//draw_text_outline(200, 240, FunVal1, c_white, c_black, 2, ft_YuTextSM, 1)
//draw_text_outline(200, 280, FunColour1, c_white, c_black, 2, ft_YuTextSM, 1)


#define scr_Stage2Backgroundanom
///scr_Stage2Background(BlackOutColour)
BlackOutColour = c_white

if argument_count >= 1
{
    BlackOutColour = argument0
}

//main Path spr_Backgroundplants

// Glow

//draw_sprite_ext(spr_St2Glow, 0, 0, 0, 1, 1, 0, c_white, Glow)

/*if GlowSwitch = 0
{
    Glow += 1/BlinkTime
}
else
{
    Glow -= 1/BlinkTime
}

if Glow = 0
{
    GlowSwitch = 0
}

if Glow = 1
{
    GlowSwitch = 1
}*/

//==============

//Back trees

LS[6] += 0.3*speedMult
LS[6] = LS[6] % 1024

for (var St4LF = -2; St4LF < 4; St4LF += 1)
{
    draw_sprite_ext(spr_BacktreesANOM, 0, LS[6]+(1024*St4LF), 384-150, 1, 1, 0, BlackOutColour, 1)
}

//====================================

// Leaves Layer 3
LS[5] += 0.1*speedMult
LS[5] = LS[5] % 511

for (var St22LF = -2; St22LF < 4; St22LF += 1)
{
    draw_sprite_ext(spr_St2LeavesANOM, 0, 30-LS[5]+(511*St22LF), 384-180, 1, 1, 0, BlackOutColour, 1)
}

LS[4] += 0.3*speedMult
LS[4] = LS[4] % 511

for (var St3LF = -2; St3LF < 4; St3LF += 1)
{
    draw_sprite_ext(spr_St2LeavesANOM, 0, 30-LS[4]+(511*St3LF), 384-150, 1, 1, 0, BlackOutColour, 1)
}

// ===========================

// forest prop 2 (Mushrooms)

TS2 += 0.5*speedMult
TS2 = TS2 % 2048

for (var T2x = 0; T2x < 3; T2x += 1)
{
    if T2x = 1
    {
        draw_sprite_ext(spr_BackgroundplantsANOM, FunColour, -TS2+(1024*T2x), 384, 1, 1, 0, BlackOutColour, 1) //BlackOutColour
    }
    else
    {
        draw_sprite_ext(spr_BackgroundplantsANOM, FunColour1, -TS2+(1024*T2x), 384, 1, 1, 0, BlackOutColour, 1)
    }
    
    if TS2 >= 1024 //the second panel change
    {
        if FunSwitch = false
        {
            FunVal1 = ceil(random(100)) //Secret value
            FunColour1 = ceil(random_range(-1, 4))
            
            if FunVal1 >= 90 //when Secret Value reaches 90 and above trigger the secret
            { 
                FunColour1 = 5
            }
            
            FunSwitch = true
            
        }
    }
    
    if TS2 >= 2000 //first and third panel change
    {
        if FunSwitch1 = false
        {
            FunVal = ceil(random(100))
            
            FunColour = ceil(random_range(-1, 4))
            
            if FunVal >= 90
            { 
                FunColour = 5
            }
            
            FunSwitch1 = true
        }
    }
    
    if TS2 < 1024
    {
        FunSwitch = false
        FunSwitch1 = false
    }
}

draw_sprite(spr_PeerlessDark, 0, 0, -50)

//==========================

// Leaves Layer 2
LS[3] += 0.7*speedMult
LS[3] = LS[3] % 511

for (var St21LF = -2; St21LF < 4; St21LF += 1)
{
    draw_sprite_ext(spr_St2LeavesANOM, 0, 30-LS[3]+(511*St21LF), 384-130, 1, 1, 0, BlackOutColour, 1)
}

LS[2] += 0.9*speedMult
LS[2] = LS[2] % 511

for (var St2LF = -2; St2LF < 4; St2LF += 1)
{
    draw_sprite_ext(spr_St2LeavesANOM, 0, 30-LS[2]+(511*St2LF), 384-80, 1, 1, 0, BlackOutColour, 1)
}

// ===========================

// forest trees 1 (far front trees)

var TreeSize = 614;

TS1 += 1*speedMult
TS1 = TS1 % TreeSize

for (var T1x = -2; T1x < 4; T1x += 1)
{
    draw_sprite_ext(spr_Fortrees1ANOM, 0, 0-TS1+(TreeSize*T1x), 384, 0.6, 0.8, 0, BlackOutColour, 1)
}

//==========================

//forest leaves (far front)

LS[1] += 1.1*speedMult
LS[1] = LS[1] % 511

for (var St11LF = -2; St11LF < 4; St11LF += 1)
{
    draw_sprite_ext(spr_St2LeavesANOM, 0, 30-LS[1]+(511*St11LF), 384-50, 1, 1, 0, BlackOutColour, 1)
    draw_sprite_ext(spr_St2LeavesANOM, 1, 30-LS[1]+(511*St11LF), 50, 1, 1, 0, BlackOutColour, 1)
}

LS[0] += 1.2*speedMult
LS[0] = LS[0] % 511

for (var St1LF = -2; St1LF < 4; St1LF += 1)
{
    draw_sprite_ext(spr_St2LeavesANOM, 0, 0-LS[0]+(511*St1LF), 384-14, 1, 1, 0, BlackOutColour, 1)
    draw_sprite_ext(spr_St2LeavesANOM, 1, 0-LS[0]+(511*St1LF), 14, 1, 1, 0, BlackOutColour, 1)
}
//===========================

draw_sprite(spr_PeerlessDark, 0, 0, 0)
///character_dialog(PCut, BCut, PlayerName, BossName, OffScreenName, PlayExp, BossExp, Text, Font, DialogBox)
//Initialization!
if Init = false
{
    XPM = 0
    XBM = 0
    PlayerAlpha = 0
    BossAlpha = 0
    DialogBoxAlpha = 1
    DialogBoxShow = true
    
    PCD = false //Is the player Cutin Displayed?
    BCD = false //Is the Boss Cutin Displayed?
    PlayerTalking = false //Is the Player talking
    BossTalking = false //Is the Boss talking?
    
    DRed = 200
    DGreen = 150
    DBlue = 200
    Name = ""
    
    Init = true
}
//Variables Init
PC = argument0 //Player Cutin
BC = argument1 //Boss Cutin
PlayerName = argument2 //Player name
BossName = argument3 //Boss name
MysteryTalker = argument4
PlayerExpression = argument5 //Player's Expression?
BossExpression = argument6 //Bosses Expression?
Text = argument7 //Whats the dialog?
Font = argument8 //Whats the font?
DialogBox = argument9

//MiscVariables
XPStart = 200
YPStart = 200 + 350
XBStart = 1024 - 200
YBStart = 200 + 350

//Prefixes
scr_DialogPrefixes()

//Player Cutin
draw_sprite_ext(PC, PlayerExpression, XPStart + XPM, YPStart - XPM/2, 1, 1, 0, c_white, PlayerAlpha)

if PCD = true
{
    if PlayerTalking = true
    {
        //The Player is Talking
        if PlayerAlpha < 1
        {   
            PlayerAlpha += 0.05
        }
        
        if XPM < 100
        {
            XPM += 5
        }
    }
    else
    {
        //The Player isnt talking
        if PlayerAlpha < 0.5
        {
            PlayerAlpha += 0.05
        }
        if PlayerAlpha > 0.5
        {
            PlayerAlpha -= 0.05
        }
    
        if XPM < 50
        {
            XPM += 5
        }
        
        if XPM > 50
        {
            XPM -= 5
        }
    }
    
}
else
{
    if PlayerAlpha > 0
    {
        PlayerAlpha -= 0.05
    }
    
    if XPM > 0
        {
            XPM -= 5
        }
}

//Boss Cutin
draw_sprite_ext(BC, BossExpression, XBStart - XBM, YBStart - XBM/2, 1, 1, 0, c_white, BossAlpha)

if BCD = true
{
    if BossTalking = true
    {
        //The Player is Talking
        if BossAlpha < 1
        {   
            BossAlpha += 0.05
        }
        
        if XBM < 100
        {
            XBM += 5
        }
    }
    else
    {
        //The Player isnt talking
        if BossAlpha < 0.5
        {
            BossAlpha += 0.05
        }
        if BossAlpha > 0.5
        {
            BossAlpha -= 0.05
        }
    
        if XBM < 50
        {
            XBM += 5
        }
        
        if XBM > 50
        {
            XBM -= 5
        }
    }
    
}
else
{
    if BossAlpha > 0
    {
        BossAlpha -= 0.05
    }
    
    if XBM > 0
        {
            XBM -= 5
        }
}

//DialogBox
TextColour = make_color_rgb(DRed, DGreen, DBlue)

draw_sprite_ext(DialogBox, 0, 207, 573, 1, 1, 0, TextColour, DialogBoxAlpha - 0.1)

//Draw text
//draw_text_outline(192+30, 752-140, Text, c_white, c_black, 1, Font, DialogBoxAlpha)
//draw_text_outline(192+35, 752-178, Name, c_white, c_black, 1, ft_Dialog, DialogBoxAlpha)
draw_text_outline_coloured(192+30, 752-135, Text, c_white, c_white, TextColour, TextColour, c_black, 1, ft_Dialog, DialogBoxAlpha)
draw_text_outline_coloured(192+35, 752-178, Name, c_white, c_white, TextColour, TextColour, c_black, 1, ft_Dialog, DialogBoxAlpha)

//DialogBox Settings
if DialogBoxShow = true
{
    if DialogBoxAlpha < 1
    {
        DialogBoxAlpha += 0.05
    }
}
else
{
    if DialogBoxAlpha > 0
    {
        DialogBoxAlpha -= 0.1
    }
}

if PlayerTalking = true and BossTalking = true
{
    Name = "Everyone"
    DRed = 200
    DBlue = 200
}
else if PlayerTalking = true
{
    Name = PlayerName
    DRed = 150
    DBlue = 250
}
else if BossTalking = true
{
    Name = BossName
    DRed = 250
    DBlue = 150
}
else if BossTalking = false and PlayerTalking = false
{
    if DialogBoxShow = true
    {
        Name = MysteryTalker
    }
    else
    {
        Name = ""
    }
    DRed = 150
    DBlue = 150
}



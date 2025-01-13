///EffectColour
if SpriteAnimated = false
{
    if ImageIndex = 0 //Red
    {
        Red = 250
        Green = 0
        Blue = 0
    }
    if ImageIndex = 1 //Orange
    {
        Red = 250
        Green = 126
        Blue = 0
    }
    if ImageIndex = 2 //Yellow
    {
        Red = 250
        Green = 250
        Blue = 0
    }
    if ImageIndex = 3//Yelleen
    {
        Red = 0
        Green = 250
        Blue = 0
    }
    if ImageIndex = 4//Green
    {
        Red = 0
        Green = 250
        Blue = 0
    }
    if ImageIndex = 5//Gran
    {
        Red = 0
        Green = 250
        Blue = 0
    }
    if ImageIndex = 6//Cyan
    {
        Red = 0
        Green = 250
        Blue = 250
    }
    if ImageIndex = 7//LT Blue
    {
        Red = 50
        Green = 50
        Blue = 250
    }
    if ImageIndex = 8//Blue
    {
        Red = 0
        Green = 0
        Blue = 250
    }
    if ImageIndex = 9//Purple
    {
        Red = 150
        Green = 0
        Blue = 200
    }
    if ImageIndex = 10//Magenta
    {
        Red = 250
        Green = 0
        Blue = 250
    }
    if ImageIndex = 11//Vekvet
    {
        Red = 250
        Green = 0
        Blue = 250
    }
    if ImageIndex = 12//black
    {
        Red = 250
        Green = 250
        Blue = 250
    }
    if ImageIndex = 13//White
    {
        Red = 250
        Green = 250
        Blue = 250
    }
    if ImageIndex >= 14//Grey
    {
        Red = 250
        Green = 250
        Blue = 250
    }
}
else
{
    if ImageIndex = 0 //Red
    {
        Red = 250
        Green = 0
        Blue = 0
    }
    if ImageIndex = 4 //Orange
    {
        Red = 250
        Green = 126
        Blue = 0
    }
    if ImageIndex = 4*2 //Yellow
    {
        Red = 250
        Green = 250
        Blue = 0
    }
    if ImageIndex = 4*3//Yelleen
    {
        Red = 0
        Green = 250
        Blue = 0
    }
    if ImageIndex = 4*4//Green
    {
        Red = 0
        Green = 250
        Blue = 0
    }
    if ImageIndex = 4*5//Gran
    {
        Red = 0
        Green = 250
        Blue = 0
    }
    if ImageIndex = 4*6//Cyan
    {
        Red = 0
        Green = 250
        Blue = 250
    }
    if ImageIndex = 4*7//LT Blue
    {
        Red = 50
        Green = 50
        Blue = 250
    }
    if ImageIndex = 4*8//Blue
    {
        Red = 0
        Green = 0
        Blue = 250
    }
    if ImageIndex = 4*9//Purple
    {
        Red = 200
        Green = 0
        Blue = 200
    }
    if ImageIndex = 4*10//Magenta
    {
        Red = 250
        Green = 0
        Blue = 250
    }
    if ImageIndex = 4*11//Vekvet
    {
        Red = 250
        Green = 0
        Blue = 250
    }
    if ImageIndex = 4*12//black
    {
        Red = 250
        Green = 250
        Blue = 250
    }
    if ImageIndex = 4*13//White
    {
        Red = 250
        Green = 250
        Blue = 250
    }
    if ImageIndex >= 4*14//Grey
    {
        Red = 250
        Green = 250
        Blue = 250
    }
}
//Effects
EffectColour = make_colour_rgb(Red, Green, Blue)

//-=Colour Key=-
/* 
0, 0 = Red  
1, 4 = Orange
2, 8 = Yellow
3, 12 = yelleen
4, 16 = Green
5, 20 = gran
6, 24 = Cyan
7, 28 = Lt Blue
8, 32 = Blue
9, 36 = Purple
10, 40 = Magenta
11, 44 = Velvet
12, 48 = White
13, 52 = Black

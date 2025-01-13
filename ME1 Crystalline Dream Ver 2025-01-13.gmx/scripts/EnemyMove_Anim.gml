//Base Movement
dx = xcord - x
dy = ycord - y
Distance = point_distance(x,y,xcord,ycord)
if Distance > 0
{
    dx /= Distance
    dy /= Distance

    x +=dx * min(Distance / 10, Speed)
    y +=dy * min(Distance / 10, Speed)
}

if point_distance(x, y, xcord, ycord) < 1
{
    x = xcord
    y = ycord
    Speed = 0
}

//Sprite Animation
if x = xprevious 
{
    ImageIndex = 0
}


if x < xprevious {ImageIndex = 4}
if x > xprevious {ImageIndex = 8}

Anim += 0.10
Anim = Anim mod 4
image_index = ImageIndex + Anim




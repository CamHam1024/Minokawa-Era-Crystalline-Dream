//Movement
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



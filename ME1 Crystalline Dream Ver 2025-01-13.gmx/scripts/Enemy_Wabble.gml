//Minor movements (to make things look nicer)
x = CenterX + lengthdir_x(Radius, SpinSpeed)
y = CenterY + lengthdir_y(Radius, SpinSpeed)

//Movement Path
if Radius < 16
{
    Radius += 0.1
}

if Type = 0
{
    SpinSpeed += 1
}

if Type = 1
{
    SpinSpeed -= 1
}





///Rand_Movement_Improved(Distence, MaxDistX, MaxDistY1, MaxDistY2, Speed)

MoveDist = argument0

if point_distance(x, y, xcord, ycord) < 1
{
            //Movement
            //X Movement
            xcord = x + lengthdir_x(MoveDist, random_range(-360,360)) //ceil(random_range(-MoveDist,MoveDist))
            if x <= 192 + argument1
            {
                xcord = xcord + lengthdir_x(MoveDist, 0)
            }
                    
            if x >= 1024-192 - argument1
            {
                xcord = xcord + lengthdir_x(MoveDist, 180)
            }
        
            if x = xcord-0.1
            {
                xcord = x
            }
            
            if x = xcord+0.1
            {
                xcord = x
            }
            
            //Y Movement
            ycord = y + lengthdir_y(MoveDist, random_range(-360,360))
            if y <= 14 + argument2
            {
                ycord = ycord + lengthdir_y(MoveDist, 270)
            }
                    
            if y >= argument3
            {
                ycord = ycord + lengthdir_y(MoveDist, 90)
            }
            
            if y = ycord-0.1
            {
                ycord = y
            }
            
            if y = ycord+0.1
            {
                ycord = y
            }
            
            //Move Speed
            Speed = argument4
}
else
{
    x = x
    y = y
}

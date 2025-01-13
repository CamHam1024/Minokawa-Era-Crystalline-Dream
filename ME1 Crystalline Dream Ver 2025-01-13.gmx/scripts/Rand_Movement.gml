///Rand_Movement(Freq, Distence, MaxDistX, MaxDistY1, MaxDistY2, Speed)

MoveDist = argument1

if x = xcord and y = ycord
{
    if argument0 > 1
    {
    //Movement
    MoveRate += 1
    MoveRate = MoveRate mod argument0
    
    if MoveRate = 1
    {
        //X Movement
        xcord = x + ceil(random_range(-MoveDist,MoveDist))
        if x <= 192 + argument2
        {
            xcord = xcord + ceil(random_range(50, 100))
        }
                    
        if x >= 832 - argument2
        {
            xcord = xcord - ceil(random_range(50, 100))
        }
        
        //Y Movement
        ycord = y + ceil(random_range(-MoveDist,MoveDist))
        if y <= 14 + argument3
        {
            ycord = ycord + ceil(random_range(50, 100))
        }
                    
        if y >= argument4
        {
            ycord = ycord - ceil(random_range(50, 100))
        }
        //Move Speed
        Speed = argument5
    }
    }
    else
    {
        //X Movement
        xcord = x + ceil(random_range(-MoveDist,MoveDist))
        if x <= 192 + argument2
        {
            xcord = xcord + ceil(random_range(50, 100))
        }
                    
        if x >= 832 - argument2
        {
            xcord = xcord - ceil(random_range(50, 100))
        }
        
        //Y Movement
        ycord = y + ceil(random_range(-MoveDist,MoveDist))
        if y <= 14 + argument3
        {
            ycord = ycord + ceil(random_range(50, 100))
        }
                    
        if y >= argument4
        {
            ycord = ycord - ceil(random_range(50, 100))
        }
        //Move Speed
        Speed = argument5
    }
}
else
{
    MoveRate = 0
}

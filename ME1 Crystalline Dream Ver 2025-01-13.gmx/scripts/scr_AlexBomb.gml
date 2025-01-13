BombFireRate += 1
/*if BombFireRate = 1
{
    //= Settings =========  
    shotobject = obj_AlexBombPhial//Bullet
    shotnum = 6  //Number of bullets
    shotdir = 90 //Direction of the burst
    rad = 0 //distence from the Center point
    fireX = x //Startx
    fireY = y //StartY
    shotspeed = 10 //speed of bullet
    shotspread = 45 //Angle of burst (360 = full circle)
           
    //-=[Bullet Spawner]=-
    shotdir -= shotspread / 2
    repeat shotnum 
    {
        b = instance_create(fireX + lengthdir_x(rad, shotdir) ,fireY + lengthdir_y(rad, shotdir),shotobject)   
        b.direction = shotdir
   
        b.speed = shotspeed + random_range(-5,5)

        if shotspread < 360
        {  
           shotdir += shotspread/(shotnum-1)
        }
        else
        {
            shotdir += shotspread/(shotnum)
        }
    }
}
    
if BombFireRate = 30
{
    //= Settings =========  
    shotobject = obj_AlexBombPhial//Bullet
    shotnum = 6  //Number of bullets
    shotdir = 90 //Direction of the burst
    rad = 0 //distence from the Center point
    fireX = x //Startx
    fireY = y //StartY
    shotspeed = 10 //speed of bullet
    shotspread = 90 //Angle of burst (360 = full circle)
           
    //-=[Bullet Spawner]=-
    shotdir -= shotspread / 2
    repeat shotnum 
    {
        b = instance_create(fireX + lengthdir_x(rad, shotdir) ,fireY + lengthdir_y(rad, shotdir),shotobject)   
        b.direction = shotdir
   
        b.speed = shotspeed + random_range(-5,5)

        if shotspread < 360
        {  
           shotdir += shotspread/(shotnum-1)
        }
        else
        {
            shotdir += shotspread/(shotnum)
        }
    }
}
*/
if BombFireRate = 1 //30*2
{
    //= Settings =========   obj_AlexBombFlame
    shotobject = obj_AlexBombPhial//Bullet
    shotnum = 0  //Number of bullets
    shotdir = 90 //Direction of the burst
    rad = 0 //distence from the Center point
    fireX = x //Startx
    fireY = y //StartY
    shotspeed = 10 //speed of bullet
    shotspread = 180 //Angle of burst (360 = full circle)
           
    //-=[Bullet Spawner]=-
    shotdir -= shotspread / 2
    repeat shotnum 
    {
        b = instance_create(fireX + lengthdir_x(rad, shotdir) ,fireY + lengthdir_y(rad, shotdir),shotobject)   
        b.direction = shotdir
        b.speed = shotspeed + random_range(-5,5)

        if shotspread < 360
        {  
           shotdir += shotspread/(shotnum-1)
        }
        else
        {
            shotdir += shotspread/(shotnum)
        }
    }
    
    //= Settings =========   obj_AlexBombPhial
    shotobject = obj_AlexBombPhialNoBounce//Bullet
    shotnum = 6  //Number of bullets
    shotdir = 90 //Direction of the burst
    rad = 0 //distence from the Center point
    fireX = x //Startx
    fireY = y //StartY
    shotspeed = 8 //speed of bullet
    shotspread = 360 //Angle of burst (360 = full circle)
           
    //-=[Bullet Spawner]=-
    shotdir -= shotspread / 2
    repeat shotnum 
    {
        b = instance_create(fireX + lengthdir_x(rad, shotdir) ,fireY + lengthdir_y(rad, shotdir),shotobject)   
        b.direction = shotdir
        b.speed = shotspeed
        b.TimeExplode = 1
        if shotspread < 360
        {  
           shotdir += shotspread/(shotnum-1)
        }
        else
        {
            shotdir += shotspread/(shotnum)
        }
    }
}

if BombFireRate = 60//60+60
{
    with (obj_AlexBombPhial)
    {
        Explode = true
    }
}

if BombFireRate = 100
{
    Bombing = false
    scr_AlexBombInit()
}


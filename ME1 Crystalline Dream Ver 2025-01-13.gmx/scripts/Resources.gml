//Ring burst
//= Settingsrrr =========  
shotnum = 0  //Number of bullets
shotdir = 0 //Direction of the burst
rad = 0 //distence from the Center point
fireX = 0 //Startx
fireY = 0 //StartY
shotspeed = 0 //speed of bullet
shotspread = 0 //Angle of burst (360 = full circle)
shotobject = 0 //Bullet
           
//-=[Bullet Spawner]=-
shotdir -= shotspread / 2
repeat shotnum 
{
    b = instance_create(fireX + lengthdir_x(rad, shotdir) ,fireY + lengthdir_y(rad, shotdir),shotobject)   
    b.direction = shotdir
    shotdir += shotspread/(shotnum)
}

//Random Movement
//X Movement
xcord = x + ceil(random_range(-MoveDist,MoveDist))
if x <= 192 + 200
{
    xcord = xcord + ceil(random_range(50, 100))
}
                    
if x >= 832 - 200
{
    xcord = xcord - ceil(random_range(50, 100))
}
//Y Movement
ycord = y + ceil(random_range(-MoveDist,MoveDist))
if y <= 14 + 200
{
    ycord = ycord + ceil(random_range(50, 100))
}
                    
if y >= 300
{
    ycord = ycord - ceil(random_range(50, 100))
}
//Move Speed
Speed = 4

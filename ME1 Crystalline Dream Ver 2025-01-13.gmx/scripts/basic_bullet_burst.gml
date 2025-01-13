///basic_bullet_burst(obj, num, dir, rad, x, y, speed, slowdown, spread)

//= Settings =========  
shotobject = argument0 //Bullet
shotnum = argument1  //Number of bullets
shotdir = argument2 //Direction of the burst
rad = argument3 //distence from the Center point
fireX = argument4 //Startx
fireY = argument5 //StartY
shotspeed = argument6 //speed of bullet
Slowdown = argument7 //Will the bullets be fired faster but then slow down?
shotspread = argument8 //Angle of burst (360 = full circle)
           
//-=[Bullet Spawner]=-
shotdir -= shotspread / 2
repeat shotnum 
{
    b = instance_create(fireX + lengthdir_x(rad, shotdir) ,fireY + lengthdir_y(rad, shotdir),shotobject)   
    b.direction = shotdir
    if Slowdown = false
    {
        b.speed = shotspeed
    }
    else
    {
        b.MaxSpeed = shotspeed
    }
    
    b.MaxSpeed = shotspeed
    
    if shotspread < 360
    {  
       shotdir += shotspread/(shotnum-1)
    }
    else
    {
        shotdir += shotspread/(shotnum)
    }
}

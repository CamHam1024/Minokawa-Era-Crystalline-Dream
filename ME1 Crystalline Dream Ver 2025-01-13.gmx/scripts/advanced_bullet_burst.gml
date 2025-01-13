///advanced_bullet_burst(obj, x, y, dir, speed, num, xrad, yrad, bulAng, bulDeg)
//Note: if you need this in other projects and not as a function, simply copypaste it
//Fxn by Wish

var bulletObject = argument0;
var centerX = argument1; //center of oval
var centerY = argument2;

var ovalrot = argument3; //oval rotation angle (in degrees)
var ovalrot_S = dsin(ovalrot); //sine of the rotation angle (use sin instead of dsin if radians)
var ovalrot_C = dcos(ovalrot); //sine of the rotation angle (use cos instead of dcos if radians)

var bulletspeed = argument4; //bullet speed for each bullet in the ring
var ringdensity = argument5; //amount of bullets in each ring
var xrad = argument6; //x radius of oval
var yrad = argument7; //y radius of oval

var bulAng = argument8;
var bulDeg = argument9;
 
anglevar = bulDeg / ringdensity; //angle variation per bullet

/*Parametric rotation equation:
(u,v)=(x*cos(?)-y*sin(?),x*sin(?)+y*cos(?))
*/

for(i = 0; i < ringdensity; i++) 
{
    var angle_dis = anglevar * i + bulAng; //angle displacement
    var xfactor = lengthdir_x(xrad,angle_dis); //x and y position on basic oval
    var yfactor = lengthdir_y(yrad,angle_dis);
    var finalX = xfactor * ovalrot_C - yfactor * ovalrot_S; //final x and y after rotation
    var finalY = xfactor * ovalrot_S + yfactor * ovalrot_C;
    //Bullet Creation
    
    b = instance_create(centerX + finalX ,centerY + finalY ,bulletObject)   
    b.direction = point_direction(x, y, x + finalX, y + finalY)
    b.MaxSpeed = bulletspeed
    b.speed = bulletspeed
    
}
return 1;

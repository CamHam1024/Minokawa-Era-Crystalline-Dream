//This creates the surface we will draw the 3d to.
if !surface_exists(Background) 
{
    Background = surface_create(witdh,height)
}

surface_set_target(Background) //Set the drawing target to the 3d surface

draw_clear_alpha(c_black,1) //Clear the surface with all black to avoid trailing
draw_set_color(c_white) //Just incase anything happens to be using a colored draw color, reset it so
//textures won't be drawn with a shade of color.

DirAng = lengthdir_x(0.1, DirMove)
DirAng2D = lengthdir_x(6, DirMove)
//draw_sprite_ext(TEST, 0, 1024/2,768/2,1,1,-DirAng2D, c_white, 1)

d3d_start(); //Begin drawing in 3d mode.

//Camera
//These points are all the coordinates the camera will point to. Moving xto, yto, and zto changes where it looks. 180 is good for a typical
//STG background
xto = x + lengthdir_x(30,direction) * lengthdir_x(1,zdirection)  //Left/Right
yto = y + lengthdir_y(30,direction) * lengthdir_x(1,zdirection) //Forward/Backward
zto = z + lengthdir_y(30,zdirection) //Upward/Downward

d3d_set_projection_ext( x, y, z, xto, yto, zto, 0, 1, 0, fov, ratio, 1, 32000) //This intializes the 3d projection.

//The two main functions you'll be using are d3d_draw_wall and d3d_draw_floor.

//Floor draws a rectangle facing flat, while floor draws a rectangle standing up.

//d3d_draw_wall/floor(xfrom,yfrom,zfrom,xto,yto,zto,texture,horizontalrepeats,verticalrepeats)
//Draws a wall from the specified x,y, and z from values to the specified x,y and z to values. Adjust these as needed.
//Texture is simply the texture we defined in the create event.
//Horizontal repeats is how many times this texture repeats left/right. Adjust this for however many repeats is needed to fill the screen
//Vertical repeats is how many times this texture repeats up/down. Adjust this for however many repeats is needed to fill the screen
//For floors, you want the z from and to values to be the same, so it's flat.
//For walls, depending on how it's facing, you either want the x from and to values to be the same, or the yfrom and to values to be the same
//making the x values the same but the y values not makes the wall vertical, the opposite will make the wall horizontal


/*NoOfWalls = 40
d3d_draw_wall(-204,0,-5,-204,256*NoOfWalls,251,trees,NoOfWalls,1) //Draw the trees as a wall on the left side
d3d_draw_wall(544,0,-5,544,256*NoOfWalls,251,trees,NoOfWalls,1) //Draw the trees as a wall on the right side
d3d_draw_floor(-480,0,-5,32,256*NoOfWalls,-5,grass,2,NoOfWalls) //Draw the grass to the left of the road as a floor
d3d_draw_floor(288,0,-5,800,256*NoOfWalls,-5,grass,2,NoOfWalls) //Draw the grass to the right of the road as a floor
d3d_draw_floor(32,0,-5,288,256*NoOfWalls,-5,road,1,NoOfWalls) //Draw the road as a floor
*/

d3d_transform_add_rotation_x(0)
d3d_model_draw(TestMod, xto, yto, zto, background_get_texture(BG_TEST))
d3d_transform_set_identity()


//3D End
d3d_end() //End the 3d rendering
surface_reset_target() //Reset the surface to the default main surface
draw_surface(Background,0, 0) //Draw the surface at 0,0

//Optionally, I will also draw a colored and transparent gradient here to act as fog for the distance

//MAKE SURE this object has a higher positive depth value than every other object, so it draws the background behind everything


//Other Stuff
Y += 1
Y = y % 256


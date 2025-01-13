///3d Stuff
//Other vars
YPos = 0
DirMove = 0
DirMove_Switch = false

Y = 0

Event_Switch_1 = true
//Initialize the surface the 3d draws to
surf_3d=noone

//Camera Angle:

direction=270+DirMove //While this can be changed, 270 is perfect for STG backgrounds, and is only ever really changed if you want the camera to look around

zdirection= 30 //This is the angle the camera is at. Here's an idea of what the values mean 50
//0: Looking straight ahead, generally not what you want for an STG background
//~12: Looking somewhat downward, good if you want to be able to see the background far into the distance
//30: Looking pretty decently down, about the angle the camera looks at in BPoHC's shrine road stages.

//Positioning

x= 256/2 //This can be changed to effect where the camera is along the left-right axis

StartY = 500
y=StartY //Pretty useless since the camera is usually gonna be moving along this axis constantly regardless

z= 500 //This is how high up the camera is, play around with it to get what you want. The best way to visualize it though would be to imagine 296 1,204
//a square so many pixels high, but perpendicular to the screen, that's how high up the camera will be.

//View4
witdh = room_width  
height = room_height
ratio=witdh/height //Set this to whatever the width and height of the game window is. In my case it's 320/480, not 640 since Phantasmagoria games split

//Draw surface

//the screen in half.
fov=45 //You can change this, but I would leave it alone unless you want to get effects like Chouki's stage.

//Textures, define all the textures you will need. Make sure every texture is a multiple of 8, so 8x8, 16x16, 256x256, 512x512x 1024x1024 etc.
//Also make sure you tick off "this is iused for 3D"

road=sprite_get_texture(spr_road,0) //This is the shrine's road
grass=sprite_get_texture(spr_Grass,0) //This is the grass around the road
trees=sprite_get_texture(spr_trees,0) //This is the trees

//Model Init
/*
Thing = d3d_model_create()
d3d_model_load(Thing,"THING.gmmod")*/

TestMod = d3d_model_create()
d3d_model_load(TestMod,"Bridgeoftruth.gmmod")

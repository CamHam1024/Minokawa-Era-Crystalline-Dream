#define scr_InitShouBackground
///Shou Spell Background

//Init variables
Direction1 = 0
DirPos = 0

cycle = 0

#define scr_ShouBackground
//background
draw_sprite(spr_ShouBackground, 0, 0, 0)

//Bird Ring 2
DirPos1 = 0
NoOfBirds1 = 10
Scl1 = 2
BRD1 = 400 //Bird Ring Distance

repeat(NoOfBirds1)
{
    draw_sprite_ext(spr_ShouBird, 0, 1024/2 + lengthdir_x(BRD1, DirPos1 - Direction1), 768/2 + lengthdir_y(BRD1, DirPos1 - Direction1), -Scl1, -Scl1, DirPos1 - Direction1+65, c_white, 0.5)
    DirPos1 += 360/NoOfBirds1
}

//Static
draw_sprite_ext(spr_C, cycle, 0, 0,   1, 1, 0, c_white, 0.07)

cycle += 0.2

//Bird Ring 1
DirPos = 0
NoOfBirds = 10
Scl = 1
BRD = 120 //Bird Ring Distance

repeat(NoOfBirds)
{
    draw_sprite_ext(spr_ShouBird, 0, 1024/2 + lengthdir_x(BRD, DirPos + Direction1), 768/2 + lengthdir_y(BRD, DirPos + Direction1), Scl, Scl, DirPos + Direction1+65, c_white, 0.2)
    DirPos += 360/NoOfBirds
}

Direction1 += 0.05
Direction1 = Direction1 % 360

//Vignette
draw_sprite(spr_ShouVignette, 0, 0, 0)
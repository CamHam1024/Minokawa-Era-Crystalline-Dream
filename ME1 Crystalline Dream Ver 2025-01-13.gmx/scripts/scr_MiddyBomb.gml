BombFireRate += 1
if BombFireRate = 1
{
    instance_create(x, y, obj_MiddyBombHandler)
}
    
if BombFireRate = 240
{
    Bombing = false
    scr_MiddyBombInit()
}


BombFireRate += 1
if BombFireRate = 1
{
    instance_create(x, y, obj_TsubaBombHandler)
}
    
if BombFireRate = 240 + 120
{
    Bombing = false
    scr_TsubaBombInit()
}


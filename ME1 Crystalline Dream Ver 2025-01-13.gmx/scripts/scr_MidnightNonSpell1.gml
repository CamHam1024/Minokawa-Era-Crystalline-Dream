if global.SpellcardHealth <= 0
{
    //Kill remaining health
    global.SpellcardHealth = 0
            
    if SpellcardDead = false  //Onetime Switch for when the boss dies
    {
        MoveRate = 0
        xcord = 512
        ycord = 250
        Speed = 8
        
        //SpellRing Disburse
        with(obj_SpellcardSpawner)
        {
            instance_destroy()
        }
        
        //BulletKill
        ClearBullets = true
        
        if instance_exists(obj_MiddyChainSpawner1)
        {
            with (obj_MiddyChainSpawner1 ){instance_destroy()}
        }
        
        if instance_exists(obj_ParDanmaku)
        {
            with (obj_ParDanmaku){Deadly = false}
        }
        
        if instance_exists(obj_ParLaser)
        {
            with (obj_ParLaser){Deadly = false}
        }
        
        //Next Spell
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        global.SpellcardType = "NonSpell"
        alarm[0] = 60
        
        //Items droped
        scr_BossDrops()
        
        //Onetime switch
        SpellcardDead = true
    }
}
    
//If Times up
if global.SpellcardTimeSec = 0 and global.SpellcardTimeMiliSec = 0
    {
        global.SpellTimerActive = false
        global.SpellcardHealth = 0
    }
    
//Attack 
if SpellcardDead = false
{
    global.SpellcardBulletRes = 1
    global.SpellcardBombRes = 1
    global.SpellTimerActive = true
    
    if PauseTimer < 40
    {
        PauseTimer += 1
    }
    else
    {
        PrimFire += 1
        PrimFire = PrimFire % 5
        if PrimFire = 1
        {
            if Type = 0
            {
                Chain = instance_create(160, 50+ChainY, obj_MiddyChainSpawner1)
                Chain.Dir = -10
                Chain.FireRate = FireRate
                ChainY += 50
            }
            if Type = 1
            {
                //instance_create(1024-160, 100+ChainY, obj_MiddyChainSpawner1)
                //ChainY += 30
                Chain = instance_create(1024-160, 50+ChainY, obj_MiddyChainSpawner1)
                Chain.Dir = 190
                Chain.FireRate = FireRate
                ChainY += 50
            }
            if ChainY = 50*3
            {
                ChainY = 0
                Type = !Type
                Rand_Movement_Improved(50, 100, 100, 300, 10)
                PauseTimer = -60
            }
            
        }
    }
}


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
        
        if instance_exists(obj_MiddyChainSpawner2)
        {
            with (obj_MiddyChainSpawner2){instance_destroy()}
        }
        
        ClearBullets = true
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
    
    if PauseTimer < 30
    {
        PauseTimer += 1
    }
    else
    {
        PrimFire += 1
        PrimFire = PrimFire % 40
        if PrimFire = 1
        {
            if Type = 0
            {
                Chain = instance_create(160, random_range(50,200)+ChainY, obj_MiddyChainSpawner2)
                Chain.Dir = -10
                Chain.FireRate = FireRate
                ChainY = 0
            }
            if Type = 1
            {
                //instance_create(1024-160, 100+ChainY, obj_MiddyChainSpawner1)
                //ChainY += 30
                Chain = instance_create(1024-160, random_range(50,200)+ChainY, obj_MiddyChainSpawner2)
                Chain.Dir = 190
                Chain.FireRate = FireRate
                ChainY = 0
            }
            Type = !Type
        }
        
        if BurstNumber < 3
        { 
           SecFire += 1
           SecFire = SecFire % 10
           if SecFire = 1
           {
                SecShotDir = 0
                BurstNumber += 1
                repeat(SecShotNumb)
                {
                    RingBul = instance_create(x, y, obj_MiddySecondary)
                    RingBul.Host = id
                    RingBul.direction = SecShotDir
                    RingBul.MaxLength = Length
                    RingBul.type = Type1
                    SecShotDir += 360/SecShotNumb
                }
                Type1 = !Type1
                Length += 30
            }
        }
        else
        {
            MovementPause += 1
            if MovementPause = 120
            {
                Rand_Movement_Improved(50, 100, 100, 300, 10)
                Length = 100
            }
            
            if MovementPause = 240
            {
                BurstNumber = 0
                Type1 = 0
                MovementPause = 0
            }
        }
    }
}


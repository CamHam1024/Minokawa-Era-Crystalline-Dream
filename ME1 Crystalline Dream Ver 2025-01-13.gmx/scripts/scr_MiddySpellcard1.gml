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
        if instance_exists(obj_ParDanmaku)
        {
            with (obj_ParDanmaku){Deadly = false}
        }
        
        if instance_exists(obj_MiddySpellspawner1)
        {
            with (obj_MiddySpellspawner1){instance_destroy()}
        }
        
        if instance_exists(obj_MiddyWarningSpawner)
        {
            with (obj_MiddyWarningSpawner){instance_destroy()}
        }
        
        if instance_exists(obj_MiddyWarning)
        {
            with (obj_MiddyWarning){SuperKill = true}
        }
        
        if instance_exists(obj_MiddyCharm)
        {
            with (obj_MiddyCharm){Killed = true}
        }
        
        //Next Spell
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        global.SpellcardType = "NonSpell"
        global.RemainingSpellcards -= 1
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
    if PauseTimer < 120
    {
        PauseTimer += 1
    }
    else
    {
        global.SpellcardBulletRes = 1
        global.SpellcardBombRes = 1
        global.SpellTimerActive = true
        
        if SecAttack = true
        {
            SecondaryFire += 1
            SecondaryFire = SecondaryFire % 380
            if SecondaryFire = 1
            {
                Charge = instance_create(x, y, obj_BossBigCharge)
                Charge.host = id
                Charge.Hue = 150
            }
            
            if SecondaryFire = 60
            {
                SW = 5
                ChainDisburse = DisburseRatio/noOfChains
                
                Chain = instance_create(512, 0, obj_MiddyWarningSpawner)
                Chain.direction = 270 + random_range(-RNDInc,RNDInc)
            
                repeat(noOfChains)
                {
                    Chain = instance_create(512+ChainDisburse, 0, obj_MiddyWarningSpawner)
                    Chain.direction = 270 + random_range(-RNDInc,RNDInc)
                    Chain.StartWait = SW
                    
                    Chain = instance_create(512-ChainDisburse, 0, obj_MiddyWarningSpawner)
                    Chain.direction = 270 + random_range(-RNDInc,RNDInc)
                    Chain.StartWait = SW
                        
                    SW += 5
                    ChainDisburse += DisburseRatio/noOfChains
                }
            }
            
            if SecondaryFire = 80
            {
                if global.Diff = "Hard" or global.Diff = "Flightless"
                {
                    Chain = instance_create(200, 0, obj_MiddyWarningSpawner)
                    Chain.direction = point_direction(Chain.x, Chain.y, obj_ParPlayer.x, obj_ParPlayer.y)
                
                    Chain = instance_create(1024-200+random_range(-10, 10), 0, obj_MiddyWarningSpawner)
                    Chain.direction = point_direction(Chain.x, Chain.y, obj_ParPlayer.x, obj_ParPlayer.y)
                } 
            }
            
        }
        if Phase = 0
        {
            RingFire += 1
            RingFire = RingFire % 120
            if RingFire = 1
            {
                MiddyRing = instance_create(x, y, obj_MiddySpellspawner1)
                MiddyRing.Type = Type
                
                RingNumber += 1
                //Type = !Type
            }
            
            if RingNumber = 2
            {
                Phase = 0.5 
            }
        }
        
        if Phase = 0.5 
        {
            Wait += 1
            WT = 20
            if Wait = WT
            {
                SecAttack = true
                Rand_Movement_Improved(50, 100, 200, 300, 8)
            }
            
            if Wait = WT*2
            {
                RingNumber = 1 
                Type = 1
                Wait = 0
                Phase = 1
            }
        }
        
        if Phase = 1
        {
            RingFire += 1
            RingFire = RingFire % 120
            if RingFire = 1
            {
                MiddyRing = instance_create(x, y, obj_MiddySpellspawner1)
                MiddyRing.Type = Type
                
                RingNumber += 1
                //Type = !Type
            }
            
            if RingNumber = 2
            {
                Phase = 1.5 
            }
        }
        
        if Phase = 1.5 
        {
            Wait += 1
            WT = 20
            if Wait = WT
            {
                SecAttack = true
                Rand_Movement_Improved(50, 100, 200, 300, 8)
            }
            
            if Wait = WT*2
            {
                RingNumber = 1 
                Type = 0
                Wait = 0
                Phase = 0
            }
        }
    }
}


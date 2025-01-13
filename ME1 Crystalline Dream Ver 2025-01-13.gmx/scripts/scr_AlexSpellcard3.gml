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
        
        if instance_exists(obj_ParLaser)
        {
            with (obj_ParLaser){Deadly = false}
        }
        
        if instance_exists(obj_AlexLamp)
        {
            with(obj_AlexLamp){instance_destroy()}
        }
        
        //Reset Values
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        global.RemainingSpellcards -= 1
        
        //Next Spell
        if KillTimer < 30
            {
                KillTimer += 1
            }
            else
            {
                global.SpellcardType = "NonSpell"
            }
            
            Explosion = instance_create(x, y, obj_BossDefeatedExplosion)
            Explosion.ScreenShake = true
            Explosion.DeathDialog = PostDialog
        
        //Items droped
        scr_BossDrops()
        
        //Onetime switch
        SpellcardDead = true
    }
    //Non One Time Check=================
    if ClearDirection >= 1000
    {
        //instance_destroy()
    }
        
    //===================================
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
    if point_distance(x, y, xcord, ycord) < 1
    {
        //Setting=Up======================
         if SetUpTimer <= 80
         {
            if SetUpTimer = 0
            {
                //instance_create(x, y, obj_MiniBossCharge)
                //instance_create(x, y, obj_BossCharge)
                Lamp = instance_create(x, y, obj_AlexLamp)
                Lamp.xcord = 1024/2
                Lamp.ycord = 150
                Lamp.Speed = 5
            }
            if SetUpTimer = 80-1
            {
                Phase = 0
            }
            
            SetUpTimer += 1
         }
         //================================
         else
         {
         //Attack=(When standing Still)====
         if Phase = 0
         {
            if PhaseTimer0 < 200
            {
                PhaseTimer0 += 1  
            }
            else
            {
                global.SpellcardBulletRes = 1
                global.SpellcardBombRes = 1
                global.SpellTimerActive = true
                Phase = 1
            }
         }
         //================================
         }
    }
    //Attack=(When Moving)============  MovementInc = 0, PhaseTimer = 0, PhaseTimer1 = 0 
    if Phase = 1
    {
    //Movement========================
    //Sprite Animation
    x = StartX //+ lengthdir_x(150, MovementInc)
    y = StartY
    Speed = SpeedIncrease + 2
    enemy_move_correction()
    //===============================
            
        if PhaseTimer1 < 60
        {
            PhaseTimer1 += 1
        }
        else
        {
            if SpeedIncrease < 0.5
            {
                SpeedIncrease += 0.01
            }
            
            MovementInc += SpeedIncrease
            MovementInc = MovementInc % 360
        }
        
        //==Secondary=attack==== + random_range(- 10,10)
        if SecAttackTimer < 120
        {
            SecAttackTimer  += 1
        }
        else
        {
            SecAttack += 1
            SecAttack = SecAttack % 5
            if SecAttack = 1
            {
                basic_bullet_burst(obj_AlexSpell3Rice1, 6, SecDir , 32, x, y, 0, 0, 360)
                
                if global.Diff = "Flightless"
                {
                    basic_bullet_burst(obj_AlexSpell3Large1, 3, SecDir + 30, 32, x, y, 0, 0, 360)
                }
                
                SecDir += 10.1
                SecDir = SecDir % 360
            }
        }
        
        PT2MAX = 500
        if PhaseTimer2 < PT2MAX
        {
            PhaseTimer2 += 1
            if PhaseTimer2 = PT2MAX - 70
            {
                Charge = instance_create(Lamp.x, Lamp.y, obj_BossBigCharge)
                Charge.host = id
                Charge.Hue = 70
            }
        }
        else
        {
            Lamp.CreateLasers1 = true
            Phase = 2
        }
    }
    
    if Phase = 2
    {
        x = StartX //+ lengthdir_x(150, MovementInc)
        y = StartY
        Speed = SpeedIncrease + 2
        enemy_move_correction()
        
        if PhaseTimer3 < 600
        {
            PhaseTimer3 += 1
            if PhaseTimer3 = 530
            {
                Charge = instance_create(x, y, obj_BossBigCharge)
                Charge.host = id
                Charge.Hue = 200
            }
        }
        else
        {
            PhaseTimer1 = 60 - 30
            PhaseTimer2 = 120 - 30
            PhaseTimer3 = 0
            SpeedIncrease = 0
            Phase = 1
        }
    }
    //=================================
}


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
            with (obj_ParDanmaku)
            {
                Deadly = false
            }
        }
        
        if instance_exists(obj_ParLaser)
        {
            with (obj_ParLaser)
            {
                Deadly = false
                instance_destroy()
            }
        }
        
        //Reset Values
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        global.RemainingSpellcards -= 1
        
        //Next Spell
        //if global.Diff = "Easy" or global.Diff = "Normal"
        //{
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
        //}
        //else
        //{
        //    global.SpellcardType = "NonSpell"
        //    alarm[0] = 60
        //}
        
        //Items droped
        scr_BossDrops()
        
        //Onetime switch
        SpellcardDead = true
    }
    //Non One Time Check=================
    if global.Diff = "Easy" or global.Diff = "Normal"
        {
            if ClearDirection >= 1000
            {
                //instance_destroy()
            }
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
        //Spellcarding=====================
         Time = 80
         if SetUpTimer < Time
         {
            if SetUpTimer = 0
            {
                //instance_create(x, y, obj_MiniBossCharge)
                //instance_create(x, y, obj_BossCharge)
            }
            if SetUpTimer = Time-1
            {
                Phase = 1
            }
            
            SetUpTimer += 1
         }
         //================================
         else
          {
            global.SpellcardBulletRes = 1
            global.SpellcardBombRes = 1
            global.SpellTimerActive = true
             //Attack=(When Standing Still)====
             if Phase = 0.1
             {
                xcord = 512
                ycord = 250
                Speed = 8
                
                if PhaseTimer < 10
                {
                    PhaseTimer += 1
                }
                else
                {
                    PhaseTimer = 0
                    Phase = 0.5
                }
             }
             
             if Phase = 0.5
             {
                
                if PhaseTimer = 0
                {
                    Charge = instance_create(x, y, obj_BossBigCharge)
                    Charge.host = id
                    Charge.Hue = 200
                    PhaseTimerSwitch = true
                }
                
                if PhaseTimer < 80
                {
                    PhaseTimer += 1
                }
                else
                {
                    PhaseTimer = 0
                    Phase = 1
                }
                
             }
             if Phase = 1
             {
                    Fire += 1
                    Fire = Fire % 2
                    if Fire = 1
                    {
                        if Dir < 300
                        {
                            basic_bullet_burst(obj_AlexSpell2Rice1, 3, -70 + random_range(-3, 3) + Dir, 30, x, y, 1, 0, 10)
                            basic_bullet_burst(obj_AlexSpell2Rice1, 3, 180 + 70 + random_range(-3, 3) - Dir, 30, x, y, 1, 0, 10)
                            Dir += 300/30
                        }
                        else
                        {
                            Fire = 0
                            Timer += 1
                            if Timer = 60
                            {
                                Timer = 0
                                Phase = 2
                                Dir = 0
                            }
                        }
                    }
                
             }
             //================================
         }
          
    }
    //Attack=(When Moving)=============
    if Phase = 2
    {
        if Burst < BurstNumb and BurstNumb < BNLimit
        {
            Fire += 1
            Fire = Fire % 5
            if Fire = 1
            {
                basic_bullet_burst(obj_AlexSpell2LargeRice1, 1, -random_range(-30, 210), 30, x, y, 3, 0, 360)
                //Burst += 1
                BurstNumb += 1
            }
            
            MovementChange += 1
            MovementChange = MovementChange % 2
            if MovementChange = 1
            {
                Rand_Movement_Improved(30, 50, 50, 300, 5)
            }
        }
        
       /* if Burst = BurstNumb
        {
            ResetTimer += 1
            if ResetTimer = 30
            {
                BurstNumb += 1
                Burst = 0
                ResetTimer = 0
            }
        }*/
        
        if BurstNumb = BNLimit
        {
            Timer2 += 1
            if Timer2 = 60
            {
                Timer2 = 0
                BurstNumb = 2
                ResetTimer = 0
                Burst = 0
                Phase = 0.1
            }
        }
    }
    //=================================
}

